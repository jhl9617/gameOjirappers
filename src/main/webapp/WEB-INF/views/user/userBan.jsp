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
	 $("#selectpinput").value = $("#selectp")[0].vlaue;
	var rtn = confirm( "${ user.user_name }(${ user.user_id })님의 포인트를" + $("#selectp option:selected").text() + "만큼 차감하시겠습니까?"); 
	
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
</script>
</head>
<body>
<h1>회원 활동정지 처리 페이지</h1>
<hr>
<br>
<h2 align="left">${ user.user_name }(${ user.user_id }) 님</h2>
<br>
<h3>회원등급 : ${ user.user_level }</h3><br>

<h3>포인트 : ${ user.user_point }</h3> &nbsp; <button id="sdpdtn" onclick="showDecP();">포인트차감</button>

<form action="adminUDecPoint.do" id="decpoint" name="decpoint" >
	차감할 포인트 : 
	<select id="selectp">
		<option value="">선택</option>
		<option value="100">100</option>
		<option value="200">200</option>
		<option value="300">300</option>
		<option value="500">400</option>
	</select>
	<input type="hidden" id="selectpinput" name="selectpinput">
	<br>차감사유 : <input name="cause">
</form>
<button id="decpointbtn" onclick="decpFunc($('selectp').value);">차감</button>

<br><br><button id="sbbtn" onclick="showUBan();">활동정지</button>
<form action="adminUBan.do"  id="ban" name="ban" >
	<input type="hidden" value="${ user.user_id }">
	정지일
	<select id="selectt">
		<option value="">선택</option>
		<option value="1day">1일</option>
		<option value="1week">1주</option>
		<option value="1month">1달</option>
		<option value="1year">1년</option>
	</select>
	<input type="hidden" id="selecttinput" name="selecttinput">
	<br>정지사유 : <input name="cause">
</form>
<button id="banbtn" onclick="banFunc();">정지</button>

<form action="userDel.do?user_id=${ user.user_id }" id="delete" >
	<input type="hidden" name="userid" value="${ user.user_id }">

</form>
<br><button onclick="deletefunc();">강제탈퇴</button>

	<!-- Footer -->
<footer id="footer">
	<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
</footer>
</body>
</html>