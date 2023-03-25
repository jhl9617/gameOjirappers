<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
<style type="text/css">
div.lineA {
	height: 100px;
	border: 1px solid gray;
	float: left;
	position: relative;
	left: 100px;
	margin: 5px;
	padding: 5px;
}
div#banner {
	width: 650px;
	padding: 0;
}
div#banner img {
	margin: 0;
	padding: 0;
	width: 650px;
	height: 110px;
}
div#loginBox {
	width: 274px;
	font-size: 9pt;
	text-align: left;
	padding-left: 20px;
}
div#loginBox button {
	width: 250px;
	height: 35px;
	background-color: navy;
	color: white;
	margin-top: 10px;
	margin-bottom: 15px;
	font-size: 14pt;
	font-weight: bold;
}
section {
	position: relative;
	left: 100px;
}
section > div {
	width: 360px;
	background-color: #ccffff;
}
section div table {
	width: 350px;
	background: white;
}
</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
	function movePage(){
		//버튼 클릭하면, 로그인 페이지로 이동하는 컨트롤러를 요청함
		location.href = "loginPage.do";
	}

</script>
</head>
<body>
<%-- <%@ include file="menubar.jsp" %> --%>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<center>
	<!-- 배너 이미지 표시 
		절대경로 표기 : 
		jstl 표기 : /
		el 표기 : ${ pageContext.servletContext.contextPath }
	-->
	<div id="banner" class="lineA">
		<img src="${ pageContext.servletContext.contextPath }/resources/images/photo2.jpg">
	</div>
	<!-- login 영역 표시 -->
	<!-- 로그인 안 했을 때 : 세션 객체 안에 loginMember 가 없다면 -->
	<c:if test="${ empty sessionScope.loginMember }">
		<div id="loginBox" class="lineA">
			first 사이트 방문을 환영합니다.<br>
			<button onclick="movePage()">로그인 하세요.</button>
			<br>
			<a>아이디/비밀번호 조회</a> &nbsp; &nbsp;
			<a href="${ pageContext.servletContext.contextPath }/enrollPage.do">회원가입</a>
		</div>
	</c:if>
	<!-- 로그인 했을 때 : 일반회원인 경우 -->
	<c:if test="${ !empty sessionScope.loginMember and loginMember.admin ne 'Y' }">
		<div id="loginBox" class="lineA">
			${ loginMember.username } 님<br>
			<button onclick="javascript:location.href='logout.do';">로그아웃</button>
			<br>
			<a>쪽지</a> &nbsp; &nbsp; <a>메일</a> &nbsp; &nbsp;
			<!-- 마이페이지 클릭시 연결대상과 전달값 지정 -->
			<c:url var="callMyInfo" value="/myinfo.do">
				<c:param name="userid" value="${ loginMember.userid }" />
			</c:url>
			<a href="${ callMyInfo }">My Page</a>
		</div>
	</c:if>

	<!-- 로그인 했을 때 : 관리자인 경우 -->
	<c:if test="${ !empty sessionScope.loginMember and loginMember.admin eq 'Y' }">
		<div id="loginBox" class="lineA">
			${ loginMember.username } 님<br>
			<button onclick="javascript:location.href='logout.do';">로그아웃</button>
			<br>
			<a>관리 페이지로 이동</a> &nbsp; &nbsp;
			<!-- 마이페이지 클릭시 연결대상과 전달값 지정 -->
			<c:url var="callMyInfo" value="/myinfo.do">
				<c:param name="userid" value="${ loginMember.userid }" />
			</c:url>
			<a href="${ callMyInfo }">My Page</a>
		</div>
	</c:if>
</center>
<hr>
<section>
	<!-- 최근 등록 신규 공지글 5개 조회 출력 : ajax -->
	<div style="float:left; border:1px solid navy; padding: 5px; margin:5px;">
		<h4>최근 공지글</h4>
		<table id="newnotice" border="1" cellspacing="0">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</table>
	</div>
	
	<!-- 조회수 많은 게시글 5개 조회 출력 : ajax -->
	<div style="float:left; border:1px solid navy; padding: 5px; margin:5px;">
		<h4>인기 게시글</h4>
		<table id="toplist" border="1" cellspacing="0">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>조회수</th>
			</tr>
		</table>
	</div>
</section>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>



