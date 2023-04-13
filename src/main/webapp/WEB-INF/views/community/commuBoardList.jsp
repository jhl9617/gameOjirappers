<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="communityid" value="${ requestScope.communityid }" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${group.communityname} 게시판</title>

  <link href="${ pageContext.servletContext.contextPath }/resources/css/table.css" rel="stylesheet">
  <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
  <style>
    * {
      margin: 0 auto;
    }
    body {
      height: 90vh;
    }

    #comtitable {
      text-align: center;
      color: #fef2dc;
      margin: 0 auto;
      height: 50%;
    }
  h1{
    color: #fef2dc;
  }
    #comtitable td {
      background: inherit;
    }

    #boardbody tr:hover td {
      background: #3a3a3a;
    }
  </style>
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
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<div class="container" style="text-align: center;">
  <br><br><br>
<h1 style="margin-left: 45px;" class="my-4">${group.communityname} 게시판</h1>
  <br><br>
<c:import url="/WEB-INF/views/community/commuDetailMenu.jsp"/>
  <br><br><br>
<table id="comtitable">

  <tr>
    <th>Title</th>
    <th>Author</th>
    <th>Date</th>
  </tr>

  <tbody id="boardbody">
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


        <form action="commuBoardSearch.do" method="post">
          <div class="search-wrap">
            <label for="search" >검색</label>
            <br><br><br><br><input id="search" size="20" style="height: 20px; background: lightgray;" maxlength="30" type="keyword" name="keyword" placeholder="제목으로 검색하세요." value="">
            <input type="hidden" name="communityid" value="${ communityid }">
            <button type="submit" style="height: 38px; width: 50px;" class="button">검색</button>
          </div>
        </form>
      </div>
<br>
<c:import url="/WEB-INF/views/common/page.jsp" />
<%--글 작성 버튼--%>

  <c:url var="cbd" value="/writeCommuPost.do">
    <c:param name="communityid" value="${ communityid }" />
  </c:url>
  <a href="${cbd}"><button type="button" class="btn btn-primary">글 작성</button></a>
    <c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>