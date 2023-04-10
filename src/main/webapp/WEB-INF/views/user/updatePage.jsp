<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myinfoPage</title>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js" }></script>
<%-- javascript 함수 사용 구문임 --%>
<script type="text/javascript">

</script>
</head>




<body>
<h1> 정보수정 페이지임</h1>

<body>
<h1 align = "center"> 회원 정보 수정 페이지</h1>
<br>
<%-- DB전송을 위한 form태그 준비  --%>
<form action="moveUpdatePage.do" method="get" onsubmit="return validate();">			<%-- 이 form의 수정정보를 받을 mupdate.do 준비  --%>
		<%--원래 암호도 함께 전송함(숨겨서 보냄) --%>
		<input type="hidden" name="origin_user_pwd" value="${user.user_pwd }">	<%--value가 암호화되어있는 값임 --%>
		
		
<table id= "tbl" align="center" width="500" cellspacing="5" cellpadding="0" border="1">		
	<tr>
		<th width="120"> 이 름 </th>
			<td><input type="text"  name="user_name" value="${ requestScope.user.user_name }" readonly>  </td>			<%-- [  readonly  ] 하면 클릭안되고, 수정 불가됨 (읽기전용) --%>
	</tr>					
	<tr>
		<th width="120"> 아이디</th>
			<td> <input type="text"  name="user_id" value="${ requestScope.user.user_id }" readonly>	</td>
	</tr>		
	<tr>
		<th width="120"> 비밀번호</th>
			<td> <input type="password" name="user_pwd" id="upwd1" > 	</td>
	</tr>					
	<tr>
		<th width="120"> 비밀번호확인 </th>
			<td> <input type="password" id="upwd2" onblur="validate();" > 	</td>
	</tr>			
	<tr>
		<th width="120"> 전화번호 </th>
			<td> <input type="tel"  name="user_phone" value="${ requestScope.user.user_phone }">	</td> 
	</tr>					
	<tr>
		<th width="120"> 이메일	</th>
			<td> <input type="email"  name="user_email" value="${ requestScope.user.user_email }"> </td>
	</tr>	
	
	<tr>
		<th colspan="2">
			<%--변수를 이용해서 URL이동 처리하는 방법 확인용 // xml코드이므로, xml코드 규칙을 따라야함. 띄어쓰기 조심할것 --%>
			<input type="submit" value="수정하기( ੭ ･ᴗ･ )੭">&nbsp;
			<input type="reset" value="수정취소 ٩(•ิ˓̭ •ิ )ง">&nbsp;
			<a href= "javascript:history.go(-1);"><br>이전 페이지로 이동 </a>			<%--javascript:history.go(-1); => 접속한 히스토리를 기준으로, 이전 페이지 이동하는 코드--%>
			<a href= "main.do">시작페이지로 이동</a>
		</th>
	</tr>	
	
</table>
</form>
<hr>


</body>
</html>






</body>
</html>