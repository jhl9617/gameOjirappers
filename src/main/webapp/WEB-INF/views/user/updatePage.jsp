<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myinfoPage</title>
    <style>
	@font-face {
	    font-family: 'GyeonggiTitleM';		/* 글씨체: 경기천년제목 */
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiTitleM.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	
	bady{
    margin-bottom:0px;
    font-family: 'GyeonggiTitleM';
    border-collapse: collapse;
    }
	
	.userInfo{
	  padding:20px;
	  position: relative;
      top: -20px;
      width: 400px;
      height: 80px;
      border-radius: 20px;		 										/* 박스 모서리 라운드 처리 */
	  box-shadow: 2px 2px 2px 2px #555555;				/* 그림자 효과  */
	}
	
	input[type="submit"],
	input[type="button"],
	input[type="reset"],
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
	  width: 100px;
	  letter-spacing: 0.075em;
	  line-height: 3.5em;
	  padding: 0;
	  text-align: center;
	  text-decoration: none;
	  text-transform: uppercase;
	  white-space: nowrap; }
	  }
	
	 a {
	 display: block; 
	 font-weight: 300;
	 text-decoration: none;
	 }
	
	</style>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js" }></script>
<%-- javascript 함수 사용 구문임 --%>
<script type="text/javascript">
$(document).ready(function() {		//validate() 함수가 false를 리턴할 때 submit 작동 방지
	  $("#next_form").on("submit", function(event) {
	    if (!validate()) {
	      event.preventDefault();
	    }	//if
	  });	//on submit
	});	//document ready
	
	//★유효성검사★  전송 보내기전 (submit 버튼 클릭시) 입력값들이 유효한지 검사
	function validate() {
		  var pwd1 = $("#user_pwd1").val();
		  var pwd2 = $("#user_pwd2").val();
		  var id = $("#user_id").val();
		
		
		// 패스워드와 ID가 동일한지 확인
		  if (pwd1 == id) { 
		    alert("Password는 ID와 동일하면 안돼용(ﾉ›_‹)ﾉ");
		    $("#user_pwd1").val(""); 
		    $("#user_pwd2").val("");
		    $("#user_pwd1").focus();
		    return false;
		  }
		
		  if (pwd1 !== pwd2) { 
		    alert("비밀번호와 비밀번호확인이 일치하지 않습니다..\n다시 입력해주세용(ﾉ›_‹)ﾉ");
		    $("#user_pwd1").val(""); 
		    $("#user_pwd2").val("");
		    $("#user_pwd1").focus();
		    return false;
		  }
		
		  alert("정보 수정 완료 (✿˵•́ᴗ•̀˵)");
		  return true;
	} //validate close
	
</script>
</head>





<body bgcolor= '#081c2b'>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<h1 style="color:Lightgray; font-family: 'GyeonggiTitleM' " align ="center" > 내 정보 수정</h1>
<br>
<div>
<%-- DB전송을 위한 form태그 준비  --%>
<form action="UpdateUser.do" method="post" style="font-family: 'GyeonggiTitleM'; ">			<%-- 이 form의 수정정보를 받을 mupdate.do 준비  --%>
		<%--원래 암호도 함께 전송함(숨겨서 보냄) --%>
		<input type="hidden" name="origin_user_pwd" value="${requestScope.user.user_pwd }">	<%--value가 암호화되어있는 값임 --%>
		
		
		<table class= "userInfo" id= "tbl" align="center" width="500" style="padding:'5' " >		
			<tr>
				<th width="261" height= "30px;	" style="color:Lightgray;"> 이 름 </th>
					<td><input type="text"  name="user_name" value="${ requestScope.user.user_name }" readonly>  </td>			<%-- [  readonly  ] 하면 클릭안되고, 수정 불가됨 (읽기전용) --%>
			</tr>					
			<tr>
				<th height= "30px;" style="color:Lightgray; "> 아이디</th>
					<td> <input type="text"  name="user_id" value="${ requestScope.user.user_id }" readonly>	</td>
			</tr>		
			<tr>
				<th height= "30px;" style="color:Lightgray;"> 수정할 비밀번호 </th>
					<td> <input type="password" name="user_pwd" id="user_pwd1" > 	</td>
			</tr>					
			<tr>
				<th height= "30px;" style="color:Lightgray;"> 비밀번호확인 </th>
					<td> <input type="password" id="user_pwd2" onblur="validate();" > 	</td>
			</tr>			
			<tr>
				<th height= "30px;" style="color:Lightgray;"> 수정할 전화번호 </th>
					<td> <input type="tel"  name="user_phone" value="${ requestScope.user.user_phone }">	</td> 
			</tr>					
			<tr>
				<th height= "30px;" style="color:Lightgray;"> 수정할 이메일</th>
					<td> <input type="email"  name="user_email" value="${ requestScope.user.user_email }"> </td>
			</tr>	
			
			<tr>
				<th height= "30px;" colspan="2" height= "50">
					<%--변수를 이용해서 URL이동 처리하는 방법 확인용 // xml코드이므로, xml코드 규칙을 따라야함. 띄어쓰기 조심할것 --%>
					<input type="submit" value="수정하기">&nbsp;
					<input type="button" onclick="location.href = 'javascript:history.go(-1);'"  value="이전 페이지로">&nbsp;
					<input type="button" onclick="location.href = 'main.do'"  value="메인화면으로"><br>
				</th>
			</tr>	
			
		</table>
</form>
</div>
<hr>


</body>
</html>






</body>
</html>