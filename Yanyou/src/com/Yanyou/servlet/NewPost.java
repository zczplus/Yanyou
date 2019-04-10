package com.Yanyou.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Yanyou.entity.Post;
import com.Yanyou.util.DB;

@WebServlet("/NewPost")
public class NewPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NewPost() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		DB db = new DB();
		String id = request.getParameter("id");
		System.out.println(id);
		request.setAttribute("id", id);
		request.getRequestDispatcher("newPost.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
