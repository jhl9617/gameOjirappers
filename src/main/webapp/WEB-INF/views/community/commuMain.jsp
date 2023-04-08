<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>커뮤니티 허브</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>

    <script src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>" />
<script type="text/javascript">
    $(function () {
        <c:if test="${!empty message}">
            alert("${message}");
            const state = null;
            const title = null;
            const url = `commuMain.do?`;
            history.pushState(state, title, url);
            window.onpopstate = function(event) {
                history.go(1);
            };
        </c:if>
    });
</script>

<%--css 스타일 가져오기--%>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />

<br>

<div class="container">
    <h1 class="my-4">커뮤니티 허브</h1>
    <h2>나만의 커뮤니티 생성</h2>
    <form action="commuCreate.do" method="post">
        <div class="form-group">
            <label for="communityname">Group Name:</label>
            <input type="text" class="pos" id="communityname" name="communityname" required>
        </div>
        <button type="submit">나만의 커뮤니티 이름 입력하고 만들기</button>
    </form>

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
                    <a href="joinGroup?communityid=${group.communityid}" class="btn btn-success">Join</a>
                    <c:url var="cdt" value="/viewgroup.do">
                        <c:param name="communityid" value="${ group.communityid }" />
                    </c:url>
                    <a href="${cdt}" class="btn btn-primary">View</a>
                </td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
    <c:import url="/WEB-INF/views/common/page.jsp" />
    <br>
    <br>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>


