<?xml version="1.0" encoding="utf-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="com.Yanyou.util.*, com.Yanyou.entity.*,java.util.ArrayList"%>
<%
	String id = (String) request.getAttribute("id");
	DB db = new DB();
	ArrayList<Comment> list = new ArrayList<Comment>();
	session.setAttribute("postId", id);
	list = db.getAllComment(id);
	Post post = db.getOnePost(id);
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=post.getTitle()%></title>
</head>
<body>

	<div style="text-align: center;" style="margin: 0 auto;">
		<h1>
			标题：<%=post.getTitle()%>
	</div>
	<div onclick="window.open('forumHomepage.jsp')"
		style="position: relative; right: 3%; top: 1%; float: right;">
		<h2>返回</h2>
		<br /> <br /> <br />
	</div>
	<div>
		<h5><%=post.getAuthor()%></h5>
		<h5><%=post.getDate()%></h5>
		<pre><%=post.getContent()%></pre>
		<hr></hr>
		<hr></hr>
	</div>

	<%
		int i = 0;
		for (Comment c : list) {
	%>
	<div>
		<pre><%=c.getContent()%></pre>
		<div>
			<h5><%=++i%>楼
				<%=c.getAuthor()%>
				<%=c.getDate()%>
			</h5>
		</div>
		<hr></hr>
	</div>
	<%
		}
	%>


	<div style="text-align: center;">
		<form action="CommentServlet" method="post">
			<textarea type="text" placeholder="评论内容"
				style="width: 500px; height: 300px" name="content"></textarea>
			<input type="submit" value="评论" />
		</form>
	</div>



</body>
</html>