<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>" />		<%--css 스타일 가져오기--%>


<%--<c:set var="communityName" value="${ communityName }" />--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 생성</title>
</head>
<body>
<h1>커뮤니티 생성하기</h1>
<form action="CommuCreateSubmit.do" method="post" <%--enctype="multipart/form-data"--%>>
    <input type="hidden" name="user_id" value="${loginUser.user_id}"/>
    <table>
        <tr>
            <th>밴드 이름</th>
            <td>
                <input type="text" name="communityname" value="${ communityname }"><th>by ${loginUser.user_id}</th>     <%--작성자 부분은 나중에 닉네임--%>
            </td>
        </tr>
        <tr>
            <th>밴드 대표 이미지</th>
            <td><input type="file" name="communityimgori" accept="image/*"/></td>
        </tr>
        <tr>
            <th>밴드 소개를 해주세요</th>
            <td><textarea name="communitydesc" rows="5" cols="50"></textarea></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="커뮤니티 만들기"/></td>
        </tr>
    </table>
</form>
</body>
</html>
