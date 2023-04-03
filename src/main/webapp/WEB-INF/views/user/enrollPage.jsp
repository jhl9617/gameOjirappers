<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%--core라이브러리 사용하겠다는 선언 --%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<title>enrollPage</title>
<%-- <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/enrollCss.css" /> --%>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/loginCss.css" />

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
const signInBtn = document.getElementById("signIn");
const signUpBtn = document.getElementById("signUp");
const fistForm = document.getElementById("form1");
const secondForm = document.getElementById("form2");
const container = document.querySelector(".container");

signInBtn.addEventListener("click", () => {
  container.classList.remove("right-panel-active");
});

signUpBtn.addEventListener("click", () => {
  container.classList.add("right-panel-active");
});

fistForm.addEventListener("submit", (e) => e.preventDefault());
secondForm.addEventListener("submit", (e) => e.preventDefault());



//★유효성검사★  전송 보내기전 (submit 버튼 클릭시) 입력값들이 유효한지 검사
	function validate(){
		//암호와 암호확인이 일치하는지 체크함 (밑에 두개 중 편한걸로 쓰면 됨)
		var pwd1 = document.getElementById("upwd1").value;		//자바코드임
		var pwd2 = $("#upwd2").val();											//jQuery코드임
		
		if(pwd1 !== pwd2) {		//pwd1과 pwd2 값이 다르다면,
			alert ("암호와 암호확인이 일치하지 않습니다.\n다시 입력해주세요(ﾉ›_‹)ﾉ");
			document.getElementById("upwd1").select();			//다시 입력하도록 함
			return false;				//false로 끝내서, 입력값을 DB로 전송 X
		}//if
		return true;			//pwd1과 pwd2 값이 맞다면 DB로 전송함
	}//close
	
	
	
	
	//아이디 중복을 확인하기위한 ajax 요청 처리용 함수
	function CheckId() {	//클릭이벤트가 다른 클릭들에 영향가지않도록 클릭설정 해제하는 메소드임 (따라서 return값이 false로 해줘야함)
		$.ajax({
			url: "useridchk.do",
			type: "get",   	
			data: { user_id: $("#user_id").val()},		

			success: function (data){		
				console.log("success : " + data);		
				if(data == "ok" ){
					alert("사용 가능한 아이디입니다! (*●⁰ꈊ⁰●)ﾉ");
					$("#user_name").focus();		
				}else{
					alert("이미 사용중인 아이디입니다 •᷄⌓•᷅ \n다시 입력해주세요!");
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
			type: "get",   	
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



	<form action="enroll.do" method="get" onsubmit="return validate();">
		<div>
			<div class="container">
				<h2 align="center">회원가입 <br></h2>

				<label for="id" style="padding: 2px">* 아이디<br>
					<input type="text" id="user_id" required> 
					<input type="button"	value="아이디 중복확인" onclick="CheckId()">
					<br><br>
				</label> 
				
				<label for="pwd">* 비밀번호<br> 
					<input class="pw" id="pwd" type="password" required><br>
					<br><br>
				</label> 
				<label for="pwd2">* 비밀번호 확인<br> 
					<input class="pw" id="pwd2" type="password" required><br>
					<br><br>
				</label> 
				
<!-- 				<label for="nickname">* 닉네임<br>  -->
<!-- 				<input type="text" id="user_nickname" required> -->
<!-- 					<input type="button" value="닉네임 중복확인" onclick="CheckNickname()"><br> -->
<!-- 					<br><br> -->
<!-- 				</label>  -->
				
<!-- 				<label for="name">* 이 름<br>  -->
<!-- 					<input type="text" id="user_name" required><br> -->
<!-- 					<br><br> -->
<!-- 				</label>  -->
				
<!-- 				<label for="phone">* 전화번호(-제외하고 입력)<br>  -->
<!-- 					<input type="tel" id="user_phone" required><br> -->
<!-- 				<br><br> -->
<!-- 				</label>  -->
				
<!-- 				<label for="email">* 이메일<br>  -->
<!-- 					<input type="text" id="user_email" required><br> -->
<!-- 					<br><br> -->
<!-- 				</label>  -->
				
<!-- 				<label for="date">생일<br> -->
<!-- 					<input type="date" id="user_birth" required><br> -->
<!-- 					<br><br> -->
<!-- 				</label>  -->
<!-- 				<label for="answer">본인확인 질문 -->
<!-- 					<select id ="onfirm_answer_select" style="background:Oldlace; color:gray; font-size: 13pt; "> -->
<!-- 					    <option value="">선택</option> -->
<!-- 						<option value="1">당신의 이름은 무엇입니까?</option> -->
<!-- 						<option value="2">당신의 생년월일은 언제입니까?</option> -->
<!-- 						<option value="3">당신의 최고 학력은 무엇입니까?</option> -->
<!-- 						<option value="4">가장 좋아하는 어린 시절 애완 동물의 이름은 무엇입니까?</option> -->
<!-- 						<option value="5">당신이 태어난 도시는 어디입니까?</option> -->
<!-- 					</select> -->
<!-- 						<input type="text" id="onfirm_answer" placeholder="답변 입력" required > <br> -->
<!-- 				</label> -->
				<br>
				<button>가입하기</button>
			</div>
		</div>
	</form>


<!--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////  -->


				
<%-- 				
				<form action="" id="joinForm">
					<ul class="join_box">
						<li class="checkBox check01">
							<ul class="clearfix">
								<li>이용약관, 개인정보 수집 및 이용에 모두 동의</li>
								<li class="checkAllBtn"><input type="checkbox"
									name="chkAll" id="chk" class="chkAll"></li>
							</ul>
						</li>
						<li class="checkBox check02">
							<ul class="clearfix">
								<li>(필수)이용약관 동의</li>
								<li class="checkBtn"><input type="checkbox" name="chk"></li>
							</ul> 
							<textarea name="" id="">
							제 1장 총칙
							제 1 조 (목적)
							본 약관은 (주)겜지라퍼(이하 "회사"라 함)이 제공하는 인터넷 서비스(이하 "서비스"라 함)의 이용과 관련하여 회사와 회원의 권리, 의무 및 기타 필요한 사항을 규정함을 목적으로 합니다.
							제 2 조 (용어의 정의)
							본 약관에서 사용하는 주요한 용어의 정의는 다음과 같습니다.
							①회원 : 회사와 서비스 이용 계약을 체결하고 회원 아이디(ID)를 부여 받은 자를 말합니다.
							②아이디 : 회원의 식별과 회원의 서비스 이용을 위하여 회원이 선정하고 회사가 승인하는 문자나 숫자 혹은 그 조합을 말합니다(이하"ID"라 합니다).
							③비밀번호 : 회원이 부여 받은 ID와 일치된 회원임을 확인하고, 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.
							④닉네임 : 서비스 이용을 위하여 회원이 선정하고 회사가 승인한 문자나 숫자 혹은 그 조합으로 서비스 이용 시 회원을 구분하고 지칭하고 나타내는 명칭을 말합니다.
							⑤이용제한 : 회사가 약관에 의거하여 회원의 서비스 이용을 제한하는 것을 말하며, 일정 기간 서비스 이용 중지, 영구적인 서비스 이용 중지, 서비스 중 일부에 대한 이용 중지를 포함합니다.
							⑥포인트 : 각 회원에게 부여되는 점수로 서비스 내에서의 활동 정도 및 서비스의 이용에 따라 증감되는 수치를 말합니다.
							제 3 조 (약관의 효력 및 변경)
							①본 약관의 내용은 회원이 쉽게 알 수 있도록 서비스 화면에 게시합니다.
							②회사는 필요하다고 인정되는 경우 본 약관을 변경할 수 있으며, 회사가 약관을 변경할 경우에는 적용일 및 변경 내용을 명시하여 제1항의 방법으로 그 적용일의 최소 7일 전부터 공지합니다. 다만, 회원에게 불리한 약관의 변경인 경우에는 최소 30일 전부터 공지합니다. 회사는 회원에게 불리한 약관 변경의 경우 회원 정보에 기재된 이메일로 개별 통지합니다.
							③회사가 제2항에 따라 약관의 변경을 공지 또는 통지하면서 변경 약관의 적용일까지 거부 의사를 표시하지 않으면 약관 변경에 동의한 것으로 간주한다는 내용을 공지 또는 통지하였음에도 불구하고 회원이 명시적인 거부 의사를 표시하지 않은 경우 변경 약관에 동의한 것으로 봅니다. 회원은 변경된 약관에 동의하지 않는 경우 이용 계약을 해지할 수 있습니다.
							제 4 조 (약관 외 준칙)
							본 약관에 명시되지 아니한 사항에 대해서는 전기통신기본법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 기타 관련 법령의 규정에 따릅니다.
							
							제 2장 서비스 이용 계약
							제 5 조 (이용 계약의 성립)
							이용계약은 회원이 되고자 하는 자 (이하 “가입신청자”라 합니다.)가 본 약관 및 개인정보처리방침에 동의한 다음 회원가입신청을 하고 회사가 이러한 신청을 승낙함으로써 체결됩니다.
							
							본 약관은 2023년 3월 28일부터 적용됩니다.
							</textarea>
						</li>
						<li class="checkBox check03">
							<ul class="clearfix">
								<li>(필수)개인정보 수집 및 이용 동의</li>
								<li class="checkBtn"><input type="checkbox" name="chk"></li>
							</ul>
							 <textarea name="" id="">
							회사는 회원 가입시 다음과 같이 개인정보를 수집에 대한 동의를 받고 있습니다. 가입자가 아래 내용을 읽고 동의를 선택하여 클릭하면 개인정보 수집에 대해 동의한 것으로 간주합니다.
							아래 내용은 수집하는 개인정보의 항목, 수집 및 이용 목적, 보유 및 이용 기간에 대한 안내이며 자세히 읽어보신 후 동의하여 주시기 바랍니다.
							1. 수집하는 개인정보 및 이용 목적
							회사는 이용자가 게시물 작성, 이벤트 참여, 상담 등의 서비스를 이용하기 위하여 회원가입을 신청할 경우, 회사는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
							- 수집 항목: ID, 비밀번호, 이메일 주소, 핸드폰 번호
							- 수집 목적: 회원제 서비스 이용, 본인 확인 및 개인 식별, 부정 이용 방지 등 회원 관리
							- 수집 항목: 이름, 생일, 핸드폰 번호, CI, DI
							- 수집 목적: 중복 가입 방지, 부정 이용 방지, 이벤트 당첨 경품 배송
							- 수집 항목: 클라이언트 정보, IP
							- 수집 목적: 회원관리, 부정 이용 방지, 오류 상황 확인, 통계활용
							2. 개인정보의 보유 및 이용기간
							회사는 회원이 회사가 제공하는 서비스를 받는 동안 회원의 개인정보를 보유합니다. 이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용 목적이 달성된 시점에서 지체없이 파기합니다.
							▶ 수집 및 이용 목적이 달성된 시점
							• 회원 가입 정보 : 회원을 탈퇴하거나 이용 계약을 해지할 때
							• 대금 지급 정보 : 대금의 완제일 또는 채권의 소멸시효기간이 만료된 때
							• 배송 정보 : 당해 설문조사나 이벤트 등이 종료한 때
							• 본인 확인 정보 : 본인임을 확인한 때
							회원이 서비스 이용 계약을 해지하거나 제명당한 경우라고 할지라도 서비스 이용의 혼선 방지, 권리남용 및 악용 방지, 명예훼손 등 권리 침해와 관련한 분쟁 및 수사 협조 의뢰에 대비하기 위한 목적으로 약관에 명시된 60일동안 이용자의 개인정보를 보유합니다. 이때에 해당 회원의 개인정보는 개인정보 보호를 위하여 별도로 분리하여 보관, 관리합니다.
							※ 더 자세한 내용에 대해서는 사이트 하단의 개인정보처리방침을 참고하시기 바랍니다.
			    			 </textarea>
						</li>


 --%> 


	<br><br><br><br><br><br><br><br><br>
<%-- <c:import url="/WEB-INF/views/common/footer.jsp" /> --%>
</body>
</html>













