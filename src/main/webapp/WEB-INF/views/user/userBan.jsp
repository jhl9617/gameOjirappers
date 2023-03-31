<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
$(function() {
	$('#depppoint').css('display','block');
	$('#ban').css('display','block');
	$('#delete').css('display','block');
 }); 


function showDecP(){

     $('#').css('display','none');
 }; 
 
function showp(){
     $('#').css('display','none');
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

<h3>포인트 : ${ point }</h3> &nbsp; <button id="" onclick="showDecP();">포인트차감</button>

<form action="adminUDecPoint.do" id="depppoint" onsubmit="return confirm('${ username }(${ userid })님의 포인트를 $(#selectp option:checked)만큼 차감하시겠습니까?');">
차감할 포인트 : 
<select id="selectp">
	<option>100</option>
	<option>200</option>
	<option>300</option>
	<option>400</option>
</select>
<br>차감사유 : <input>
<input type="submit" value="차감">
</form>
<br><br><button id="" onclick="showUBan">활동정지</button>
<form action="adminUBan.do"  id="ban" onsubmit="return confirm('${ username }(${ userid })님의 활동을 $(#selectbt option:checked)동안 정지하시겠습니까?');">
정지일
<select id="selectbt">
	<option>1일</option>
	<option>1주</option>
	<option>1달</option>
	<option>1년</option>
</select>
<br>정지사유 : <input>
<input type="submit" value="정지" >
</form>
<form action="adminUDelete.do" id="delete" onsubmit="return confirm('${ username }(${ userid })님을 강제탈퇴시키시겠습니까?');">
	&nbsp; <input type="submit" value="강제탈퇴">
</form>



	<!-- Footer -->
<footer id="footer">
	<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
</footer>
</body>
</html>