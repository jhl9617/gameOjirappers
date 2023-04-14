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

		body {
			background: #081c2b;
			overflow-x: hidden;
		}


		a {
			color: #fef2dc;
			text-decoration: none;
		}

		a:visited{
			color: #fef2dc;
		}

		.icons {
			list-style: none;
			margin-left: 0;
		}

		.icons li {
			display: inline-block;
			padding: 0 0.5em 0 0;
		}

		#headermenu {
			display:flex;
			padding: 0;
			position: relative;
			height: 155px;
			background: #0e151a;
		}

		#headermenu.icons {
			text-align: right;
		}

		#headermenu > * {
			flex: 1;
			margin-bottom: 0;
			vertical-align: center;
			color: #fef2dc;
		}

		#headermenu ul {
			text-align: center;
			margin-left: 30px;
			margin-top: 0;
			margin-right: -50px;
			padding-top: 32px;
			padding-bottom: 32px;
		}

		#headermenu ul li {
			margin-right: 10px;
			padding:0;
			vertical-align: center;
			margin-bottom: 1%;
			margin-top: 1%;
		}

		.icons li {
			appearance: none;
			transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
			background-color: transparent;
			border-radius: 8px;
			border-top: 1px dimgray solid;
			border-left: 1px dimgray solid;
			box-shadow: 1px 1px 1px 1px #f56a6a;
			color: Lightgray ;
			cursor: pointer;
			display: inline-block;
			font-size: 0.8em;
			font-weight: 700;
			height: 45px;
			width: 102px;
			letter-spacing: 0.075em;
			line-height: 3.5em;
			text-align: center;
			text-decoration: none;
			text-transform: uppercase;
			white-space: nowrap;
			margin: 0 auto;
		}


		.button {
			appearance: none;
			transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
			background-color: transparent;
			border-radius: 8px;
			border-top: 1px dimgray solid;
			border-left: 1px dimgray solid;
			box-shadow: 1px 1px 1px 1px #f56a6a;
			color: Lightgray ;
			cursor: pointer;
			display: inline-block;
			font-size: 0.8em;
			font-weight: 700;
			height: max-content;
			width: max-content;
			letter-spacing: 0.075em;
			line-height: 3.5em;
			padding: 0;
			text-align: center;
			text-decoration: none;
			text-transform: uppercase;
			white-space: nowrap;
			vertical-align: center;
		}
		.button:hover {
			background: #fef2dc;
			color: #f56a6a;
		}
		.icons li a {
			color: #fef2dc;
			width: inherit;
			height: inherit;
			display: block;
		}

		.icons li:hover {
			background: #fef2dc !important;
		}

		.icons li:hover a {
			color: #f56a6a !important;
		}

		#headermenu ol {
			vertical-align: center;
			list-style: none;
			text-align: left;
			margin:0 auto;
			padding: 0;
		}
		#us {
			all: unset;
		}

		#us:hover {
			color: #f56a6a;
		}
	</style>
</head>
<body>

<header id="headermenu">
	<h3 style="margin-top:0; "><a href="${ pageContext.servletContext.contextPath }/main.do" class="lll">
		<img src="<c:url value="/resources/images/gggggg.png"/>" style="width: 200px; height:154px;"  alt="로그" />
	</a> </h3>
	<!-- 로그인 안한 경우 -->
	<%-- <% if(loginMember == null){ %> --%>
	<c:if test="${ empty sessionScope.loginUser }">
		<ul class="icons">
			<li><a href="${ pageContext.servletContext.contextPath }/loginPage.do"><span class="label">로그인</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/enrollPage.do"><span class="label">회원가입</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/blist.do"><span class="label">자유게시판</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/commuMain.do?page=1" ><span class="label">커뮤니티</span></a></li>
		</ul>	
	</c:if>	
	<%-- <% } %> --%>
<!-- 	 로그인한 경우 : 관리자인 경우 -->
 	<c:if test="${ !empty sessionScope.loginUser and loginUser.admin_id eq 'Y' }"> 
		<ul class="icons"> 
 			<li><a href="${ pageContext.servletContext.contextPath }/logout.do"><span class="label">로그아웃하기</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/commuMain.do?page=1" ><span class="label">커뮤니티</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/blist.do"><span class="label">자유게시판</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/moveup.do?user_id=${ sessionScope.loginUser.user_id }" ><span class="label">마이페이지</span></a></li> <%--임시--%>
			<li><a href="${ pageContext.servletContext.contextPath }/uadmin.do?page=1" ><span class="label">관리자</span></a></li> 
 		</ul> 
 	</c:if> 
	<!-- 로그인한 경우 : 일반회원인 경우 -->
	<c:if test="${ !empty sessionScope.loginUser and loginUser.admin_id ne 'Y' }">
		<ul class="icons">
			<li id="us">${ loginUser.user_name}님 로긘중!</li><br>
			<li><a href="${ pageContext.servletContext.contextPath }/logout.do"><span class="label">로그아웃하기</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/commuMain.do?page=1" ><span class="label">커뮤니티</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/blist.do"><span class="label">자유게시판</span></a></li>
			<li><a href="${ pageContext.servletContext.contextPath }/moveup.do?user_id=${ sessionScope.loginUser.user_id }" ><span class="label">마이페이지</span></a></li> <%--임시--%>
		</ul>
	</c:if>
</header>

</body>
</html>