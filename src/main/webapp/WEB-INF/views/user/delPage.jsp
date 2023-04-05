<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%--core라이브러리 사용하겠다는 선언 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delPage</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/loginCss.css" />
   <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
        }
        
        .id { 
        color: Royalblue;
        font-size: 2.5rem;
	    width:100%;	
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    font-weight: 600;
        }
        
        .pas {
        width: 120px; 	          /* 가로너비 */
		height: 20px;	          /* 세로너비 */
		color: red;
		background: Lightblue;
		 margin: 0 auto;
/* 		position: static; */
        } 
        .pas1 {
        width: 120px; 	          /* 가로너비 */
		height: 20px;	          /* 세로너비 */
		color: Indigo;
        } 
   
   
        
   input[type="submit"],
   input[type="reset"],
   input[type="button"],
   .button {
     -moz-appearance: none;
     -webkit-appearance: none;
     -ms-appearance: none;
     appearance: none;
     -moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
     -webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
     -ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
     transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
     background-color: transparent;
     border-radius: 0.375em;
     border: 0;
     box-shadow: inset 0 0 0 2px #f56a6a;
     color: Lightcoral !important;
     cursor: pointer;
     display: inline-block;
     font-family: "Roboto Slab", serif;
     font-size: 0.8em;
     font-weight: 700;
     width: 150px;
     height: 3.5em;
     letter-spacing: 0.075em;
     line-height: 3.5em;
     padding: 0 2.25em;
     text-align: center;
     text-decoration: none;
     text-transform: uppercase;
     white-space: nowrap; }
        
        
    </style>
    
    <script type="text/javascript">
        // 비밀번호 미입력시 경고창
        function checkValue(){
            if(!document.deleteform.password.value){
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
        }
    </script>

	<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
	<script type="text/javascript">


	//★유효성검사★  전송 보내기전 입력값들이 유효한지 검사
	function validate(){
		//[[ 암호확인의 포커스가 사라질 때 ]] 암호와 암호확인이 일치하는지 체크함 (밑에 두개 중 편한걸로 쓰면 됨)
		var pwd1 = document.getElementById("upwd1").value;		//자바코드임
		var pwd2 = $("#upwd2").val();											//jQuery코드임
		
		if(pwd1 !== pwd2) {		//pwd1과 pwd2 값이 다르다면,
			alert ("암호와 암호확인이 일치하지 않습니다.\n다시 입력해주세요(ﾉ›_‹)ﾉ");
			document.getElementById("upwd1").select();			//다시 입력하도록 함
		}//if
	}//close
	</script>
	</head>


<body>

<form id="accesspanel" method="get"  action="userDel.do">
   <h1 id="litheader">(ဝ့ 𐭃ဝ့)탈퇴하기(ဝ့ 𐭃ဝ့)</h1>
   <div class="deletuser">
         <p>
         <label for="id" class="id">${ loginUser.user_name}님 <br> </label>
         <label for="user_pwd" class="pas1">비밀번호  <br> </label> 
         <input type="password" class="pas" name="user_pwd" id="user_pwd"   placeholder="Password"> <br>
         <label for="user_pwd2" class="pas1" >비밀번호확인  <br> </label>
         <input type="password" class="pas"  id="user_pwd2"   placeholder="Password">
         </p>
         
       <tr>
		<th colspan="2">
			<%--변수를 이용해서 URL이동 처리하는 방법 확인용 // xml코드이므로, xml코드 규칙을 따라야함. 띄어쓰기 조심할것 --%>
			<input type="button" onclick="removeUser();"  value="탈퇴하기 ₍ᐡඉ ̫ ඉᐡ₎">
<!-- 			<input type="reset" onclick="location.href = 'javascript:history.go(-1);'"  value="탈퇴취소 (੭•̀ᴗ•̀)੭">&nbsp; <br> -->
			<input type="reset" onclick="location.href = 'moveup.do?user_id=${ sessionScope.loginUser.user_id }'"  value="탈퇴취소 (੭•̀ᴗ•̀)੭">&nbsp; <br>
			<input type="button" onclick="location.href = 'main.do'" value="메인페이지로">&nbsp;
		<script>
			function removeUser() {
				if(window.confirm("탈퇴하시겠습니까??.............진짜로???₍ᐡඉ ̫ ඉᐡ₎.........")){
				location.href="delPage.do?user_id=${ sessionScope.loginUser.user_id }";
				}
			}// remove
		</script>
		</th>
	</tr>	
	
   </div>
</form>

</body>
</html>


