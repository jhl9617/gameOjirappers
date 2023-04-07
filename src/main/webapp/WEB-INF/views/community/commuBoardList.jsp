<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${group.communityname} 게시판</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>" /><%--css 스타일 가져오기--%>
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

  <div id="board-search">
    <div class="container">
      <div class="search-window">
        <form action="commuBoardSearch.do" method="post">
          <div class="search-wrap">
            <label for="search" >검색</label>
              <input id="search" size="15" maxlength="30" type="keyword" name="keyword" placeholder="제목으로 검색하세요." value="">
            <input type="hidden" name="communityid" value="${ communityid }">
            <button type="submit" class="btn btn-dark">검색</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<%--글 작성 버튼--%>
<div class="container">
  <c:url var="cbd" value="/writeCommuPost.do">
    <c:param name="communityid" value="${ communityid }" />
  </c:url>
  <a href="${cbd}"><button type="button" class="btn btn-primary">글 작성</button></a>
</body>
</html>