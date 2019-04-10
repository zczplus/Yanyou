<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.io.*, com.Yanyou.entity.*"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>key</title>
<html lang="en" class="no-js">
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8" />
<title>Yanyou</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />

	<!-- GLOBAL MANDATORY STYLES -->
	<link
		href="http://fonts.googleapis.com/css?family=Hind:300,400,500,600,700"
		rel="stylesheet" type="text/css">
		<link href="vendor/simple-line-icons/css/simple-line-icons.css"
			rel="stylesheet" type="text/css" />
		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"
			type="text/css" />

		<!-- PAGE LEVEL PLUGIN STYLES -->
		<link href="css/animate.css" rel="stylesheet">
			<link href="vendor/swiper/css/swiper.min.css" rel="stylesheet"
				type="text/css" />
			<link href="vendor/magnific-popup/magnific-popup.css"
				rel="stylesheet" type="text/css" />

			<!-- THEME STYLES -->
			<link href="css/layout.min.css" rel="stylesheet" type="text/css" />

			<!-- Favicon -->
			<link rel="shortcut icon" href="favicon.ico" />
</head>
<!-- END HEAD -->

<!-- BODY -->
<body id="body" data-spy="scroll" data-target=".header">
	<%
		User user = (User) session.getAttribute("user");
		String visa = (String) session.getAttribute("visa");
	
		if (visa.equals("no") || visa.equals(" ")) {
			response.sendRedirect("sign.jsp");
		}

		Integer x = (Integer) session.getAttribute("views");

		/* Integer number = (Integer) application.getAttribute("number");
		if (number != null) {
			number = new Integer(number.intValue() + 1);
			application.setAttribute("number", number);
		} else {
			number = new Integer(1);
			application.setAttribute("number", number);
		} */
	%>


	<!--========== HEADER ==========-->
	<header class="header navbar-fixed-top"> <!-- Navbar --> <nav
		class="navbar" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="menu-container js_nav-item">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".nav-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="toggle-icon"></span>
			</button>

			<!-- Logo -->
			<div class="logo">
				<a class="logo-wrap" href="#body">
					<h2>Yanyou</h2>
				</a>
			</div>
			<!-- End Logo -->
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse nav-collapse">
			<div class="menu-container">
				<ul class="nav navbar-nav navbar-nav-right">
					<li class="js_nav-item nav-item"><a
						class="nav-item-child nav-item-hover" href="#body"> <%
 	if (!user.getAvatar().equals(" ")) {
 %><img
							src="http://localhost:8080/Yanyou/images/avatar/<%=user.getAvatar()%>"
							alt="" width="40px" height="40px" /> <%
 	}
 %>
					</a></li>
					<li class="js_nav-item nav-item"><div
							class="nav-item-child nav-item-hover">
							你好！<a href="Personal.jsp"><%=user.getName()%></a> 您是第
							<%=x%>
							位访客
						</div></li>
					<li class="js_nav-item nav-item"><a
						class="nav-item-child nav-item-hover" href="#body">主页</a></li>
					<li class="js_nav-item nav-item"><a
						class="nav-item-child nav-item-hover" href="#products">功能</a></li>
					<li class="js_nav-item nav-item"><a
						class="nav-item-child nav-item-hover" href="signup">登出</a></li>
					<li class="js_nav-item nav-item"><a
						class="nav-item-child nav-item-hover" href="#body">在线人数：<%=User.getOnlineNum()%></a></li>


				</ul>
			</div>
		</div>
		<!-- End Navbar Collapse -->
	</div>
	</nav> <!-- Navbar --> </header>
	<!--========== END HEADER ==========-->

	<!--========== SLIDER ==========-->
	<div class="promo-block">
		<div class="container">
			<div class="margin-b-40">
				<h1 class="promo-block-title">欢迎来到研友！!</h1>
				<p class="promo-block-text">
					<%
						Cookie[] cookies = request.getCookies();
						Cookie c = null;
						int i;
						if (cookies != null) {
							for (i = 0; i < cookies.length; i++) {
								c = cookies[i];
								if (c.getName().equals(user.getName())) {
					%>
					Your last visit was at
					<%=c.getValue()%>

					<%
						}
							}
						}
					%>
				</p>
			</div>
			<a
				class="js_popup-youtube btn-theme btn-theme-md btn-white-bg text-uppercase"
				href="http://localhost:8080/Yanyou/signup.jsp" title="Hey!"><i
				class="btn-icon icon-control-play"></i> 签到!</a>
		</div>
	</div>
	<!--========== SLIDER ==========-->

	<!--========== PAGE LAYOUT ==========-->
	<!-- Products -->
	<div id="products">
		<div class="container content-lg">
			<div class="row text-center margin-b-40">
				<div class="col-sm-6 col-sm-offset-3">
					<h2>We fight together!</h2>
					<p>快来看看我有什么宝贝！</p>
				</div>
			</div>
			<!--// end row -->

			<div class="row">
				<!-- Latest Products -->
				<div class="col-sm-4 sm-margin-b-50">
					<div class="margin-b-20">
						<img class="img-responsive wow fadeIn" src="img/970x647/01.jpg"
							alt="Latest Products Image" data-wow-duration=".3"
							data-wow-delay=".1s">
					</div>
					<h4>
						<a href="#">资讯</a> <span class="text-uppercase margin-l-20">News</span>
					</h4>
					<p>网罗丰富信息，你想找的都在这里！</p>
					<a class="link" href="#">Read More</a>
				</div>
				<!-- End Latest Products -->

				<!-- Latest Products -->
				<div class="col-sm-4 sm-margin-b-50">
					<div class="margin-b-20">
						<img class="img-responsive wow fadeIn" src="img/970x647/02.jpg"
							alt="Latest Products Image" data-wow-duration=".3"
							data-wow-delay=".2s"
							onclick="window.location.href='forumHomepage.jsp'">
					</div>
					<h4>
						<a href="forumHomepage.jsp">论坛</a> <span
							class="text-uppercase margin-l-20">Forum</span>
					</h4>
					<p>快来和“研友”们聊聊吧！</p>
					<a class="link" href="forumHomepage.jsp">Read More</a>
				</div>
				<!-- End Latest Products -->

				<!-- Latest Products -->
				<div class="col-sm-4 sm-margin-b-50">
					<div class="margin-b-20">
						<img class="img-responsive wow fadeIn" src="img/970x647/03.jpg"
							alt="Latest Products Image" data-wow-duration=".3"
							data-wow-delay=".3s">
					</div>
					<h4>
						<a href="#">你想要的</a> <span class="text-uppercase margin-l-20">More</span>
					</h4>
					<p>都在这里！</p>
					<a class="link" href="#">Read More</a>
				</div>
				<!-- End Latest Products -->
			</div>
			<!--// end row -->
		</div>


		<!-- End Links -->
		<!-- Copyright -->
		<div class="content container">
			<div class="row">
				<div class="col-xs-6">
					<h2>Yanyou</h2>
				</div>
				<div class="col-xs-6 text-right">
					<p class="margin-b-0">
						<a class="fweight-700" href="">Yanyou</a> zcz&tr
					</p>
				</div>
			</div>
			<!--// end row -->
		</div>
		<!-- End Copyright -->
		</footer>
		<!--========== END FOOTER ==========-->

		<!-- Back To Top -->
		<a href="javascript:void(0);" class="js-back-to-top back-to-top">Top</a>

		<!-- JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
		<!-- CORE PLUGINS -->
		<script src="vendor/jquery.min.js" type="text/javascript"></script>
		<script src="vendor/jquery-migrate.min.js" type="text/javascript"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"
			type="text/javascript"></script>

		<!-- PAGE LEVEL PLUGINS -->
		<script src="vendor/jquery.easing.js" type="text/javascript"></script>
		<script src="vendor/jquery.back-to-top.js" type="text/javascript"></script>
		<script src="vendor/jquery.smooth-scroll.js" type="text/javascript"></script>
		<script src="vendor/jquery.wow.min.js" type="text/javascript"></script>
		<script src="vendor/swiper/js/swiper.jquery.min.js"
			type="text/javascript"></script>
		<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"
			type="text/javascript"></script>
		<script src="vendor/masonry/jquery.masonry.pkgd.min.js"
			type="text/javascript"></script>
		<script src="vendor/masonry/imagesloaded.pkgd.min.js"
			type="text/javascript"></script>


		<!-- PAGE LEVEL SCRIPTS -->
		<script src="js/layout.min.js" type="text/javascript"></script>
		<script src="js/components/wow.min.js" type="text/javascript"></script>
		<script src="js/components/swiper.min.js" type="text/javascript"></script>
		<script src="js/components/maginific-popup.min.js"
			type="text/javascript"></script>
		<script src="js/components/masonry.min.js" type="text/javascript"></script>
		<script src="js/components/gmap.min.js" type="text/javascript"></script>
</body>
<!-- END BODY -->
</html>