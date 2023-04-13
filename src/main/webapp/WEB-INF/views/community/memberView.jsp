<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title></title>
  <script src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
  <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/table.css">
  <style>

  </style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br>
<br>

<div>
  <div class="table-title">
    <h3>회원 목록</h3>
  </div>
    <table class="table-fill">
      <thead>
        <tr>
          <th>아이디</th>
          <th>구분</th>
          <th>가입일</th>
        </tr>
      </thead>
      <tbody class="table-hover" style="text-align: center;">
      <c:forEach items="${list}" var="member">
        <c:if test="${member.member_roll eq 'Y'}">
          <c:set var="mroll" value="관리자"/>
        </c:if>
        <c:if test="${member.member_roll eq 'N'}">
          <c:set var="mroll" value="일반회원"/>
        </c:if>
        <tr>
          <td>${member.user_id}</td>
          <td>${mroll}</td>
          <td><fmt:formatDate value="${member.member_date}" type="date" pattern="yyyy-MM-dd"/></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  <div style="text-align: center; margin-top: 100px;">
  <button id="goback" class="button" onclick="javascript:history.go(-1);">이전페이지로 이동</button>
  </div>
</div>

<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
