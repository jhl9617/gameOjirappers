<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%--core라이브러리 사용하겠다는 선언 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delPage</title>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
<style type="text/css">
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
  width: 102px;
  letter-spacing: 0.075em;
  line-height: 3.5em;
  padding: 0;
  text-align: center;
  text-decoration: none;
  text-transform: uppercase;
  white-space: nowrap; }
   
   
  .userInfo{
  padding:30px;
  position: relative;
  top: -20px;
  width: 250px;
  height: 160px;
  border-radius: 20px;		 										/* 박스 모서리 라운드 처리 */
  box-shadow: 2px 2px 2px 2px #555555;				/* 그림자 효과  */ 
  }


   </style>
</head>


<body bgcolor= '#081c2b'>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br><br>

<h1 style="color:Lightgray; font-family: 'GyeonggiTitleM' " align ="center" >탈퇴하기</h1>
<br>
<div>

<form action="userDel.do" id="accesspanel" method="get"  >
   	<table class= "userInfo"  align="center" width="500" height="250"
				  style="padding:'5'; color: #f56a6a; font-family:'GyeonggiTitleM'; font-weight: 300; font-size: 0.9em;" >	
   
		<tr>
			<th style="color:Lightgray; align:'left'; padding:'5'; color: #f56a6a; font-family:'GyeonggiTitleM'; font-weight: 300; font-size:20px; "> 
			♡ ${ loginUser.user_name} 님 ♡ </th> 
			<td>
			<br>
			<input type="hidden"  name="user_id" value=${ loginUser.user_id}> <br>
			</td>
		</tr>
		       
			<tr>
				<th colspan="2" height= "50" colspan="2" >
					<input type="submit" onclick="removeUser();"  value="탈퇴하기">
					<input type="reset" onclick="location.href = 'moveup.do?user_id=${ sessionScope.loginUser.user_id }'" value="탈퇴취소">&nbsp; <br>
					<input type="button" onclick="location.href = 'main.do'" value="메인페이지로" 
							  style="width:210px; ">&nbsp;
				</th>
			</tr>	
			
	      </table>
	</form>
</div>


	<script>
		$(document).ready(function() {		//validate() 함수가 false를 리턴할 때 submit 작동 방지
		  $("#next_form").on("submit", function(event) {
		    if (!validate()) {
		      event.preventDefault();
		    }	//if
		  });	//on submit
		});	//document ready
		
		function removeUser() {
			if(window.confirm("탈퇴하시겠습니까??.............진짜로???₍ᐡඉ ̫ ඉᐡ₎.........")){
			location.href="delPage.do?user_id=${ sessionScope.loginUser.user_id }";
			}//if
		}// remove
	</script>
			
			
</body>
</html>


