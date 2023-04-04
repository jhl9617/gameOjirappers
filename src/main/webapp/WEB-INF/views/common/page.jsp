<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<c:set var="startPage" value="${ requestScope.paging.startPage }" />
<c:set var="endPage" value="${ requestScope.paging.endPage }" />
<c:set var="maxPage" value="${ requestScope.paging.maxPage }" />
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />
<c:set var="url" value="${ requestScope.url }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 페이징 처리 -->
<div style="text-align:center;"> <!-- 페이지 표시 영역 -->
	<!-- 1페이지로 이동하는 버튼 -->
	<c:if test="${ currentPage eq 1 }">
		<img src="<c:url value="/resources/images/movepageLL.jpg"/>" width="20px" height="20px" alt="[맨처음]" /> &nbsp;
	</c:if>
	<c:if test="${ currentPage > 1 }">
		<c:url var="p1" value="${ url }">
			<c:param name="page" value="1" />
		</c:url>
		<a href="${ p1 }">
			<img src="<c:url value="/resources/images/movepageLL.jpg"/>" width="20px" height="20px" alt="[맨처음]" />
		</a> &nbsp;
	</c:if>
	<!-- 이전 페이지그룹으로 이동하는 버튼 -->
	<c:if test="${ !((currentPage - 10) < startPage and (currentPage - 10) > 1) }">
		<img src="<c:url value="/resources/images/movepageL.jpg"/>" width="20px" height="20px" alt="[이전그룹]" /> &nbsp;
	</c:if>
	<c:if test="${ (currentPage - 10) < startPage and (currentPage - 10) > 1 }">
		<c:url var="pbefore" value="${ url }">
			<c:param name="page" value="${ startPage - 10 }" />
		</c:url>
		<a href="${ pbefore }"><img src="<c:url value="/resources/images/movepageL.jpg"/>" width="20px" height="20px" alt="[이전그룹]" />
		</a> &nbsp;
	</c:if>
	
	<!-- 현재 페이지가 속한 페이지 그룹 페이지 숫자 출력 -->
	<c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
		<c:if test="${ p eq currentPage }">
			<font size="4" color="red">[${ p }]</font>
		</c:if>
		<c:if test="${ p ne currentPage }">
			<c:url var="pp" value="${ url }">
				<c:param name="page" value="${ p }" />
			</c:url>
			<a href="${ pp }">${ p }</a>
		</c:if>
	</c:forEach>
	
	<!-- 다음 페이지그룹으로 이동하는 버튼 -->
	<c:if test="${ !((currentPage + 10) > endPage and (currentPage + 10) < maxPage) }">
		<img src="<c:url value="/resources/images/movepageR.jpg"/>" width="20px" height="20px" alt="[다음그룹]" /> &nbsp;
	</c:if>
	<c:if test="${ (currentPage + 10) > endPage and (currentPage + 10) < maxPage }">
		<c:url var="pafter" value="${ url }">
			<c:param name="page" value="${ endPage + 10 }" />
		</c:url>
		<a href="${ pafter }"><img src="<c:url value="/resources/images/movepageR.jpg"/>" width="20px" height="20px" alt="[다음그룹]" />
		</a> &nbsp;
	</c:if>
	
	<!-- 끝 페이지로 이동하는 버튼 -->
	<c:if test="${ currentPage eq maxPage }">
	<img src="<c:url value="/resources/images/movepageRR.jpg"/>" width="20px" height="20px" alt="[맨끝]" />
	</c:if>
	<c:if test="${ currentPage < maxPage }">
		<c:url var="pmax" value="${ url }">
			<c:param name="page" value="${ maxPage }" />
		</c:url>
		<a href="${ pmax }">
		<img src="<c:url value="/resources/images/movepageRR.jpg"/>" width="20px" height="20px" alt="[맨끝]" /></a>
	</c:if>
</div>
<%-- <c:set var="url" value="/.do"/>
<c:import url="/WEB-INF/views/common/page.jsp"/>
<jsp:include page="/WEB-INF/views/common/page.jsp" /> --%>
</body>
</html>