<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="currentPage" value="${requestScope.currentPage }" />

<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>GameInfo</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/main.css" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

			<!-- Header -->
			<c:import url="/WEB-INF/views/common/menubar.jsp"/>
				<!-- Content -->
				<section>
					<header class="main">
						<h1 align="center">${ requestScope.game.name }의 게임정보</h1>
						<h3 align="center">#${ requestScope.game.genre }</h3>
					</header>
				</section>
				<section>
					<!--게임사진 들어갈 부분 -->
					<header class="major">
						<h2> 이미지 </h2>
					</header>
					<span class="image main"><img src="${ requestScope.game.screenshot }" alt="게임대표이미지" ></span>
				</section>
				<section>
				
					<table>
					<header class="major">
						<h2> 동영상 </h2>
					</header>
							<div style="border:1px solid black;">
							<video src="${ requestScope.game.movie }"></video>
							</div>
					</table>
					<table>
					<header class="major">
						<h2> ㅀㄹㅇㅎ </h2>
					</header>
							<div style="border:1px solid black;">
							<h2 align="center">초기 가격:[${ requestScope.game.initialprice }]</h2>
							<h2 align="center">최종 가격:[${ requestScope.game.finalprice }]</h2>
							<h2 align="center">개발자:[${ requestScope.game.name }]</h2>
							<h2 align="center">배급사:[${ requestScope.game.name }]</h2>
							</div>
					</table>
				</section>
				
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
				
				</section>
				
				
				
				<section>
				
					<header class="major">
						<h2> 게임 소개글 </h2>
					</header>
				<div style="float:left;">		
					<p>${ requestScope.game.description }</p>
						<p></p>
				</div>
				
				<header class="major">
						<h2> 도전과제 링크 </h2>
					</header>
				<div style="float:left;">
					<a href="#" >도전과제 링크</a>
				</div>
				</section>								
			<section>
				<header class="major">
					<h2> 유저게시판 </h2>
				</header>
				<div class="bbborad">
				<table class="table-products table-hover">
				<colgroup>
					<col style="width:119px">
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
			<section>
					<h2>댓글 처리할거임</h2>
					<p></p>
					<p></p>

					<hr class="major" />
				</section>	
						
				
				

			</div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
		</div>
	</div>

 	<!-- Scripts -->
<!--	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script> -->
</body>
</html>