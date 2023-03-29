<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML>

<html>
	<head>

		<title>GameOjirap</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />		<%--css 스타일 가져오기--%>
	</head>
	<!-- Scripts -->
<%--	<script type="text/javascript" src="<c:url value="/resources/js/jquery-3.6.3.min.js">"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/browser.min.js">"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/breakpoints.min.js">"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/util.js">"></script>
	<script type="text/javascript" src="<c:url value="/resources/js/main.js">"></script>
--%>



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
						<h1>겜지라퍼<br />
							게임 이야기 하기</h1>
						<p></p>
					</header>
					<p></p>
					<ul class="actions">
						<li><a href="${pageContext.servletContext.contextPath}/moveGameDetail.do" class="button big">Learn More</a></li>
					</ul>
				</div>
				<span class="image object">
				<img src="<c:url value="/resources/images/main1.webp"/>" alt="" />
				</span>
			</section>



			<!-- Section -->
			<section>
				<header class="major">
					<h2>Best Game</h2>
				</header>
				<div class="posts">
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/1.jpg"/>" alt="" /></a>
						<h3>게임이름 넣을것</h3>
						<!-- <p>게임 요약 없음</p> -->
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/1.jpg"/>" alt="" /></a>
						<h3>게임이름 넣을것</h3>
						<!-- <p>게임 요약 없음</p> -->
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
				</div>					

					<div style="text-align: center;"><!-- 페이지 표시 영역 -->
							<!-- 1페이지로 이동하는 버튼 -->
							<c:if test="${ currentPage eq 1 }">
								☜☜ &nbsp;
							</c:if>
							<c:if test="${ currentPage > 1 }">
								<c:url var="p1" value="">
									<c:param name="page" value="1" />
								</c:url>
								<a href="${ p1 }"> ☜☜ </a> &nbsp;
							</c:if>
							
							<!-- 이전 페이지그룹으로 이동하는 버튼 -->
						   <c:if test="${ !((currentPage - 10) >= 1) }">
						      ☜ &nbsp;
						   </c:if>
						   <c:if test="${ (currentPage - 10) >= 1 }">
						      <c:url var="pbefore" value="">
						         <c:param name="page" value="${ startPage - 1 }" />
						      </c:url>
						      <a href="${ pbefore }">☜</a> &nbsp;
						   </c:if>
							<!-- 현재 페이지가 속한 페이지 그룹 페이지 숫자 출력 -->
							
							<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
								<c:if test="${ p eq currentPage }">
									<font size="4" color="red">[${ p }]</font>
								</c:if>
								<c:if test="${ p ne currentPage }">
									<c:url var="pp" value="">
									<c:param name="page" value="${ p }" />
								</c:url>
									<a href="${ pp }">${ p }</a>
								</c:if>
							</c:forEach>
							
							<!-- 다음 페이지그룹으로 이동하는 버튼 -->
						   <c:if test="${ !((startPage + 10) <= maxPage) }">
						      ☞ &nbsp;
						   </c:if>
						   <c:if test="${ (startPage + 10) <= maxPage }">
						      <c:url var="pafter" value="">
						         <c:param name="page" value="${ startPage + 10 }" />
						      </c:url>
						      <a href="${ pafter }">☞</a> &nbsp;
						   </c:if>
							
							<!-- 끝 페이지로 이동하는 버튼 -->
							<c:if test="${ currentPage eq maxPage }">
								☞☞ &nbsp;
							</c:if>
							<c:if test="${ currentPage < maxPage }">
								<c:url var="pmax" value="">
									<c:param name="page" value="${maxPage}" />
								</c:url>
								<a href="${ pmax }"> ☞☞ </a> &nbsp;
							</c:if>
						</div>
					
					


			</section>
			<!-- Section -->
			<section>
				<header class="major">
					<h2> New Game </h2>
				</header>
<!--  				<div class="features"> -->
				<div class="posts">
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/1.jpg"/>" alt="" /></a>
						<h3>게임이름 넣을것</h3>
						<!-- <p>게임 요약 없음</p> -->
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/1.jpg"/>" alt="" /></a>
						<h3>게임이름 넣을것</h3>
						<!-- <p>게임 요약 없음</p> -->
						<ul class="actions">
							<li><a href="#" class="button">More</a></li>
						</ul>
					</article>
					
				</div>
					<div style="text-align: center;"><!-- 페이지 표시 영역 -->
							<!-- 1페이지로 이동하는 버튼 -->
							<c:if test="${ currentPage eq 1 }">
								☜☜ &nbsp;
							</c:if>
							<c:if test="${ currentPage > 1 }">
								<c:url var="p1" value="">
									<c:param name="page" value="1" />
								</c:url>
								<a href="${ p1 }"> ☜☜ </a> &nbsp;
							</c:if>
						<!-- 이전 페이지그룹으로 이동하는 버튼 -->
						   <c:if test="${ !((currentPage - 10) >= 1) }">
						      ☜ &nbsp;
						   </c:if>
						   <c:if test="${ (currentPage - 10) >= 1 }">
						      <c:url var="pbefore" value="">
						         <c:param name="page" value="${ startPage - 1 }" />
						      </c:url>
						      <a href="${ pbefore }">☜</a> &nbsp;
						   </c:if>
							<!-- 현재 페이지가 속한 페이지 그룹 페이지 숫자 출력 -->
							
							<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
								<c:if test="${ p eq currentPage }">
									<font size="4" color="red">[${ p }]</font>
								</c:if>
								<c:if test="${ p ne currentPage }">
									<c:url var="pp" value="">
									<c:param name="page" value="${ p }" />
								</c:url>
									<a href="${ pp }">${ p }</a>
								</c:if>
							</c:forEach>
							
							<!-- 다음 페이지그룹으로 이동하는 버튼 -->
						   <c:if test="${ !((startPage + 10) <= maxPage) }">
						      ☞ &nbsp;
						   </c:if>
						   <c:if test="${ (startPage + 10) <= maxPage }">
						      <c:url var="pafter" value="">
						         <c:param name="page" value="${ startPage + 10 }" />
						      </c:url>
						      <a href="${ pafter }">☞</a> &nbsp;
						   </c:if>
							
							<!-- 끝 페이지로 이동하는 버튼 -->
							<c:if test="${ currentPage eq maxPage }">
								☞☞ &nbsp;
							</c:if>
							<c:if test="${ currentPage < maxPage }">
								<c:url var="pmax" value="">
									<c:param name="page" value="${maxPage}" />
								</c:url>
								<a href="${ pmax }"> ☞☞ </a> &nbsp;
							</c:if>
						</div>
			</section>

	
	<!-- 순위 아래  -->
			<section>
				<header class="major">
					<h2> 할인율 </h2>
				</header>
				<div class="discount">
				<table class="table-products table-hover">
				<colgroup>
					<col style="width:119px">
					<col>
					<col style="width:120px">
					<col style="width:100px">
				</colgroup>
				<thead>
				<tr>
					<th class="table-title" colspan="2">
						<a href="#">
						<span class="hide-small">Popular </span>Releases
						<svg version="1.1" width="24" height="24" viewBox="0 0 16 16" class="octicon octicon-arrow-right" aria-hidden="true">
						<path d="M8.22 2.97a.75.75 0 0 1 1.06 0l4.25 4.25a.75.75 0 0 1 0 1.06l-4.25 4.25a.751.751 0 0 1-1.042-.018.751.751 0 0 1-.018-1.042l2.97-2.97H3.75a.75.75 0 0 1 0-1.5h7.44L8.22 4.03a.75.75 0 0 1 0-1.06Z">
						</path>
						</svg>
						</a>
					</th>
					<th>Peak Today</th>
					<th><img src="" class="flag" alt="" width="18" height="18"> Price</th>
				</tr>
				</thead>
				<tbody>
				<tr class="app" data-appid="2050650" data-cache="1679986748">
					<td class="applogo">
					<a href="/app/2050650/charts/" tabindex="-1" aria-hidden="true">
					<img src="" alt="">
					</a>
					</td>
					<td><a href="" class="css-truncate">게임제목</a></td>
					<td class="text-center green">접속유저</td>
					<td class="text-center">할인율</td>
				</tr>
				</tbody>
				</table>

				</div>
				
				
				
	<!-- 유저게시판  -->				
			<section>
				<header class="major">
					<h2> 유저게시판 </h2>
				</header>
				<div class="bbborad">
				<table class="table-products table-hover">
				<colgroup>
					<col style="width:119px">
					<col>
					<col style="width:120px">
					<col style="width:100px">
				</colgroup>
				<thead>
				<tr>
					<th class="table-title">
						<a href="">번호
					</th>
					<th>제목</th>
					<th>조회수</th>
				</tr>
				</thead>
				<tbody>
				<tr class="boraddd">

					<th><a href="" class="css-truncate">번호</a></th>
					<th class="text-center green">제목</td>
					<th class="text-center">조회수</td>
				</tr>
				</tbody>
				</table>
				</div>
				


			
			
			</section>
			



		</div>
	</div>
	
	
	
	

	<!-- Sidebar -->

	<div id="sidebar">
		<div class="inner">

			<!-- Search -->
			<section id="search" class="alt">
				<form method="post" action="#">
					<input type="text" name="query" id="query" placeholder="Search" />
				</form>
			</section>

			<!-- Menu -->
			<nav id="menu">
				<header class="major">
					<h2>Menu</h2>
				</header>
				<ul>
					<li><a href="">Homepage</a></li>
					<li><a href="">Generic</a></li>
					<li><a href="">Elements</a></li>
					<li>
					
						<span class="opener">Submenu</span>
						<ul>
							<li><a href="#">Lorem Dolor</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul>
					</li>
					<li><a href="#">Etiam Dolore</a></li>
					<li><a href="#">Adipiscing</a></li>
					<li>
						<span class="opener">Another Submenu</span>
						<ul>
							<li><a href="#">Lorem Dolor</a></li>
							<li><a href="#">Ipsum Adipiscing</a></li>
							<li><a href="#">Tempus Magna</a></li>
							<li><a href="#">Feugiat Veroeros</a></li>
						</ul>
					</li>
					<li><a href="#">Maximus Erat</a></li>
					<li><a href="#">Sapien Mauris</a></li>
					<li><a href="#">Amet Lacinia</a></li>
				</ul>
			</nav>

			<!-- Section -->
			<section>
				<header class="major">
					<h2>Ante interdum</h2>
				</header>
				<div class="mini-posts">
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/pic07.jpg"/>" alt="" /></a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
					</article>
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/pic07.jpg"/>" alt="" /></a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
					</article>
					<article>
						<a href="#" class="image"><img src="<c:url value="/resources/images/pic07.jpg"/>" alt="" /></a>
						<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
					</article>
				</div>
				<ul class="actions">
					<li><a href="#" class="button">More</a></li>
				</ul>
			</section>

			<!-- Section -->
			<section>
				<header class="major">
					<h2>Get in touch</h2>
				</header>
				<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
				<ul class="contact">
					<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li>
					<li class="icon solid fa-phone">(000) 000-0000</li>
					<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
						Nashville, TN 00000-0000</li>
				</ul>
			</section>

			<!-- Footer -->
			<footer id="footer">
				<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
			</footer>

		</div>
	</div>


</div>

</body>




</html>