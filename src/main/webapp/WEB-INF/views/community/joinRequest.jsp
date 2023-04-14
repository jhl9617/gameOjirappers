
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
  <script src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>

  <style>
    textarea {
      background: #dcd3d8;
      box-shadow: 1px 1px 1px #555555;
    }
    h2 {
      color: #fef2dc;
    }
  </style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br>
<br>


  <center>
    <form action="req.do" method="post">
      <input type="hidden" name="user_id" value="${sessionScope.loginUser.user_id}"/>
      <input type="hidden" name="communityid" value="${communityid}"/>
      <label for="request_des"><h2>[${communityname}] 가입 신청</h2></label><br>
      <br>
      <textarea id="request_des" name="requestdes" rows="5" cols="50"></textarea><br><br>
      <input class="button" style="width: 50px; height: 40px;" type="submit" value="신청">
    </form>
  </center>

<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
