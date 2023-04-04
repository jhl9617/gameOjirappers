<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
    .menu-buttons {
      display: flex;
      flex-direction: row;
      flex-wrap: nowrap;
      justify-content: space-around;
      list-style-type: none;
      padding: 0;
      margin: 0;
    }
    .menu-buttons li {
      flex: 1;
    }
    .button.large {
      display: block;
      width: 100%;
      text-align: center;
      text-decoration: none;
    }
  </style>
</head>


<body>




<div class="container">
  <div class="tab-content" id="communityTabsContent">
    <div class="tab-pane fade show active" id="community-info" role="tabpanel" aria-labelledby="community-info-tab">
      <table class="table table-bordered">
    <ul class="list-unstyled">
      <c:url var="cdt" value="/viewgroup.do">
        <c:param name="communityid" value="${ communityid }" />
      </c:url>
      <li><a href="${cdt}" class="button large">커뮤니티 정보</a></li>
      <c:url var="commuBoardListUrl" value="commuBoardList.do">
        <c:param name="communityid" value="${communityid}" />
      </c:url>
      <li><a href="${commuBoardListUrl}" class="button large">게시판</a></li>
      <c:url var="sse" value="/csview.do">
        <c:param name="communityid" value="${communityid}" />
      </c:url>
      <li><a href="${sse}"  class="button large">일정</a></li>
      <li><a href="memberInfo.jsp"  class="button large">멤버 정보</a></li>
      <li><a href="manager.jsp"  class="button large">관리</a></li>
    </ul>
      </table>
    </div>

  </div>
</div>

<%--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>--%>
</body>
</html>
