<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <style>
    .list-unstyled li {
      margin: 0 auto;
      list-style: none;
    }
    .list-unstyled li a {
      width: 500px;
    }
  </style>
</head>


<body>




<div class="container" style="text-align: center;">
  <div class="tab-content" id="communityTabsContent">
    <div class="tab-pane fade show active" id="community-info" role="tabpanel" aria-labelledby="community-info-tab">
      <table class="table table-bordered">
    <ul class="list-unstyled">
      <c:url var="commuBoardListUrl" value="commuBoardList.do">
        <c:param name="communityid" value="${communityid}" />
      </c:url>
      <li><a href="${commuBoardListUrl}" class="button large">게시판</a></li>
      <c:url var="sse" value="/csview.do">
        <c:param name="communityid" value="${communityid}" />
      </c:url>
      <li><a href="${sse}"  class="button large">일정</a></li>
      <li><a href="memberinfo.do?communityid=${communityid}"  class="button large">멤버 정보</a></li>
      <c:if test="${sessionScope.loginUser.user_id eq group.user_id}">
        <li><a href="managePage.do?communityid=${communityid}"  class="button large">관리</a></li>
      </c:if>
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
