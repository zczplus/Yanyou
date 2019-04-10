<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.io.*, com.Yanyou.entity.*"%>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible"
		contentType="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">

			<title>Sign up</title>
			<link rel="stylesheet"
				href="https://fonts.googleapis.com/css?family=Open+Sans:300,400">
				<!-- Google web font "Open Sans" -->
				<link rel="stylesheet" href="css/font-awesome.min.css">
					<link rel="stylesheet" href="css/bootstrap.min.css">

						<link rel="stylesheet" href="css/demo.css" />
						<link rel="stylesheet" href="css/templatemo-style.css">
							<link rel="stylesheet" href="css/style.css" />

							<script type="text/javascript" src="js/modernizr.custom.86080.js"></script>
</head>

<body>

	<div id="particles-js"></div>

	<ul class="cb-slideshow">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>

	<div class="container-fluid">
		<div class="row cb-slideshow-text-container ">
			<div class="tm-content col-xl-6 col-sm-8 col-xs-8 ml-auto section">


				<div class="container w3layouts agileits">

					<div class="login w3layouts agileits">
						<%
							Cookie[] cookies = request.getCookies();
							Cookie c = null;
							String name = null;
							String password = null;
							int i;
							if (cookies != null) {
								for (i = 0; i < cookies.length; i++) {
									c = cookies[i];

									if (c.getName().equals("name")) {
										name = c.getValue();

									}
									if (c.getName().equals("password")) {
										password = c.getValue();

									}
								}
							}
						%>
						<h2>登 录</h2>
						<h2></h2>
						<form action="signup" method="post">
							<input type="text" name="user.name" placeholder="用户名" required=""
								value="<%if (name != null) {%><%=name%><%}%>" /><input
								type="password" Name="user.password" required=""
								<%if (name != null && !password.equals("error!")) {%>
								placeholder="密码" value="<%=password%>"
								<%} else if (password == null) {%> placeholder="密码"
								<%} else if (password.equals("error!")) {%>
								placeholder="密码错误请重新输入" <%}%> />
							<div class="send-button w3layouts agileits">
								<ul class="tick w3layouts agileits">
									<li><input type="checkbox" id="brand1" name="checkbox1">
											<label for="brand1"><span></span>记住我</label></li>
								</ul>
								<input type="submit" value="登 录"
									onclick="return confirm('Yes/No')">
							</div>
						</form>

						<div class="send-button w3layouts agileits">

							<input type="button" value="注册"
								onclick="javascrtpt:window.location.href='registered.html'">
						</div>
						<div class="clear"></div>

						<div class="clear"></div>
					</div>

					<div class="clear"></div>

				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="js/particles.js"></script>
<script type="text/javascript" src="js/app.js"></script>
</html>