<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="listCount" value="${ requestScope.paging.listCount }" />
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>커뮤니티 허브</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>" />
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>

    <script>
        function showAlertMessage() {
            <c:if test="${not empty message}">
            alert("${message}");
            </c:if>
        }
        document.addEventListener("DOMContentLoaded", function() {
            showAlertMessage();
        });
    </script>
<%--css 스타일 가져오기--%>
</head>
<body>

<c:import url="/WEB-INF/views/common/menubar.jsp" />

<br>

<div class="container">
    <h1 class="my-4">커뮤니티 허브</h1>
    <c:if test="${!empty sessionScope.loginUser}">
    <h2>나만의 커뮤니티 생성</h2>
    <form action="commuCreate.do" method="post">
        <div class="form-group">
            <label for="communityname">Group Name:</label>
            <input type="text" class="pos" id="communityname" name="communityname" required>
        </div>
        <button type="submit">나만의 커뮤니티 이름 입력하고 만들기</button>
    </form>
    </c:if>
    <h3 align="center">총 게시글 수 : ${ listCount } 개</h3>
    <h2 class="my-4">커뮤니티 찾아보기</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col">커뮤니티 이름</th>
            <th scope="col">생성자</th>
            <th scope="col">커뮤 생성일</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="group" items="${list}">
            <tr>
                <td>${group.communityname}</td>
                <td>${group.user_id}</td>
                <td><fmt:formatDate value="${group.communitydate}" pattern="yyyy-MM-dd" /></td>
                <td>
                    <c:url var="cdt" value="/viewgroup.do">
                        <c:param name="communityid" value="${ group.communityid }" />
                    </c:url>
                    <a href="${cdt}" class="btn btn-primary">View</a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="commuSearch.do" method="post">
                    <div class="search-wrap">
                        <label for="search" >커뮤니티 검색</label>
                        <input id="search" size="15" maxlength="30" type="keyword" name="keyword" placeholder="이름으로 검색하세요." value="">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <c:import url="/WEB-INF/views/common/page.jsp" />
    <br>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>


