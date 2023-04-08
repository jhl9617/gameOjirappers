<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#useridDiv').css('display','none');
    $('#usernameDiv').css('display','none');
    
    $('input[name=item]').on("change",function(){
       showDiv();
    });
 }); //document.ready
 
function showDiv(){
    if($('input[name=item]').eq(0).is(':checked')){
       $('#useridDiv').css('display','block');
       $('#usernameDiv').css('display','none');
    }   // if 1
    if($('input[name=item]').eq(1).is(':checked')){
       $('#useridDiv').css('display','none');
       $('#usernameDiv').css('display','block');
    }   // if 2
 }; // showDiv
 

</script>
<body>
<h1 align="center">회원 관리 페이지</h1>
<h3 align="center">총 회원수 : ${ listCount }명</h3>
<center>
<div>
   <h2>검색할 항목을 선택하세요.</h2>

   <input type="radio" name="item" value="userid"> 아이디

   &nbsp; &nbsp;
   <input type="radio" name="item" value="username" > 이름
</div>
<div id="useridDiv">
   <form action="searchUserid.do" method="post">
      <label>검색할 회원아이디를 입력하세요 : 
         <input type="search" name="uid">
      </label>
      <input type="submit" value="검색">
   </form>
</div>
<div id="usernameDiv">
   <form action="searchUserName.do" method="post">
      <label>검색할 회원이름을 입력하세요 : 
         <input type="seach" name="uname">
      </label>
      <input type="submit" value="검색">
   </form>
</div>
</center>

<!-- 목록 출력 영역 -->
<center>
   <button onclick="javascript:location.href='${pageContext.servletContext.contextPath}/uadmin.do?page=${currentPage}';">목록 보기</button>   
</center>
<br>
<table align="center" width="500" border="1" cellspacing="0" cellpadding="1">
   <tr>
      <th>회원아이디</th>
      <th>회원이름</th>
      <th>회원등급</th>
      <th>포인트</th>
      <th>가입일</th>
      <th></th>
   </tr>
   <c:forEach items="${ requestScope.list }" var="u">
      <tr align="center">
         <td>${ u.user_id }</td>
 
         <td>${ u.user_name }</td>
         <td>${ u.user_level }</td>
         <td>${ u.user_point }</td>
         <td>
            <fmt:formatDate value="${ u.board_click_day }" 
               pattern="yyyy-MM-dd"/>
         </td>
         
         <td>

            <form action="uban.do?user_id=${ u.user_id }" method="post">

               <input type="submit" value="활동정지/포인트차감">
            </form>
         </td>

      </tr>
   </c:forEach>
</table>
<hr>

<!-- Footer -->
<footer id="footer">
   <p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
</footer>
</body>
</html>