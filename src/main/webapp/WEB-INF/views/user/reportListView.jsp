<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
</head>
<script type="text/javascript">
	
	function showReportContent() {
		
	}
</script>
<body>
<h1>신고글리스트(관리자) 페이지</h1>
 <table align="center" width="500" border="1" cellspacing="0" cellpadding="1">
 	<tr>
 		<th>신고자아이디</th>
 		<th>피신고자아이디</th>
 		<th>신고날짜</th>
 		<th></th>
 	</tr>
 	<c:forEach items="${ requestScope.list }" var="r">
 		<tr>
<%--  			<td>${  }</td> --%>
<%--  			<td>${  }</td> --%>
<%--  			<td>${  }</td> --%>
 			<td><button onclick="showReportContent();">상세 보기</button></td>
 		</tr>
 	</c:forEach>
 </table>
 <form name=""  id="">
 	
<%--  	<textarea rows="" cols="" readonly>${  }</textarea><br> --%>
 	&nbsp; <button onclick="">닫기</button>
 </form>
 
 
 	<!-- Footer -->
<footer id="footer">
	<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
</footer>
</body>
</html>