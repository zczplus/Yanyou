<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="java.util.*, java.io.*, com.Yanyou.entity.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Posting</title>
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
	%>
	<%=user.getName()%>
	<form method="post" action="Posting">

		<input type="text" name="title" placeholder="请输入标题"></input><br />

		<textarea style="width: 500px; height: 300px" name="content"
			placeholder="请输入正文"></textarea>
		<br /> <input type="submit" value="发表"> <input type="button"
			onclick="window.location.href='forumHomepage.jsp'" value="返回" />
	</form>
</body>
</html>