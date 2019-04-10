<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	import="com.Yanyou.util.*, com.Yanyou.entity.*, java.util.ArrayList"%>
<!doctype html>
<!--[if lt IE 7]> <html class="lt-ie9 lt-ie8 lt-ie7" lang="en-US"> <![endif]-->
<!--[if IE 7]>    <html class="lt-ie9 lt-ie8" lang="en-US"> <![endif]-->
<!--[if IE 8]>    <html class="lt-ie9" lang="en-US"> <![endif]-->
<!--[if gt IE 8]><!-->
<html lang="en-US">
<!--<![endif]-->
<head>
<!-- META TAGS -->
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>论坛</title>

<link rel="shortcut icon" href="images/favicon.png" />




<!-- Style Sheet-->
<link rel="stylesheet" href="style.css" />
<link rel='stylesheet' id='bootstrap-css-css'
	href='css/bootstrap5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='responsive-css-css'
	href='css/responsive5152.css?ver=1.0' type='text/css' media='all' />
<link rel='stylesheet' id='pretty-photo-css-css'
	href='js/prettyphoto/prettyPhotoaeb9.css?ver=3.1.4' type='text/css'
	media='all' />
<link rel='stylesheet' id='main-css-css' href='css/main5152.css?ver=1.0'
	type='text/css' media='all' />
<link rel='stylesheet' id='custom-css-css'
	href='css/custom5152.html?ver=1.0' type='text/css' media='all' />


<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
                <script src="js/html5.js"></script></script>
                <![endif]-->


</head>

<body>
	<%
		String visa = (String) session.getAttribute("visa");
		User user = (User) session.getAttribute("user");
		if (visa != "yes") {
			response.sendRedirect("sign.jsp");
		}
		ArrayList<Comment> listCom = new ArrayList<Comment>();
	%>
	<!-- Start of Header -->
	<div class="header-wrapper">
		<header>
			<div class="container">


				<div class="logo-container">
					<h1 class="welcome-yanyou">
						Hi!<%=user.getName()%>
						Yanyou 论坛欢迎你！
					</h1>

				</div>
			</div>
		</header>
	</div>
	<!-- End of Header -->

	<!-- Start of Search Wrapper -->
	<!-- <div class="search-area-wrapper">
		<div class="search-area container">
			<h3 class="search-header">Which you want?</h3>
			<p class="search-tag-line">If you have any question you can ask
				below or enter what you are looking for!</p>

			<form id="search-form" class="search-form clearfix" method="get"
				action="#" autocomplete="off">
				<input class="search-term required" type="text" id="s" name="s"
					placeholder="Type your search terms here"
					title="* Please enter a search term!" /> <input class="search-btn"
					type="submit" value="Search" />
				<div id="search-error-container"></div>
			</form>
		</div>
	</div> -->
	<!-- End of Search Wrapper -->

	<!-- Start of Page Container -->
	<div class="page-container">
		<div class="container">
			<div class="row">

				<!-- start of page content -->
				<div class="span8 main-listing">
					<form id="search-form" class="search-form clearfix" method="get"
						action="#" autocomplete="off">
						<input class="search-btn" type="button" value="返回"
							onclick="window.open('homepage.jsp')" /> <input
							class="search-btn" type="button" value="发帖"
							onclick="window.open('postingPage.jsp')" />
						<div id="search-error-container"></div>
					</form>
					<%
						DB db = new DB();
						ArrayList<Post> list = db.getAllpost();
						for (int i = 0; i < list.size(); i++) {
					%>
					<article class="format-standard type-post hentry clearfix">

						<header class="clearfix">

							<h3 class="post-title" name="title">
								<a href="NewPost?id=<%=list.get(i).getId()%>"><%=list.get(i).getTitle()%></a>
							</h3>

							<div class="post-meta clearfix">
								<span class="date" name="date"><%=list.get(i).getDate()%></span>
								<span class="category" name="author"><%=list.get(i).getAuthor()%></span>
								<%
									listCom = db.getAllComment(list.get(i).getId());
										int length = listCom.size();
								%>
								<span class="comments"><a href="#"
									title="Comment on Integrating WordPress with Your Website"><%=length%>
										Comments</a></span> <span class="like-count">66</span>
							</div>
							<!-- end of post meta -->

						</header>


					</article>

					<%
						}
					%>
					<!-- 
					<div id="pagination">
						<a href="#" class="btn active">1</a> <a href="#" class="btn">2</a>
						<a href="#" class="btn">3</a> <a href="#" class="btn">Next »</a> <a
							href="#" class="btn">Last »</a>
					</div> -->

				</div>
				<!-- end of page content -->


				<!-- start of sidebar -->
				<aside class="span4 page-sidebar">


					<!-- 

					<section class="widget">
						<h3 class="title">精选文章</h3>
						<ul class="articles">
							<li class="article-entry standard">
								<h4>
									<a href="single.html">Integrating WordPress with Your
										Website</a>
								</h4> <span class="article-meta">25 Feb, 2013 in <a href="#"
									title="View all posts in Server &amp; Database">Server
										&amp; Database</a></span> <span class="like-count">66</span>
							</li>
							<li class="article-entry standard">
								<h4>
									<a href="single.html">WordPress Site Maintenance</a>
								</h4> <span class="article-meta">24 Feb, 2013 in <a href="#"
									title="View all posts in Website Dev">Website Dev</a></span> <span
								class="like-count">15</span>
							</li>
							<li class="article-entry video">
								<h4>
									<a href="single.html">Meta Tags in WordPress</a>
								</h4> <span class="article-meta">23 Feb, 2013 in <a href="#"
									title="View all posts in Website Dev">Website Dev</a></span> <span
								class="like-count">8</span>
							</li>
							<li class="article-entry image">
								<h4>
									<a href="single.html">WordPress in Your Language</a>
								</h4> <span class="article-meta">22 Feb, 2013 in <a href="#"
									title="View all posts in Advanced Techniques">Advanced
										Techniques</a></span> <span class="like-count">6</span>
							</li>
						</ul>
					</section>



					<section class="widget">
						<h3 class="title">分类</h3>
						<ul>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">数学</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">英语</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">政治</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet, ">计算机</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">工商管理</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet,">化学</a></li>
							<li><a href="#" title="Lorem ipsum dolor sit amet, ">其他</a></li>
						</ul>
					</section>

					<section class="widget">
						<h3 class="title">近期评论</h3>
						<ul id="recentcomments">
							<li class="recentcomments"><a href="#"
								rel="external nofollow" class="url">John Doe</a> on <a href="#">Integrating
									WordPress with Your Website</a></li>
							<li class="recentcomments">saqib sarwar on <a href="#">Integrating
									WordPress with Your Website</a></li>
							<li class="recentcomments"><a href="#"
								rel="external nofollow" class="url">John Doe</a> on <a href="#">Integrating
									WordPress with Your Website</a></li>
							<li class="recentcomments"><a href="#"
								rel="external nofollow" class="url">Mr WordPress</a> on <a
								href="#">Installing WordPress</a></li>
						</ul>
					</section>

				</aside>
				end of sidebar
			</div>
		</div>
	</div>
	End of Page Container
 -->





					<!-- script -->
					<script type='text/javascript' src='js/jquery-1.8.3.min.js'></script>
					<script type='text/javascript'
						src='js/jquery.easing.1.34e44.js?ver=1.3'></script>
					<script type='text/javascript'
						src='js/prettyphoto/jquery.prettyPhotoaeb9.js?ver=3.1.4'></script>
					<script type='text/javascript'
						src='js/jquery.liveSearchd5f7.js?ver=2.0'></script>
					<script type='text/javascript' src='js/jflickrfeed.js'></script>
					<script type='text/javascript' src='js/jquery.formd471.js?ver=3.18'></script>
					<script type='text/javascript'
						src='js/jquery.validate.minfc6b.js?ver=1.10.0'></script>
					<script type='text/javascript' src='js/custom5152.js?ver=1.0'></script>
</body>
</html>
