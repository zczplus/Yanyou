package com.Yanyou.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Yanyou.entity.Comment;
import com.Yanyou.entity.Post;
import com.Yanyou.entity.User;
import com.Yanyou.util.DB;

@WebServlet("/CommentServlet")
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CommentServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");

		HttpSession session = request.getSession();
		DB db = new DB();

		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd-hh:mm:ss");
		String currentTime = format.format(date);//获取当前时间

		String postId = (String)session.getAttribute("postId");
		System.out.println(postId + "this is what you want");
		String content = (String) request.getParameter("content");
		User user = (User) session.getAttribute("user");
		String author = user.getName();//获取评论归属帖子id、评论内容、作者

		Comment com = new Comment(content, author, currentTime, postId);

		db.addComment(com);
		
		Post post = db.getOnePost(postId);
		request.setAttribute("id", post.getId());

		request.getRequestDispatcher("newPost.jsp").forward(request, response);
	}

}
