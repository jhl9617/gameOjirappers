<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%--core라이브러리 사용하겠다는 선언 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delPage</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/loginCss.css" />
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
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
        
        .maintitle, .username { 
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
	</head>


<body>

<form action="userDel.do" id="accesspanel" method="get"  >
   <h1 id="maintitle">(ဝ့ 𐭃ဝ့)탈퇴하기(ဝ့ 𐭃ဝ့)</h1>
   <div class="deletuser">
         <p>
         <input type="hidden"  name="user_id" value=${ loginUser.user_id}> <br>
         <label for="name" class="username" class="name">${ loginUser.user_name}  </label><br>
<!--          <label for="user_pwd" class="pas1">현재 비밀번호 입력 </label>  -->
<!--          <input type="password" class="pas" name="user_pwd" id="user_pwd"   placeholder="Password"> <br> -->
         </p>
     <tr>
		<th colspan="2">
			<input type="submit" onclick="removeUser();"  value="탈퇴하기 ₍ᐡඉ ̫ ඉᐡ₎">
			<input type="reset" onclick="location.href = 'moveup.do?user_id=${ sessionScope.loginUser.user_id }'"  value="탈퇴취소 (੭•̀ᴗ•̀)੭">&nbsp; <br>
			<input type="button" onclick="location.href = 'main.do'" value="메인페이지로">&nbsp;
			<script>
				$(document).ready(function() {		//validate() 함수가 false를 리턴할 때 submit 작동 방지
				  $("#next_form").on("submit", function(event) {
				    if (!validate()) {
				      event.preventDefault();
				    }	//if
				  });	//on submit
				});	//document ready
				
				function removeUser() {
// 					  var pwd1 = $("#user_pwd").val();
// 					  var pwd2 = $("sessionScope.loginUser.user_pwd");
					
// 					//비번 입력 여부 확인
// 					  if (pwd1 == '') { 
// 					    alert("비밀번호가 입력되지않았습니다. \n입력해주세용(ﾉ›_‹)ﾉ");
// 					    return false;
// 					  }
					
// 					  if (pwd1 !== pwd2) { 
// 					    alert("비밀번호가 일치하지 않습니다.\n다시 입력해주세용(ﾉ›_‹)ﾉ");
// 					    $("#user_pwd").val(""); 
// 					    $("#user_pwd").focus();
// 					    return false;
// 					  }
					  
					if(window.confirm("탈퇴하시겠습니까??.............진짜로???₍ᐡඉ ̫ ඉᐡ₎.........")){
					location.href="delPage.do?user_id=${ sessionScope.loginUser.user_id }";
					}//if
				}// remove
			</script>
		</th>
	</tr>	
   </div>
</form>

</body>
</html>


