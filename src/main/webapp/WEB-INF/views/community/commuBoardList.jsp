<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${group.communityname} 게시판</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>" /><%--css 스타일 가져오기--%>
</head>
<body>
<div class="container">
<h1 class="my-4">${group.communityname} 게시판</h1>
<c:import url="/WEB-INF/views/community/commuDetailMenu.jsp"/>
<table border="1">
  <thead>
  <tr>
    <th>Title</th>
    <th>Author</th>
    <th>Date</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="post" items="${list}">
    <tr>
      <c:url var="cbd" value="/viewCommuPost.do">
        <c:param name="cBoardNo" value="${ post.cBoardNo }" />
        <c:param name="communityid" value="${ communityid }" />
      </c:url>
      <td><a href="${cbd}">${post.cBoardTitle}</a></td>
      <td>${post.user_id}</td>
      <td>${post.cBoardDate}</td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</div>
</body>
</html>
