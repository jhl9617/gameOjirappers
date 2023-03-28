<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%--core라이브러리 사용하겠다는 선언 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
<style type="text/css">

p {text-align: center; }


h1 {
	font-size: 48pt;
	color: navy;
}


div {
	margin: 0 auto;
	width: 400px;
	height: 170px;
	border: 2px solid navy;
	border-radius: 8px;	
    text-align: center;
	position: relative;
	box-shadow: 1px 1px 5px rgb(0,0,0,  0.5);	 /* 박스 그림자 지정 */
	
}

div form {
	font-size: 14pt;
	color: navy;
	font-weight: bold;
	margin: 10px;
	padding: 10px;
	
	postion: relative;
		
}

div#loginForm form input.pos {	
	width: 250px;
	margin-top: 8px; 
	height: 25px;
	position: relative;
	border-radius: 8px;	
}

div#loginForm form input[type=submit] {
	position: relative;
 	margin-top: 8px; 
 	border-radius: 8px;	
	
	width: 350px;
	height: 40px;
	background: Lavenderblush;
	color: Indigo;
	font-size: 15pt;
	font-weight: bold;
	
}
</style>
</head>


<body>
<br>
<br>
<br>

<p>
<img src="resources/images/gamejirapper1.png" alt="gamejirapperImage">
</p>


<div id="loginForm">
	<form action="login.do" method="post">
		<label>아이디 : <input type="text" name="userid" class="pos"></label>
		<br>
		<label>암호 : <input type="password" name="userpwd" class="pos"></label>
		<br>
		<input type="submit" value="로그인">
	</form>
</div>



<c:import url="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
