package com.Yanyou.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.Yanyou.entity.Comment;
import com.Yanyou.entity.Post;
import com.Yanyou.entity.User;

public class DB {

	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	String user = "root";
	String psw = "root";
	String driver = "com.mysql.jdbc.Driver";

	String url = "jdbc:mysql://localhost:3306/Yanyou?useSSL=false";

	public DB() {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, psw);
			stmt = con.createStatement();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void add(String id, String psw, String email, String phone) {
		String sql = "insert into user(name,password,email,phone) values(?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, psw);
			pstmt.setString(3, email);
			pstmt.setString(4, phone);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public boolean confirm(String id, String password) {
		String sql = "select * from user where name = ?";
		String psw = " ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				psw = rs.getString("password");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (!psw.equals(" ") && psw.equals(password)) {
			System.out.println("true");
			return true;
		} else {
			System.out.println("false");
			return false;
		}
	}

	public void updateAvatar(String id, String avatar) {
		String sql = "update user set avatar = ? where (name =?)";

		try {
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, avatar);
			pstmt.setString(2, id);
			System.out.println(avatar);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

	public String getAvatar(String id) {
		String sql = "select * from user where name = ?";
		String src = " ";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				src = rs.getString("avatar");
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return src;
	}

	public void addPost(Post post) {
		String sql = "insert into post(title,content,date,author) values(?,?,?,?)";
		try {

			System.out.println(post.getTitle());
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getContent());
			pstmt.setString(3, post.getDate());
			pstmt.setString(4, post.getAuthor());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

	public void addComment(Comment comment) {
		String sql = "insert into comment(content,author,date,postId) values(?,?,?,?)";
		try {

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, comment.getContent());
			pstmt.setString(2, comment.getAuthor());
			pstmt.setString(3, comment.getDate());
			pstmt.setString(4, comment.getPostId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

	public ArrayList<Post> getAllpost() {
		String sql = "select * from post";
		ArrayList<Post> list = new ArrayList<Post>();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new Post(rs.getString("id"), rs.getString("title"), rs.getString("content"),
						rs.getString("date"), rs.getString("author")));
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Comment> getAllComment(String postId) {
		String sql = "select*from comment where postId =?";
		ArrayList<Comment> list = new ArrayList<Comment>();
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, postId);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(new Comment(rs.getString("id"), rs.getString("content"), rs.getString("author"),
						rs.getString("date"), rs.getString("postId")));
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return list;
	}

	public Post getOnePost(String id) {
		String sql = "select * from post where id = ?";
		Post post = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				post = new Post(rs.getString("id"), rs.getString("title"), rs.getString("content"),
						rs.getString("date"), rs.getString("author"));
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return post;
	}

	public String getThisPost(String date) {
		String sql = "select * from post where date = ?";
		String id = null;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, date);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				id = rs.getString("id");
			}
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return id;
	}

	public int getViews(String name) {
		String sql = "select * from views where name = ?";
		int v = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				v = rs.getInt("views");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return v;
	}

	public void setViews(String name, int views) {
		String sql = "Update views set views = ? where name = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, views);
			pstmt.setString(2, name);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

	public void close() {
		try {
			con.close();
			stmt.close();
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
