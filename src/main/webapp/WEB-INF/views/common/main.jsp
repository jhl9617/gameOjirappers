<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML>

<html>
	<head>
		<title>겜지라퍼</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />		<%--css 스타일 가져오기--%>

	<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
	<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/breakpoints.min.js"></script>
		<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/browser.min.js"></script>
	<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/util.js"></script>
	<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/main.js"></script>





<body class="is-preload">

<!-- Wrapper -->
<div id="wrapper">

	<!-- Main -->
	<div id="main">
		<div class="inner">

			<!-- Header -->
			<header id="header">
				<h1><a href="" class="logo"><strong>겜지라퍼</strong> by team 404</a></h1>
				<ul class="icons">
					<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
					<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
					<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
					<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
					<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
				</ul>
			</header>

			<!-- Banner -->
			<section id="banner">
				<div class="content">
					<header>
						<h1>Hi, I’m Editorial<br />
							by HTML5 UP</h1>
						<p>A free and fully responsive site template</p>
					</header>
					<p>Aenean ornare velit lacus, ac varius enim ullamcorper eu. Proin aliquam facilisis ante interdum congue. Integer mollis, nisl amet convallis, porttitor magna ullamcorper, amet egestas mauris. Ut magna finibus nisi nec lacinia. Nam maximus erat id euismod egestas. Pellentesque sapien ac quam. Lorem ipsum dolor sit nullam.</p>
					<ul class="actions">
						<li><a href="#" class="button big">Learn More</a></li>
					</ul>
				</div>
				<span class="image object">
										<img src="<c:url value="/resources/images/main1.webp"/>" alt="" />
									</span>
			</section>

			<!-- Section -->
			<section>
				<header class="major">
					<h2>Erat lacinia</h2>
				</header>
				<div class="features">
					<article>
						<span class="icon fa-gem"></span>
						<div class="content">
							<h3>Portitor ullamcorper</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
						</div>
					</article>
					<article>
						<span class="icon solid fa-paper-plane"></span>
						<div class="content">
							<h3>Sapien veroeros</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
						</div>
					</article>
					<article>
						<span class="icon solid fa-rocket"></span>
						<div class="content">
							<h3>Quam lorem ipsum</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
						</div>
					</article>
					<article>
						<span class="icon solid fa-signal"></span>
						<div class="content">
							<h3>Sed magna finibus</h3>
							<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
						</div>
					</article>
				</div>
			</section>

			<!-- Section -->
			<section>
				<header class="major">
					<h2>Best Game</h2>
				</header>
				<div class="posts">
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/1.jpg"/>" alt="" /></a>
						<h3>red dead redemption2</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/2.jpg"/>" alt="" /></a>
						<h3>Nulla amet dolore</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/ph2.jpg"/>" alt="" /></a>
						<h3>Tempus ullamcorper</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/4.jpg"/>" alt="" /></a>
						<h3>Sed etiam facilis</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/5.jpg"/>" alt="" /></a>
						<h3>Feugiat lorem aenean</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/6.jpg"/>" alt="" /></a>
						<h3>Amet varius aliquam</h3>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
				</div>
			</section>

		</div>
	</div>

	<!-- Sidebar -->
	<c:import url="/WEB-INF/views/common/sidebar.jsp" />

</div>

</body>




</html>