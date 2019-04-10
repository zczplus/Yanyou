package com.Yanyou.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Yanyou.util.DB;
import com.Yanyou.entity.*;

@WebServlet("/registered")
public class UserRegisteredServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserRegisteredServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");

		DB db = new DB();

		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String coPassword = request.getParameter("coPassword");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		System.out.println(password);
		System.out.println(coPassword);

		if (password.equals(coPassword)) {
			db.add(name, password, email, phone);
			System.out.println("success!");
		}
		if (password.equals(coPassword)) {
			User user = new User();
			
			user.setName(name);
			user.setPassword(password);
			
			HttpSession session = request.getSession();
			String visa = "yes";
			
			session.setAttribute("user", user);
			session.setAttribute("visa", visa);
			
			request.getRequestDispatcher("homepage.jsp").forward(request, response);
		} else {
			PrintWriter outx=response.getWriter();
			outx.print("<script language='javascript'>alert('请重新确认密码！');window.location.href='registered.html';</script> ");
		}

	}

}
