<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<style type="text/css">
img {
	width: 60px;
	height: 60px;
}
#arcfield {
	background: lightgray;
}
.inner table tr td{
	border-left: 1px solid black;
	border-bottom: 1px solid black;
	padding: 0;
}
.inner table tr th{
	border-left: 1px solid black;
	border-bottom: 1px solid black;
	padding: 0;
	margin: 0;
}
.inner table tr{
	text-align: center;
	vertical-align: center;

}
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/css/main.css" />
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<!-- Header -->
			<c:import url="/WEB-INF/views/common/menubar.jsp" />
			<!-- Content -->
			<br><br><br>
			<div class="inner">
				<center>
					<table style="width: 500px; border:1px solid gray;">
						<tr>
							<th style="width: 60px; height: 60px;">이미지</th><th>이름</th>
						</tr>
						<c:forEach items="${archs}" var="ch">
						<tr id="arcfield">
							<td><img src="<c:url value='${ch.path}'/>"/></td><td>${ch.name}</td>
						</tr>
						</c:forEach>
					</table>
				</center>
			</div>
			<!-- Footer -->
			<c:import url="/WEB-INF/views/common/footer.jsp" />
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