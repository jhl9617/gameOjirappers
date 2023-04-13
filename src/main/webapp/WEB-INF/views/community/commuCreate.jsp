<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--<c:set var="communityName" value="${ communityName }" />--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 생성</title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/table.css">
    <style>
        td{
            background: #555;
        }
        h1{
            color: #fef2dc;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<h1>커뮤니티 생성하기</h1>
<br><br>
<div style="text-align: left;">
<form action="CommuCreateSubmit.do" method="post" enctype="multipart/form-data">
    <input type="hidden" name="user_id" value="${loginUser.user_id}"/>
    <table>
        <tr>
            <th>밴드 이름</th>
            <td>
                <input type="text" name="communityname" value="${ communityname }">by ${loginUser.user_id}    <%--작성자 부분은 나중에 닉네임--%>
            </td>
        </tr>
        <tr>
            <th>밴드 대표 이미지</th>
            <td><input type="file" name="mfile" accept="image/*"/></td>
        </tr>
        <tr>
            <th style="border-bottom-left-radius: 20px;">밴드 소개를 해주세요</th>
            <td><textarea name="communitydesc" rows="5" cols="50"></textarea></td>
        </tr>
    </table>
    <br><br>
    <input class="button" style="width: 150px; height: 50px;" type="submit" value="커뮤니티 만들기"/>
</form>
</div>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
