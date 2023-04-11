<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserDatailPage</title>
    <style>
    bady{
    margin-bottom:0px;
    font-family: 'HSSaemaul-Regular';
    }
    
    @font-face {
    font-family: 'HSSaemaul-Regular'; 
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSSaemaul-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}
	
	p{
	top: -100px;
	width: 700px;
	width: 50px; 	          	/* 가로너비 */
	height: 2px;	          		/* 세로너비 */
	color:#424242;            /* 글씨색상*/
	border-collapse: collapse;
	background-color: transparent;
	}
    
    .table-container {
      display: flex;
      flex-direction: row;
      border-collapse: collapse;
    }
    
    .menu p {
      position: relative;
      top: -48px;
      width: 200px;
      padding-top: 10px;
    }
    
    .menu td {
      padding: 10px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    
    /* ////////////////////////////////// */
    .div {
    position: static;
    }
    
    .user_point { 
      position: relative;
      top: 0px;
      width: 700px;
      height: 100px;
      background: pink;
/* 	  padding:5; */
/*       margin: 0; */
      }
      
    .user_community {
	position: relative;
	top: -20px;
	width: 700px;
	height: 140px;
	background: pink;     
	text-align: center;
	font-size: 9pt;
    }
    
    .user_boardgen {
      position: relative;
      top: -20px;
      width: 700px;
      height: 140px;
      background: pink;
      text-align: center;
      font-size: 9pt;
      }
    .user_comment_border {
      position: relative;
      top: -20px;
      width: 700px;
      height: 140px;
      background: pink;
      text-align: center;
      font-size: 9pt;
      }
    .user_gamelist {
      position: relative;
      top: -20px;
      width: 700px;
      height: 140px;
      background: pink;
      text-align: center;
      font-size: 9pt;
      }
      
	input[type="submit"],
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
	  color: #f56a6a !important;
	  cursor: pointer;
	  display: inline-block;
	  font-family: 'Noto Sans KR', sans-serif;
	  font-size: 0.8em;
	  font-weight: 700;
	  height: 3.5em;
	  width: 150px;
	  letter-spacing: 0.075em;
	  line-height: 3.5em;
	  padding: 0;
	  text-align: center;
	  text-decoration: none;
	  text-transform: uppercase;
	  white-space: nowrap; }
    </style>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
</head>


<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>

 
    <div class="table-container">
      <div class="menu">
        <form>
   		<input type="hidden" name="user_id" value="${requestScope.user.user_id }">	<%--value가 암호화되어있는 값임 --%>
        <br> <%-- 이 br은 안지움 --%>
          <p>
			<p>${ sessionScope.loginUser.user_nickname } 님</p>
			<p>내 등급 : ${ sessionScope.loginUser.user_level } </p>
		<div class="menuButton">
			<input type="button" onclick="location.href = 'moveUpdatePage.do?user_id=${ sessionScope.loginUser.user_id }'"  value="내 정보수정"><br>
			<input type="button" onclick="location.href = 'main.do'"  value="메인화면으로"><br>
			<input type="button" onclick="location.href = 'delPage.do?user_id=${ sessionScope.loginUser.user_id }'"  value="탈퇴하기"><br>
		</div>
        </form>
      </div>
      
	<%-- div start --%>
      <div class="user">
      
      <h4>마이페이지</h4>
      <div class="user_point">
        <h5>내 포인트</h5>
        <table>
          <tr>
            <th style="color:red; font-size: 20pt;"> ${ sessionScope.loginUser.user_point } Point </th>
          </tr>
        </table>
      </div>
      
      
<%--내가 가입한 밴드 top5  --%>         
      <div class="div_table"> <%-- class명 수정하지말것 --%>
        <h5>내가 가입한 밴드</h5>
        <table class="user_community" >
          <tr>
				<th>밴드생일</th>
				<th>밴드이름</th>
          </tr>
        </table>
      </div>
<script type="text/javascript">
$(function(){
	var values = $('.user_community').html();
	
	$.ajax({
		url: "mybandtop5.do" , 
		type: "post",
        data: {"user_id" : "${loginUser.user_id}" },
		dataType: "json",
		success: function(data){
			console.log("success : " + JSON.stringify(data));  			//Object 로 출력
			var json = JSON.parse(JSON.stringify(data));				//string => json 객체로 바꿈
			
			for(var i in json.list){
				if(json.list[i] == null) {
					break; 
				}//if
				values += "<tr border: 2px solid black>"
							+"<td>" + json.list[i].Communitydate + "</td>"
							+"<td>" + decodeURIComponent(json.list[i].Communityname).replace(/\+/gi, " ") + "</td>"
							+"</tr>";
			}  //for in
			
			$('.user_community').html(values);
		},	//success
		error: function(jqXHR, textStatus, errorThrown){
			console.log("mybandtop5.do error : " + jqXHR + ", " + textStatus + ", "	+ errorThrown);
		}	//error
	});  //mybandtop5.do ajax
});  //document ready
</script>      
      
      
  <%--내가 쓴 글 최신글top5  --%>    
      <div class="div_table"> <%-- class명 수정하지말것 --%>
        <h5>내가 쓴 게시글(자유)</h5>
        <table class="user_boardgen">
          <tr>
				<th>글작성일</th>
				<th>글제목</th>
				<th>조회수</th>
				<th>좋아요</th>
          </tr>
        </table>
      </div>
<script type="text/javascript">
$(function(){
	var values = $('.user_boardgen').html();
	
	$.ajax({
		url: "boardgentop5.do" , 
		type: "post",
        data: {"user_id" : "${loginUser.user_id}" },	//보내는 값
		dataType: "json",											//받는 값
		success: function(data){
			console.log("success : " + JSON.stringify(data));  			//Object 로 출력
			var json = JSON.parse(JSON.stringify(data));			//string => json 객체로 바꿈
			
			for(var i in json.list){
				if(json.list[i] == null) {
					console.log("실패");
					break;
				}//if
				values += "<tr>"
							+"<td>" + json.list[i].board_date + "</td>"
							+"<td>" + decodeURIComponent(json.list[i].board_title).replace(/\+/gi, " ") + "</td>"
							+"<td>" + json.list[i].board_count + "</td>"
							+"<td>" + json.list[i].board_like + "</td>"
							+"</tr>";
			}  //for in
			
			$('.user_boardgen').html(values);
		},	//success
		error: function(jqXHR, textStatus, errorThrown){
			console.log("boardgentop5.do error : " + jqXHR + ", " + textStatus + ", "	+ errorThrown);
		}	//error
	});  //myboardtop5.do ajax
});  //document ready
</script>      



 <%--내가 쓴 댓글 최신글top5  --%>          
      <div class="div_table"> <%-- class명 수정하지말것 --%>
        <h5>내가 쓴 댓글</h5>
         <table class="user_comment_border">
          <tr>
				<th>댓글작성일</th>
				<th>댓글제목</th>
          </tr>
        </table>
      </div>
 <script type="text/javascript">
$(function(){
	var values = $('.user_comment_border').html();
	
	$.ajax({
		url: "comment_borderTop5.do" , 
		type: "post",
        data: {"user_id" : "${loginUser.user_id}" },	//보내는 값
		dataType: "json",											//받는 값
		success: function(data){
			console.log("success : " + JSON.stringify(data));  			//Object 로 출력
			var json = JSON.parse(JSON.stringify(data));			//string => json 객체로 바꿈
			
			for(var i in json.list){
				if(json.list[i] == null) {
					console.log("실패");
					break;
				}//if
				values += "<tr>"
							+"<td>" + json.list[i].com_date + "</td>"
							+"<td>" + decodeURIComponent(json.list[i].com_contents).replace(/\+/gi, " ") + "</td>"
							+"</tr>";
			}  //for in
			$('.user_comment_border').html(values);
		},	//success
		error: function(jqXHR, textStatus, errorThrown){
			console.log("comment_borderTop5.do error : " + jqXHR + ", " + textStatus + ", "	+ errorThrown);
		}	//error
	});  //omment_borderTop5.do ajax
});  //document ready
</script>           
      
      
      
      <div class="div_table"> <%-- class명 수정하지말것 --%>
        <h5>게임 즐겨찾기</h5>
         <table class="user_gamelist">
          <tr>
				<th>즐찾번호</th>
				<th>즐찾게임제목</th>
          </tr>
        </table>
      </div>
      </div>
    </div><%-- all div close --%>
    
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>