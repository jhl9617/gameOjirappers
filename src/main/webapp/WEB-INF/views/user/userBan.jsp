<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js" ></script>
<script type="text/javascript">
$(function() {
	$('#decpoint').css('display','block');
	$('#ban').css('display','block');
 }); 

function showDecP(){
     $('#decpoint').css('display','none');
 }; 
 
function showUBan(){
     $('#ban').css('display','none');
 }; 
 
 function selectp(point) {
	 $("#selectpinput").value() = point;
 };
 
 function selectt(time) {
	 $("#selecttinput") = time;
 };

 function banFunc() {
	var rtn = confirm(${ username } + "(" + ${ userid } + ")님의 활동을" + $("#selecttinput").value() + "동안 정지하시겠습니까?"); 
	`
	if(rtn) {
		$("#ban").submit();
	}
 };
 
 function decpFunc() {
	var rtn = confirm(${ username } + "(" + ${ userid } + ")님의 포인트를" + $("#selectpinput").value() + "만큼 차감하시겠습니까?"); 
	
	if(rtn) {
		$("#decpoint").submit();
	}
};

function deletefunc() {
	var rtn = confirm(${ username } + "(" + ${ userid } + ")님을 강제탈퇴시키시겠습니까?"); 
	
	if(rtn) {
		$("#delete").submit();
	}
};
</script>
</head>
<body>
<h1>회원 활동정지 처리 페이지</h1>
<hr>
<br>
<h2 align="left">${ username } 님</h2>
<br>
<h3>회원등급 : ${ usergrade }</h3><br>

<h3>포인트 : ${ point }</h3> &nbsp; <button onclick="showDecP();">포인트차감</button>

<form action="adminUDecPoint.do" id="decpoint" name="decpoint" >
	차감할 포인트 : 
	<select name="selectp" onchange="selectp(this.value);">
		<option value="">선택</option>
		<option value="100">100</option>
		<option value="200">200</option>
		<option value="300">300</option>
		<option value="500">400</option>
	</select>
	<input type="hidden" id="selectpinput" name="selectpinput">
	<br>차감사유 : <input name="cause">
	<button onclick="decpFunc();">차감</button>
</form>
<br><br><button onclick="showUBan();">활동정지</button>
<form action="adminUBan.do"  id="ban" name="ban" >
	<input type="hidden" value="${ userid }">
	정지일
	<select name="selectt" onchange="selectt(this.value);">
		<option value="">선택</option>
		<option value="1day">1일</option>
		<option value="1week">1주</option>
		<option value="1month">1달</option>
		<option value="1year">1년</option>
	</select>
	<input type="hidden" id="selecttinput" name="selecttinput">
	<br>정지사유 : <input name="cause">
	
	<button onclick="banFunc();">정지</button>
</form>
<form action="adminUDelete.do" id="delete" >
	<input type="hidden" name="userid" value="${ userid }">
	&nbsp; <button onclick="deletefunc();">강제탈퇴</button>
</form>


	<!-- Footer -->
<footer id="footer">
	<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
</footer>
</body>
</html>