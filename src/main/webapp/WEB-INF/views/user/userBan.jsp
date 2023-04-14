<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<style>
	   @font-face {
       font-family: 'GyeonggiTitleM';      /* 글씨체: 경기천년제목 */
       src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiTitleM.woff') format('woff');
       font-weight: normal;
       font-style: normal;
  	   }
  	   
		#userst {
			text-align: center;
			margin: 0 auto;
		}

      * { 
      color: Lightgray ;
      font-family: 'GyeonggiTitleM';
      }   
      
      
	input[type="submit"],
	input[type="button"], 
	.button {
	font-family: 'GyeonggiTitleM';
	  -moz-appearance: none;
	  -webkit-appearance: none;
	  -ms-appearance: none;
	  appearance: none;
	  -moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  -webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  -ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  background-color: transparent;
	  border-radius: 8px;
	  border: 1;
	  box-shadow: 1px 1px 1px 1px #f56a6a;
	  color: Lightgray ;
	  cursor: pointer;
	  display: inline-block;
	  font-size: 0.8em;
	  font-weight: 700;
	  height: 40px;
	  width: 150px;
	  letter-spacing: 0.075em;
	  line-height: 3.5em;
	  padding: 0;
	  text-align: center;
	  text-decoration: none;
	  text-transform: uppercase;
	  white-space: nowrap; }
	</style>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js" ></script>
<script type="text/javascript">
$(function() {
	<c:if test="${not empty message}">
    	alert("${message}");
    </c:if>
	
	$('#decpoint').css('display','none');
	$('#ban').css('display','none');
	$('#decpointbtn').css('display','none');
	$('#banbtn').css('display','none');
 }); 

function showDecP(){
	$('#sdpdtn').css('display','none');
     $('#decpoint').css('display','block');
     $('#decpointbtn').css('display','block');
 }; 
 
function showUBan(){
	$('#sbbtn').css('display','none');
     $('#ban').css('display','block');
     $('#banbtn').css('display','block');
 }; 
 
 function selectp() {
	 console.log("test");
	 /* $("#selectpinput").value = point; */
 };
 
 function selectt(time) {
	 $("#selecttinput").value = time;
 };

 function banFunc() {
	$("#selecttinput")[0].value = $("#selectt")[0].value;
	var rtn = confirm("${ user.user_name }(${ user.user_id })님의 활동을 " + $("#selectt option:selected").text() + "동안 정지하시겠습니까?"); 
	
	if(rtn == true) {
		$("#ban").submit();
	}
 }; 
 
 function decpFunc() {
	 $("#selectpinput")[0].value = $("#selectp")[0].value;
	var rtn = confirm( "${ user.user_name }(${ user.user_id })님의 포인트를 " + $("#selectp option:selected").text() + "만큼 차감하시겠습니까?"); 
	
	if(rtn) {
		$("#decpoint").submit();
	}
};

function deletefunc() {
	var rtn = confirm("${ user.user_name }(${ user.user_id })님을 강제탈퇴시키시겠습니까?"); 
	
	if(rtn) {
	      $("#delete").submit();
	   }
};

function adminBanR() {
	var rtn = confirm("${ user.user_name }(${ user.user_id })님을 정지 해제 처리하시겠습니까?");
	
	if(rtn) {
		$("#banr").submit();
	}
}
</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<h1 align="center">회원 활동정지 처리 페이지</h1>
<div id="userst">
<br>
<h1 align="center">${ user.user_name }(${ user.user_id }) 님</h1>
<h2>닉네임 : ${ user.user_nickname }</h2>
<p>가입일 : ${ user.user_enrolldate }</p>
<p>현재 회원등급 : ${ user.user_level }</p>
<p>포인트 : ${ user.user_point }&nbsp; <input type="button" id="sdpdtn" onclick="showDecP();" value="포인트차감하기"> </p> 

<form action="adminUDecPoint.do?user_id=${ user.user_id }" method="post" id="decpoint" name="decpoint" >
	차감할 포인트 : 
	<select id="selectp">
		<option value="">선택</option>
		<option value="100">100</option>
		<option value="200">200</option>
		<option value="300">300</option>
		<option value="400">400</option>
	</select>
	<input type="hidden" id="selectpinput" name="selectpinput">
	<br>차감사유 : <input name="causep">
</form>
<input type="button" value="차감" id="decpointbtn" onclick="decpFunc();" >

<c:if test="${ user.user_status eq 'run' }"><h3>활동상태 : 활동가능</h3></c:if>
<c:if test="${ user.user_status eq 'pause' && user.ban_release_date ne null }">
	<h3>활동상태 : 활동불가(${ user.ban_release_date } 까지) &nbsp; <button onclick="adminBanR();">활동정지해제</button></h3> 
</c:if> 
<form action="adminUBanR.do?user_id=${ user.user_id }"  method="post" id="banr"></form>
<c:if test="${ user.user_status eq 'pause' && user.ban_release_date eq null }">
	<h3>활동상태 : 활동불가(영구) &nbsp; <button onclick="adminBanR();">활동정지해제</button></h3> </c:if>
<input type="button" value="활동정지" id="sbbtn" onclick="showUBan();">
<form action="adminUBan.do?user_id=${ user.user_id }"  method="post" id="ban" name="ban">정지일
	<select id="selectt">
		<option value="">선택</option>
		<option value="1day">1일</option>
		<option value="1week">1주</option>
		<option value="1month">1달</option>
		<option value="1year">1년</option>
	</select>
	<input type="hidden" id="selecttinput" name="selecttinput">
	<br>정지사유 : <input name="causeb">
</form>
<input type="button" value="정지"  id="banbtn" onclick="banFunc();"> &nbsp;
<input type="button" value="강제탈퇴" onclick="deletefunc();">

<form action="adminDel.do?user_id=${ user.user_id }" id="delete" >
</form>
<br>
</div>
	<!-- Footer -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>