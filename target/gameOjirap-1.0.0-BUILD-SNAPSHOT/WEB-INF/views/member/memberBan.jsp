<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
$(function() {
	$('#').css('display','block');
	$('#').css('display','block');
 }); 

function showp(){
     $('#').css('display','none');
 }; 
 
function showp(){
     $('#').css('display','none');
 }; 
 
function () {
	confirm("해당 회원을 강제탈퇴시키시겠습니까?");
};
 
</script>
</head>
<body>
<h1>회원 활동정지 처리 페이지</h1>
<hr>
<br>
<h2 align="left">${  } 님</h2>
<br>
<h3>회원등급 : ${  }</h3><br>
<h3>포인트 : ${  }<input type="text" value="${  }" readonly></h3> &nbsp; <button id="" onclick="showp();">포인트차감</button>
<form action="" id="depppoint">
차감할 포인트 : 
<select>
	<option></option>
	<option></option>
	<option></option>
	<option></option>
</select>
<br>차감사유 : <input>
<input type="submit" value="차감" onclick="">
</form>
<br><br><button id="" onclick="">활동정지</button>
<form action=""  id="ban">
정지일
<select>
	<option></option>
	<option></option>
	<option></option>
	<option></option>
</select>
<br>정지사유 : <input>
<input type="submit" value="정지" onclick="">
</form>
<form action="">
&nbsp; <input type="button" value="강제탈퇴" onclick="">
</form>



<!-- Footer -->
<footer id="footer">
	<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
</footer>
</body>
</html>