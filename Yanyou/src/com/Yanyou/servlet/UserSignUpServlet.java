package com.Yanyou.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Yanyou.entity.User;
import com.Yanyou.util.*;

/**
 * Servlet implementation class UserSignUpservlet
 */
@WebServlet("/signup")
public class UserSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UserSignUpServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("sign.jsp");
		User user = new User();
		String visa = " ";

		HttpSession session = request.getSession();

		session.setAttribute("user", user);
		session.setAttribute("visa", visa);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");

		DB db = new DB();

		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String check = request.getParameter("checkbox1");

		User user = new User();
		String visa = " ";

		user.setName(name);

		HttpSession session = request.getSession();

		session.setAttribute("user", user);

		if (db.confirm(name, password)) {

			visa = "yes";
			session.setAttribute("visa", visa);

			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd-hh:mm:ss");
			String currentTime = format.format(date);

			Cookie time = new Cookie(name, currentTime);

			Cookie userName = new Cookie("name", name);
			Cookie userPassword = new Cookie("password", password);

			if (check != null) {
				userName.setMaxAge(60 * 60 * 24);
				userName.setPath("/");
				response.addCookie(userName);

				userPassword.setMaxAge(60 * 60 * 24);
				userPassword.setPath("/");
				response.addCookie(userPassword);

			} else {
				userName = new Cookie("name", null);
				userName.setMaxAge(0);
				userName.setPath("/");
				response.addCookie(userName);

				userPassword = new Cookie("password", null);
				userPassword.setMaxAge(0);
				userPassword.setPath("/");
				response.addCookie(userPassword);
			}

			time.setMaxAge(60 * 60 * 24);
			time.setPath("/");

			response.addCookie(time);

			User.setViews(db.getViews("homepage"));
			User.addViews();
			db.setViews("homepage", User.getViews());
			
			user.setAvatar(db.getAvatar(user.getName()));
			session.setAttribute("user", user);
			
			Integer i = User.getViews();
			session.setAttribute("views", i);

			response.sendRedirect("homepage.jsp");
		} else {
			String error = "error!";

			Cookie userName = new Cookie("name", name);
			userName.setMaxAge(60 * 60 * 24);
			userName.setPath("/");
			response.addCookie(userName);

			Cookie userPassword = new Cookie("password", error);
			userPassword.setMaxAge(5);
			userPassword.setPath("/");
			response.addCookie(userPassword);
			visa = "no";

			session.setAttribute("visa", visa);
			response.sendRedirect("sign.jsp");
		}

		System.out.println("User info:name=" + name + " password=" + password);

//		db.close();
	}

}
