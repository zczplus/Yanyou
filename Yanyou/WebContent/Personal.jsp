<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.io.*, com.Yanyou.entity.*, com.Yanyou.util.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>头像上传显示</title>
</head>
<body>
	<%
		User user = (User) session.getAttribute("user");
		String visa = (String) session.getAttribute("visa");
		DB db = new DB();
		user.setAvatar(db.getAvatar(user.getName()));
	%>

	<%
		if (visa.equals("no") || visa.equals(" ")) {
			response.sendRedirect("sign.jsp");
		}
	%>
	<h1><%=user.getName()%></h1>
	<form method="post" enctype="multipart/form-data" action="fup">
		File to upload: <input type="file" name="upfile"><br /> Notes
			about the file: <input type="text" name="note"><br /> <br />
				<input type="submit" value="Press"> 上传你的图片！ 
	</form>
	<%
		if (!user.getAvatar().equals(" ")) {
	%><img
		src="http://localhost:8080/Yanyou/images/avatar/<%=user.getAvatar()%>"
		alt="" />
	<%
		}
	%>

</body>
</html>