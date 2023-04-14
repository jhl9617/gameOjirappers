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

	$(function(){
		var x = document.ElementByClassName("desc")
		for(var i = 0; i < x.length; i++) {
			x[i].css('display','none');
		}
	});
	
	function showReportDesc(user_id, communityid) {
		var x = document.ElementByClassName("desc")
		for(var i = 0; i < x.length; i++) {
			x[i].css('display','none');
		}
		
		$("#${ cr.user_id }${ cr.communityid }").css('display','block');
	}
</script>
<body>
<h1>신고글리스트(관리자) 페이지</h1><br><br>

<form action="viewgroup.do" method="post">
 <table align="center" width="700" border="1" cellspacing="0" cellpadding="1">
 	<tr>
 		<th>신고자아이디</th>
 		<th>신고 대상 커뮤니티</th>
 		<th>신고유형</th>
 		<th>신고날짜</th>
 		<th></th>
 	</tr>
 	<c:forEach items="${ requestScope.list }" var="cr" varStatus="status">
 		<input type="hidden" name="communityid" value="${ cr.communityid }">
 		<input type="hidden" name="page" value="1">
 		<tr>
 			<td>${ cr.user_id }</td>
  			<td>${ cr.communityid }</td>
  			<td>${ cr.c_rep_type }</td>
  			<td>${ cr.c_report_time }</td>
 			<td><input type="submit" value="해당 커뮤니티로 이동"></td>
 		</tr>
 		<tr class="desc" id="${ cr.user_id }${ cr.communityid }">
 			<td colspan="5">내용 : ${ cr.c_report_desc }</td>
 		</tr>
 	</c:forEach>
 </table>
</form>

 	<!-- Footer -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>