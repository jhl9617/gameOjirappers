<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style type="text/css">
		.navbar-brand img {
			width: 100px;
			height: 100px;
		}

		*{
			text-decoration-line: none;
			list-style: none;
		}
		body {
			height: 80vh;
			max-width: 70%;
			margin: 0 auto;
		}
		#menuhead {
			height: 18vh;
			weight: 100%;
			background: #000;
		}

		.menubarcon {
			width: 100%;
			float: left;
		}

		#navbarNav ul li{
			float: left;
			border: 1px solid lightgray;
			color: lightgray;
			display: block;
			border-radius: 15px;
			padding: 0;
			margin-left: 25px;
			position: relative;
			width: 150px;
			height: 23px;
			text-align: center;
			top: 0;
			left: 0;
			right: 0;
			box-shadow: 1px 1px 1px 1px #f56a6a;
		}
		a{
			color: #fef2dc;
		}
		a:visited {
			color: #fef2dc;
		}

		#navbarNav ul li:hover {
			background: #fef2dc;
			transition: 0.2s ;
		}

		#navbarNav ul li:hover a, #navbarNav ul li a:hover:before{
			background: #fef2dc;
			color: #081c2b;
			transition: 0.1s;
			width: 100%;
			height: 100%;
			border-radius: inherit;

		}

		#navbarNav ul li a {
			display: block;
			text-align: center;
			vertical-align: center;
			padding: 0;
			margin: 0;
			width: inherit;
			height: inherit;
			line-height: 19px;
		}

		.button {
			font-family: 'GyeonggiTitleM';
			-moz-appearance: none;
			-webkit-appearance: none;
			-ms-appearance: none;
			appearance: none;
			-moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
			-webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
			-ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
			transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
			background-color: transparent;
			border-radius: 8px;
			border: 1;
			box-shadow: 1px 1px 1px 1px #f56a6a;
			color: Lightgray ;
			cursor: pointer;
			display: inline-block;
			font-size: 0.8em;
			font-weight: 700;
			height: 40px;
			width: 300px;
			letter-spacing: 0.075em;
			line-height: 3.5em;
			padding: 0;
			text-align: center;
			text-decoration: none;
			text-transform: uppercase;
			white-space: nowrap; }

		body {
			background: #081c2b;
			color: #fef2dc;
		}
		#navbarNav ul{
			text-align: center;
			margin-left: 30%;

		}
	</style>
</head>
<body>
<header id="menuhead">
<nav class="menubarnav">
	<div class="menubarcon">
		<a class="navbar-brand" href="${ pageContext.servletContext.contextPath }/main.do">
			<img src="<c:url value='/resources/images/gggggg.png' />" alt="Logo">
		</a>
		<strong style="color: #fef2dc;">by team 404</strong>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<c:if test="${ empty sessionScope.loginUser }">
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/loginPage.do">로그인 &nbsp; </a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/enrollPage.do">회원가입 &nbsp;</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/blist.do">자유게시판 &nbsp;</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/commuMain.do?page=1">밴드 &nbsp;</a></li>
				</c:if>
				<c:if test="${ !empty sessionScope.loginUser and loginUser.admin_id eq 'Y' }">
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/logout.do">로그아웃하기</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/commuMain.do?page=1">밴드</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/blist.do">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/moveup.do?user_id=${ sessionScope.loginUser.user_id }">마이페이지</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/uadmin.do">관리자</a></li>
				</c:if>
				<c:if test="${ !empty sessionScope.loginUser and loginUser.admin_id ne 'Y' }">
					<li class="nav-item">${ loginUser.user_name }님 로그인 중!</li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/logout.do">로그아웃하기</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/commuMain.do?page=1">밴드</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/blist.do">자유게시판</a></li>
					<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/moveup.do?user_id=${ sessionScope.loginUser.user_id }">마이페이지</a></li>
				</c:if>
			</ul>
		</div>
	</div>

</nav>
</header>
<br style="clear: right">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybBud6Lj7J2x//afFvF2LXJ6U1ycsTgldIOUzj6U8Tl7fT6d/" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqFjcJ6pajs/rfdfs3SO+kD4Ck5BdPtF+to8xMp9MvcU/" crossorigin="anonymous"></script>
</body>
</html>