<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%--core라이브러리 사용하겠다는 선언 --%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>enrollPage</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/enrollCss.css" />


<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">


//★유효성검사★  전송 보내기전 (submit 버튼 클릭시) 입력값들이 유효한지 검사
function validate() {
	var pwd1 = document.getElementById("user_pwd").value;
	var pwd2 = $("#user_pwd2").val();

	if (pwd1 === pwd2) { // If pwd1 and pwd2 are the same
		return true; // Send input values to DB
	} else {
		alert("Password and password confirmation do not match.\nPlease enter again (ﾉ›_‹)ﾉ");
		document.getElementById("user_pwd").select(); // Make it re-enter
		return false; // End with false, do not send input values to DB
	}
}

	//아이디 중복을 확인하기위한 ajax 요청 처리용 함수
	function CheckId() {	//클릭이벤트가 다른 클릭들에 영향가지않도록 클릭설정 해제하는 메소드임 (따라서 return값이 false로 해줘야함)
		$.ajax({
			url: "useridchk.do",
			type: "get",   	
			data: { user_id: $("#user_id").val()},		

			success: function (data){		
				console.log("success : " + data);		
				if(data == "ok"){
					alert("사용 가능한 아이디입니다! (*●⁰ꈊ⁰●)ﾉ");
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
				if(data == "ok" ){
					alert("사용 가능한 닉네임입니다! (*●⁰ꈊ⁰●)ﾉ");
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
</head>


<body>

	<form action="enroll.do" method="post" onsubmit="return validate();">
		<div>
			<div class="container">
				<h2 align="center">회원가입 <br></h2>

				<label for="id" style="padding: 2px">* 아이디<br>
					<input name="user_id" 
								type="text" id="user_id"  required> 
					<input type="button"	value="아이디 중복확인" onclick="return CheckId()">
				<br><br>
				</label> 
				
				<label for="pwd">* 비밀번호<br> 
					<input name="user_pwd" 
								class="pw" id="user_pwd" type="password" required ><br>
				<br><br>
				</label> 
				<label for="pwd2">* 비밀번호 확인<br> 
					<input class="pw" id="user_pwd2" type="password" required><br>
				<br><br>
				</label> 
				
				<label for="nickname">* 닉네임<br> 
				<input name="user_nickname"
							type="text" id="user_nickname" required>
				<input type="button" value="닉네임 중복확인" onclick="return CheckNickname()"><br>
				<br><br>
				</label> 
				
				<label for="name">* 이 름<br> 
					<input name="user_name"
								type="text" id="user_name" required><br>
				<br><br>
				</label> 
				
				<label for="phone">* 전화번호(-제외하고 입력)<br> 
					<input name="user_phone"
								type="tel" id="user_phone" required><br>
				<br><br>
				</label> 
				
				<label for="email">* 이메일<br> 
					<input name="user_email"
								type="text" id="user_email" required><br>
				<br><br>
				</label> 
				
				<label for="date">생일<br>
					<input name="user_birth"
								type="date" id="user_birth" required><br>
				<br><br>
				</label> 
				<label for="answer">본인확인 질문
					<select id ="onfirm_answer_select" style= "background:Oldlace; color:gray; font-size: 13pt; ">
					    <option value="">선택</option>
						<option value="1">당신의 이름은 무엇입니까?</option>
						<option value="2">당신의 생년월일은 언제입니까?</option>
						<option value="3">당신의 최고 학력은 무엇입니까?</option>
						<option value="4">가장 좋아하는 어린 시절 애완 동물의 이름은 무엇입니까?</option>
						<option value="5">당신이 태어난 도시는 어디입니까?</option>
					</select>
						<input name="confirm_answer"
									type="text" id="onfirm_answer" placeholder="답변 입력" required > <br>
				</label>
				<br>
			</div>
			<input type="submit" value="가입하기">
		</div>
	</form>
				




	<br><br><br><br><br><br><br><br><br>
<%-- <c:import url="/WEB-INF/views/common/footer.jsp" /> --%>
</body>
</html>













