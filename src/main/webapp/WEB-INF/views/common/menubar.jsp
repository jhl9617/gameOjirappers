<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl7/1L_dstPt3HV5HzF6Gvk/e7YzKK2Do4h4zGpl6/" crossorigin="anonymous">
	<style type="text/css">
		.navbar-brand img {
			width: 100px;
			height: 100px;
		}
	</style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand" href="${ pageContext.servletContext.contextPath }/main.do">
			<img src="<c:url value='/resources/images/gggggg.png' />" alt="Logo">
		</a>
		<strong>by team 404</strong>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<c:if test="${ empty sessionScope.loginUser }">
				<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/loginPage.do">로그인</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/enrollPage.do">회원가입</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/blist.do">자유게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="${ pageContext.servletContext.contextPath }/commuMain.do?page=1">밴드</a></li>
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz4fnFO9gybBud6Lj7J2x//afFvF2LXJ6U1ycsTgldIOUzj6U8Tl7fT6d/" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0v8FqFjcJ6pajs/rfdfs3SO+kD4Ck5BdPtF+to8xMp9MvcU/" crossorigin="anonymous"></script>
</body>
</html>