<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%--core라이브러리 사용하겠다는 선언 --%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>enrollPage</title>
<style>
	@font-face {
	    font-family: 'GyeonggiTitleM';		/* 글씨체: '경기천년제목' */
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiTitleM.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	

    bady{
    margin-bottom:0px;
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
	  
	  
	  .userInfo{
	  padding:25px;
	  position: relative;
      top: -20px;
      width: 550px;
      height: 700px;
      border-radius: 20px;		 										/* 박스 모서리 라운드 처리 */
	  box-shadow: 2px 2px 2px 2px #555555;				/* 그림자 효과  */
	  }
	  
	  
</style>


<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
</head>


<body bgcolor= '#081c2b'>
<%-- <c:import url="/WEB-INF/views/common/menubar.jsp"/> --%>
<br>
<br>
<h1 align ="center"  style="color:Lightgray; font-family:'GyeonggiTitleM' " > 회원가입 </h1>
<br>
<div>

<form action="enroll.do" id="next_form" method="post" >
		<table class= "userInfo"  align="center" width="500"
				  style="padding:'5' ; color: #f56a6a; font-family:'GyeonggiTitleM'; font-weight: 300; font-size: 0.9em;" >		
				  
				  
			<tr>
				<th height= "30px;" style="color:Lightgray; " align="left" > * 아이디</th>
				<td>	
					<input name="user_id" type="text" id="user_id"  required
							  style="width:200px; height:37px; border-radius: 8px; font-size:13px; "> &nbsp;&nbsp;
					<input type="button"	value="아이디 중복확인" onclick="return CheckId()">
				</td>
			</tr>
			
			<tr>
				<th height= "30px;" style="color:Lightgray;" align="left" > * 비밀번호</th>
				<td>
					<input height= "30px;" name="user_pwd" class="pw" id="user_pwd1" type="password" required 
							  style="width:365px; height:37px; font-size:13px; border-radius: 8px;">
				</td>
			</tr>
			
			<tr>
				<th height= "30px;" style="color:Lightgray;" align="left" >* 비밀번호 확인</th>
				<td>
					<input class="pw" id="user_pwd2" type="password" required
							  style="width:365px; height:37px; font-size:13px; border-radius: 8px;">
				</td>
			</tr>
			
			<tr>
				<th height= "30px;" style="color:Lightgray;" align="left" >* 닉네임</th> 
				<td>
					<input name="user_nickname" type="text" id="user_nickname" required  
							  style="width:200px; height:37px; border-radius: 8px; font-size:13px; " > &nbsp;&nbsp;
					<input type="button" value="닉네임 중복확인" onclick="return CheckNickname()">
				</td>
			</tr>
			
			
			<tr>
				<th height= "30px;" style="color:Lightgray;" align="left" >* 이 름 </th>
				<td>
					<input name="user_name" type="text" id="user_name" required
					 		  style="width:365px; height:37px; font-size:13px; border-radius: 8px;">
				</td>
			</tr>

			
			<tr>
				<th height= "30px;" style="color:Lightgray;" align="left" >* 전화번호(-제외) </th>
				<td>
					<input name="user_phone" type="tel" id="user_phone" required
							  style="width:365px; height:37px; font-size:13px; border-radius: 8px;">
				</td>
			</tr>
				
			<tr>
				<th height= "30px;" style="color:Lightgray;" align="left" >* 이메일 </th>
				<td>
					<input name="user_email" type="text" id="user_email" required
							  style="width:365px; height:37px; font-size:13px; border-radius: 8px;">
				</td>
			</tr>
			
			<tr>
				<th height= "30px;" style="color:Lightgray;" align="left" >생일 </th>
				<td>
					<input name="user_birth" type="date" id="user_birth" required
							  style="width:370px; height:37px; font-size:13px; border-radius: 8px;">
				</td>
			</tr>
			
			<tr>
				<th height= "30px;" colspan="2" height= "50">
					<input type="submit" value="가입하기">&nbsp;&nbsp;
					&nbsp;
					<input type="button" onclick="location.href = 'javascript:history.go(-1);'"  value="이전 페이지로">&nbsp;&nbsp;
					&nbsp;
					<input type="button" onclick="location.href = 'main.do'"  value="메인화면으로"><br>
				</th>
			</tr>	
				
			
		</table>
	</form>
</div>		
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
		
		//비번 입력 여부 확인
		  if (pwd1 == '' || pwd2 == '') { 
		    alert("비밀번호가 입력되지않았습니다. \n입력해주세용(ﾉ›_‹)ﾉ");
		    $("#user_pwd1").val(""); 
		    $("#user_pwd2").val("");
		    $("#user_pwd1").focus();
		    return false;
		  }
		
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
		
		  alert("회원가입 완료 (✿˵•́ᴗ•̀˵)");
		  return true;
	} //validate close
	
	

	//아이디 중복을 확인하기위한 ajax 요청 처리용 함수
	function CheckId() {	//클릭이벤트가 다른 클릭들에 영향가지않도록 클릭설정 해제하는 메소드임 (따라서 return값이 false로 해줘야함)
		$.ajax({
			url: "useridchk.do",
			type: "get",   	
			data: { user_id: $("#user_id").val()},		

			success: function (data){		
				console.log("success : " + data);		
				if($("#user_id").val() == '') {
					alert("아이디를 입력해주세요 ✧٩(•́⌄•́๑)و ✧");
					$("#user_id").focus();		
					return false;
				}	//if
				
				if(data == "ok" ){
					alert("사용 가능한 아이디입니다💗");
					$("#user_id").focus();		//다음칸인 비번 입력칸으로 포커스 옮김
				}else{
					alert("이미 사용중인 아이디입니다 •᷄⌓•᷅ \n다시 입력해주세요!");
					$("#user_id").select();		
				}	//if
			},	//success close
			error: function(jqXHR, textStatus, errorThrown){	
				console.log("error발생!ʅ(｡◔︎‸◔︎｡)ʃ : " + jqXHR + ", " + textStatus + ", " + errorThrown);		
			}	//error close
		});		//ajax close
		return false; 		
	}// CheckId close
	
	
	
	
	//닉네임 중복을 확인하기위한 ajax 요청 처리용 함수
	function CheckNickname() {	//클릭이벤트가 다른 클릭들에 영향가지않도록 클릭설정 해제하는 메소드임 (따라서 return값이 false로 해줘야함)
		$.ajax({
			url: "nickchk.do",
			type: "post",   	
			data: { user_nickname: $("#user_nickname").val()},		

			success: function (data){		
				console.log("success : " + data);		
				if($("#user_nickname").val() == '') {
						alert("닉네임을 입력해주세요 ✧٩(•́⌄•́๑)و ✧");
						$("#user_name").focus();		
						return false;
				}	//if
				
				if(data == "ok" ){
					alert("사용 가능한 닉네임입니다💗");
					$("#user_name").focus();		
				}else{
					alert("이미 사용중인 닉네임입니다 •᷄⌓•᷅ \n다시 입력해주세요!");
					$("#user_nickname").select();		//다음칸인 닉네임 입력칸으로 포커스 옮김
				}	//if
			},	//success close
			error: function(jqXHR, textStatus, errorThrown){	
				console.log("error발생!ʅ(｡◔︎‸◔︎｡)ʃ : " + jqXHR + ", " + textStatus + ", " + errorThrown);		
			}	//error close
		});		//ajax close
		return false; 		
	}// CheckId close
	

</script>



<%-- <c:import url="/WEB-INF/views/common/footer.jsp" /> --%>
</body>
</html>













