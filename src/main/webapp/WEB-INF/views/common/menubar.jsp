<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ page import="vo.model.member.org.team404.gameOjirap.Member" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

</style>
</head>
<body>
<header id="header">
	<h3><a href="${ pageContext.servletContext.contextPath }/main.do" class="lll">
	<img src="<c:url value="/resources/images/gggggg.png"/>" width="100px" height="100px" alt="로그" />
	</a><strong>
</strong> by team 404</h3>
	<!-- 로그인 한 경우 -->
	<%-- <% if(loginMember == null){ %> --%>
	<c:if test="${ empty sessionScope.loginUser }">
		<ul class="icons">
			<li><a href="${ pageContext.servletContext.contextPath }/loginPage.do" class="button"><span class="label">로그인</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/enrollPage.do" class="button"><span class="label">회원가입</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/blist.do" class="button"><span class="label">자유게시판</span></a></li>
		</ul>	
	</c:if>	
	<%-- <% } %> --%>
<!-- 	<!-- 로그인한 경우 : 관리자인 경우 --> 
<%-- 	<c:if test="${ !empty sessionScope.loginMember and loginMember.admin eq 'Y' }"> --%>
<!-- 		<ul class="icons"> -->
<%-- 			<li><a href="${ pageContext.servletContext.contextPath }/loginPage.do" class="button"><span class="label">로그인</span></a></li> --%>
<%-- 			<li><a href="${ pageContext.servletContext.contextPath }/userDatailPage.do" class="button"><span class="label">마이페이지</span></a></li> --%>
<%-- 			<li><a href="${ pageContext.servletContext.contextPath }/userDatailPage.do" class="button"><span class="label">마이페이지</span></a></li> --%>
<!-- 		</ul> -->
<%-- 	</c:if> --%>
	<!-- 로그인한 경우 : 일반회원인 경우 -->
	<c:if test="${ !empty sessionScope.loginUser }">
		<ul class="icons">
			<li>${ loginUser.user_name}님 로긘중!</li>
			<li><a href="${ pageContext.servletContext.contextPath }/logout.do" class="button"><span class="label">로그아웃하기</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/blist.do" class="button"><span class="label">자유게시판</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/moveup.do?user_id=${ sessionScope.loginUser.user_id }" class="button"><span class="label">마이페이지</span></a></li> <%--임시--%>
			<li><a href="${ pageContext.servletContext.contextPath }/commuMain.do" class="button"><span class="label">밴드</span></a><li> <%--임시--%>
		</ul> 
	</c:if>
	
</header>
</body>
</html>