<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title></title>
  <script src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
  <style>
    @import url(https://fonts.googleapis.com/css?family=Roboto:400,500,700,300,100);

    body {
      background-color: #000000;
      font-family: "Roboto", helvetica, arial, sans-serif;
      font-size: 16px;
      font-weight: 400;
      text-rendering: optimizeLegibility;
    }

    div.table-title {
      display: block;
      margin: auto;
      max-width: 600px;
      padding:5px;
      width: 100%;
    }

    .table-title h3 {
      color: #dcd9d9;
      font-size: 30px;
      font-weight: 400;
      font-style:normal;
      font-family: "Roboto", helvetica, arial, sans-serif;
      text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
      text-transform:uppercase;
    }


    /*** Table Styles **/

    .table-fill {
      background: #b6b6b8;
      border: 2px solid #ffd0e4;
      border-radius:3px;
      border-collapse: collapse;
      margin: auto;
      max-width: 600px;
      padding:5px;
      width: 100%;
      box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
      animation: float 5s infinite;
    }

    th {
      color:#dddddd;;
      background:#343a45;
      border-bottom:4px solid #9ea7af;
      border-right: 1px solid #343a45;
      border-left: 2px solid #ffd0e4;
      border-bottom: #ffd0e4;
      font-size:23px;
      font-weight: 100;
      padding:24px;
      text-align:left;
      text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
      vertical-align:middle;
    }

    th:first-child {
      border-top-left-radius:5px;
    }

    th:last-child {
      border-top-right-radius:5px;
      border-right:none;
    }

    tr {
      border-bottom-: 1px solid #ffd0e4;
      border-top: 1px solid #ffd0e4;
      color:#666B85;
      font-size:16px;
      font-weight:normal;
      text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
    }

    tr:not(:last-child):hover td {
      background:#4E5066;
      color:#FFFFFF;
      border-top: 1px solid #ffd0e4;
      border-left: 2px solid #ffd0e4;
    }
    tr:last-child td{
      background: #343a45;
      text-align: center;
    }
    td {
      border-left: 2px solid #ffd0e4;
    }

    #goback {
      border-radius: 5px;
      background: cadetblue;
    }
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
      <tbody class="table-hover">
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
      <tr>
        <td colspan="3"><button id="goback" onclick="javascript:history.go(-1);">이전페이지로 이동</button></td>
      </tr>
      </tbody>
    </table>
</div>

<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
