<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%--core라이브러리 사용하겠다는 선언 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/loginCss.css" />
</head>


<body>
<div class="background-wrap">
   <div class="background"></div>
</div>


<form id="accesspanel" method="get">
   <h1 id="litheader">GAMEJIRAPP</h1>
   <div class="inset">
         <p>
            <input type="text" name="login" id="user_id" placeholder="ID">
         </p>
         <p>
            <input type="password" name="login" id="user_pwd"   placeholder="Password">
         </p>
   </div>
   <p class="p-container">
      <input type="button" name="Login" id="go" onclick="goLogin()" value="로그인">
      <input type="button" onclick="location.href = 'enrollPage.do'"  value="회원가입">
   </p>
</form>


<form id="User_Info" action="login.do" method="get">
   <input type="hidden" name="login_id" id="login_id" />
   <input type="hidden" name="login_pwd" id="login_pwd" />
</form>

</body>
</html>

<!-- Jquery 포함 코드 -->
<script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
<!-- ajax 포함 코드 -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>


 // 엔터키 이벤트
 $('[name=login]').on('keyup', function() {
    
    // 입력된 키가 엔터키일때 로그인 실행
    if (window.event.keyCode == 13) {
       goLogin();
    }
 });
 
 //로그인 버튼 이벤트 (로그인 기능이 여러번(아이디에서 엔터, 비번에서 엔터, 로그인버튼 클릭) 호출되므로 함수로 묶어줌)
 var goLogin = function() {
    // form 버전--------------------------------------------------------------------------------------------------------------------------
   //action은 상수이므로 태그에 직접 설정
    
    //폼에 데이터 셋팅
//     $('#login_id').val( $('#user_id').val() );
//     $('#login_pwd').val( $('#user_pwd').val() );
    
//     $('#User_Info').submit();
    // form 버전--------------------------------------------------------------------------------------------------------------------------
    
    // ajax 버전--------------------------------------------------------------------------------------------------------------------------
    //ajax를 쓰려면 스크립트에 포함을 시켜줘야함 (45번째 라인)
    var param = {
        user_id :  $('#user_id').val()
      , user_pwd : $('#user_pwd').val()
    }
    
    $.ajax({
         url: 'login.do'
       , type: 'GET'
       , data: param
       , contentType: 'application/json'
    });
    // ajax 버전--------------------------------------------------------------------------------------------------------------------------
    
 }
</script>


