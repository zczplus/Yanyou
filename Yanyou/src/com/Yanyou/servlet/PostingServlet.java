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

import com.Yanyou.entity.Post;
import com.Yanyou.entity.User;
import com.Yanyou.util.DB;

@WebServlet("/Posting")
public class PostingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PostingServlet() {
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

		String title = (String) request.getParameter("title");
		String content = (String) request.getParameter("content");
		User user = (User) session.getAttribute("user");
		String author = user.getName();//获取标题、内容、作者

		Post post = new Post(title, content, currentTime, author);

		db.addPost(post);//将post添加到数据库
		
		String id = db.getThisPost(currentTime);
		request.setAttribute("id", id);
		
		request.getRequestDispatcher("newPost.jsp").forward(request, response);
	}

}
