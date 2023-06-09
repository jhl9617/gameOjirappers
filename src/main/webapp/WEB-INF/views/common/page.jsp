<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="startPage" value="${ requestScope.paging.startPage }"/>
<c:set var="endPage" value="${ requestScope.paging.endPage }"/>
<c:set var="maxPage" value="${ requestScope.paging.maxPage }"/>
<c:set var="currentPage" value="${ requestScope.paging.currentPage }"/>
<c:set var="url" value="${ requestScope.paging.url }"/>

<c:set var="appid" value="${ requestScope.paging.appid }"/>
<c:set var="communityid" value="${ requestScope.paging.communityid }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        * {
            text-decoration-line: none;
        }
        img {
            vertical-align: middle;
        }
    </style>
</head>
<body>
<!-- 페이징 처리 -->
<div style="text-align:center;"> <!-- 페이지 표시 영역 -->

    <!-- 1페이지로 이동하는 버튼 -->
    <c:if test="${ currentPage eq 1 }">

    </c:if>
    <c:if test="${ currentPage > 1 }">
        <c:url var="p1" value="${ url }">
            <c:param name="page" value="1"/>
            <c:if test="${!empty appid}">
                <c:param name="appid" value="${ appid }"/>
            </c:if>
            <c:if test="${!empty communityid}">
                <c:param name="communityid" value="${ communityid }"/>
            </c:if>
        </c:url>
        <a href="${ p1 }">
            <img src="<c:url value="/resources/images/leftarrow2.png"/>" width="25px" height="25px" alt="[맨처음]"/>
        </a>
    </c:if>
    <!-- 이전 페이지그룹으로 이동하는 버튼 -->
    <c:if test="${ !((currentPage - 10) >= 1) }">
    </c:if>
    <c:if test="${ (currentPage - 10) >= 1 }">
        <c:url var="pbefore" value="${ url }">
            <c:param name="page" value="${ startPage - 10 }"/>
            <c:if test="${!empty appid}">
                <c:param name="appid" value="${ appid }"/>
            </c:if>
            <c:if test="${!empty communityid}">
                <c:param name="communityid" value="${ communityid }"/>
            </c:if>
        </c:url>
        <a href="${ pbefore }"><img src="<c:url value="/resources/images/leftarrow1.png"/>" width="25px" height="25px"
                                    alt="[이전그룹]"/>
        </a>
    </c:if>

    <!-- 현재 페이지가 속한 페이지 그룹 페이지 숫자 출력 -->
    <c:forEach var="p" begin="${ startPage }" end="${ endPage }" step="1">
        <c:if test="${ p eq currentPage }">
            <font size="4" color="red">[${ p }]</font>
        </c:if>
        <c:if test="${ p ne currentPage }">
            <c:url var="pp" value="${ url }">
                <c:param name="page" value="${ p }"/>
                <c:if test="${!empty appid}">
                    <c:param name="appid" value="${ appid }"/>
                </c:if>
                <c:if test="${!empty communityid}">
                    <c:param name="communityid" value="${ communityid }"/>
                </c:if>
            </c:url>
            <a href="${ pp }"><font size="3" color="#ece8dd">${ p }</font></a>
        </c:if>
    </c:forEach>

    <!-- 다음 페이지그룹으로 이동하는 버튼 -->
    <c:if test="${ !((startPage + 10) <= maxPage)  }">
    </c:if>
    <c:if test="${ (startPage + 10) <= maxPage }">
        <c:url var="pafter" value="${ url }">
                <c:param name="page" value="${ startPage + 10 }"/>
            <c:if test="${!empty appid}">
                <c:param name="appid" value="${ appid }"/>
            </c:if>
            <c:if test="${!empty communityid}">
                <c:param name="communityid" value="${ communityid }"/>
            </c:if>
        </c:url>
        <a href="${ pafter }"><img src="<c:url value="/resources/images/rightarrow1.png"/>" width="25px" height="25px"
                                   alt="[다음그룹]"/>
        </a>
    </c:if>

    <!-- 끝 페이지로 이동하는 버튼 -->
    <c:if test="${ currentPage eq maxPage }">
    </c:if>
    <c:if test="${ currentPage < maxPage }">
        <c:url var="pmax" value="${ url }">
            <c:param name="page" value="${ maxPage }"/>
            <c:if test="${!empty appid}">
                <c:param name="appid" value="${ appid }"/>
            </c:if>
            <c:if test="${!empty communityid}">
                <c:param name="communityid" value="${ communityid }"/>
            </c:if>
        </c:url>
        <a href="${ pmax }">
            <img src="<c:url value="/resources/images/rightarrow2.png"/>" width="25px" height="25px" alt="[맨끝]"/></a>
    </c:if>
</div>
<%-- <c:set var="url" vlaue="/.do"/>

<c:import url="/WEB-INF/views/common/page.jsp"/>
<jsp:include page="/WEB-INF/views/common/page.jsp" /> --%>
</body>
</html>