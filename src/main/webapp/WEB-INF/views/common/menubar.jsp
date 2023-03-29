<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="vo.model.member.org.team404.gameOjirap.Member" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
	Member loginMember = (Member)session.getAttribute("loginMember");
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
	<style>
		#main-container {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			z-index: 1000;
			background-color: white; /* or any color you want */
		}
		body {
			margin-top: 60px; /* Adjust this value according to the height of your menubar */
		}

	</style>



<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/main.css" />

</head>
<body>
<header>
	<ul id="menubar">

		<li><a href="${ pageContext.servletContext.contextPath }/nlist.do">게임정보</a></li>
		<li><a href="${ pageContext.servletContext.contextPath }/commuMain.do">밴드</a></li>
		<li><a href="${ pageContext.servletContext.contextPath }/test.do">마이페이지</a></li>
		<li><a href="${ pageContext.servletContext.contextPath }/testLogin.do">..</a></li>
		<li><a href="${ pageContext.servletContext.contextPath }/moveAOP.do">..</a></li>
	</ul>

</header>



</body>
</html>