<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 허브</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />		<%--css 스타일 가져오기--%>
</head>
<body>
<div class="container">
    <h1 class="my-4">커뮤니티 허브</h1>

    <h2>나만의 커뮤니티 생성</h2>
    <form action="commuCreate.do" method="post">
        <div class="form-group">
            <label for="communityname">Group Name:</label>
            <input type="text" class="pos" id="communityname" name="communityname" required>
        </div>
        <button type="submit">나만의 커뮤니티 이름 입력하고 만들기</button>
        <c:url var="sse" value="/csview.do">
        	<c:param name="communityid" value="1" />
        </c:url>
        <a href="${sse}"><h2>커뮤티니 일정보기</h2></a>
    </form>

    <h2 class="my-4">커뮤니티 찾아보기</h2>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th scope="col">커뮤니티 이름</th>
            <th scope="col">회원 수</th>
            <th scope="col">커뮤 마스터</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="group" items="${groups}">
            <tr>
                <td>${group.name}</td>
                <td>${group.members.size()}</td>
                <td>
                    <a href="joinGroup?groupId=${group.id}" class="btn btn-success">Join</a>
                    <a href="viewGroup?groupId=${group.id}" class="btn btn-primary">View</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>


