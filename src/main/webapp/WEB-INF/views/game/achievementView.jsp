<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="currentPage" value="${requestScope.currentPage }" />

<!DOCTYPE HTML>

<html>
<head>
<title>GameInfo</title>
	<link href="${pageContext.servletContext.contextPath}/resources/css/table.css"
		rel="stylesheet" />
<style type="text/css">

img {
	width: 60px;
	height: 60px;
}
.table-fill {
	border-collapse: separate;
}
tr {
	text-align: center;
}
th {
	height: 50px;
}
td {
	background: #555555;
}
</style>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

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
					<table class="table-fill">
						<tr>
							<th>이미지</th><th>이름</th>
						</tr>
						<c:forEach items="${archs}" var="ch">
						<tr id="arcfield">
							<td><img src="<c:url value='${ch.path}'/>"/></td><td>${ch.name}</td>
						</tr>
						</c:forEach>
					</table>
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