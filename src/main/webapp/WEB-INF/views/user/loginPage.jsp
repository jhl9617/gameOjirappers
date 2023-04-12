<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  <%--core라이브러리 사용하겠다는 선언 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginPage</title>
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
    
    
	 a {
	 display: block; 
	 font-weight: 300;
	 text-decoration: none;
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
      width: 400px;
      height: 160px;
      border-radius: 20px;		 										/* 박스 모서리 라운드 처리 */
	  box-shadow: 2px 2px 2px 2px #555555;				/* 그림자 효과  */
	  }
	  
	  
    </style>
    
    <script>
        window.onload = function(){
            if(${!empty message}){
                alert("${message}");
            }
        };
    </script>
</head>


<body bgcolor= '#081c2b'>
<%-- <c:import url="/WEB-INF/views/common/menubar.jsp"/> --%>
<br><br>
<br><br>
<br><br><br>
<br><br><br>
<h1 style="color:Lightgray; font-family: 'GyeonggiTitleM' " align ="center" >GAMEJIRAPP</h1>
<br>
<div>

<form id="accesspanel" align ="center" method="get"  action="login.do" style="font-family: 'GyeonggiTitleM';" >
	<table class= "userInfo"  align="center" width="500" height="250"
				  style="padding:'5'; color: #f56a6a; font-family:'GyeonggiTitleM'; font-weight: 300; font-size: 0.9em;" >	
				  
			<tr>
				<th height= "30px;" style="color:Lightgray; " align="left" > ID </th>
				<td>	
					<input type="text" name="user_id" id="user_id" placeholder="ID"
							  style="width:230px; height:37px; border-radius: 8px; font-size:13px; "> &nbsp;&nbsp;
				</td>
			</tr>  
			<tr>
				<th height= "30px;" style="color:Lightgray; " align="left" > Password</th>
				<td>	
					<input type="password" name="user_pwd" id="user_pwd"   placeholder="Password"
							  style="width:230px; height:37px; border-radius: 8px; font-size:13px; "> &nbsp;&nbsp;
				</td>
			</tr>  
			
			<tr>
				<th height= "30px;" colspan="2" height= "50">
				<br>
					<input type="submit" name="Login" value="로그인">
					&nbsp;
					<input type="button" onclick="location.href = 'enrollPage.do'"  value="회원가입">
					&nbsp;
					<input type="button" onclick="location.href = 'main.do'"  value="메인화면으로">
				</th>
			</tr>	
      
   </table>
</form>
</div>


<form id="User_Info" action="login.do" method="get">
   <input type="hidden" name="login_id" id="login_id" />
   <input type="hidden" name="login_pwd" id="login_pwd" />
</form>

</body>
</html>


