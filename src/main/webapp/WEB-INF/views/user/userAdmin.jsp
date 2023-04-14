<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

   <link href="${pageContext.servletContext.contextPath}/resources/css/table.css" rel="stylesheet">
   <style>
   
	@font-face {
	    font-family: 'GyeonggiTitleM';      /* 글씨체: 경기천년제목 */
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/GyeonggiTitleM.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
		}
	  
    * { 
    color: Lightgray ;
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
	  width: 120px;
	  letter-spacing: 0.075em;
	  line-height: 3.5em;
	  padding: 0;
	  text-align: center;
	  text-decoration: none;
	  text-transform: uppercase;
	  white-space: nowrap; }

      
   </style>
</head>

<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
<script type="text/javascript">
$(function() {
	<c:if test="${not empty message}">
    	alert("${message}");
    </c:if>
	
	$('#useridDiv').css('display','none');
    $('#usernameDiv').css('display','none');
    
    $('input[name=item]').on("change",function(){
       showDiv();
    });
 }); //document.ready
 
function showDiv(){
    if($('input[name=item]').eq(0).is(':checked')){
       $('#useridDiv').css('display','block');
       $('#usernameDiv').css('display','none');
    }   // if 1
    if($('input[name=item]').eq(1).is(':checked')){
       $('#useridDiv').css('display','none');
       $('#usernameDiv').css('display','block');
    }   // if 2
 }; // showDiv
 

</script>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />

<h1 align="center" style="color:Lightgray; font-family:'GyeonggiTitleM' ">회원 관리 페이지</h1>
<h3 align="center" style="color:Lightgray; font-family:'GyeonggiTitleM' ">총 회원수 : ${ listCount }명</h3>
<center>
<div>
   <h2 style="color:Lightgray; font-family:'GyeonggiTitleM' " >검색할 항목을 선택하세요.</h2>

   <input type="radio" name="item" value="userid" style="color:Lightgray; font-family:'GyeonggiTitleM' " > 아이디 &nbsp; &nbsp;
  
   <input type="radio" name="item" value="username" style="color:Lightgray; font-family:'GyeonggiTitleM' " > 이름 &nbsp; &nbsp;
   <input type="button" style="color:Lightgray; font-family:'GyeonggiTitleM' " 
   onclick="javascript:location.href='${pageContext.servletContext.contextPath}/uadmin.do?page=1';" value="전체목록"> &nbsp; &nbsp; 
   <input  class="button" type="button" value="커뮤니티 신고글 보기"
   onclick="javascript:location.href='${pageContext.servletContext.contextPath}/showCReportAdmin.do';" >
</div>
<div id="useridDiv">
   <form action="aSearchUID.do" method="post">
      <label>검색할 회원아이디를 입력하세요 : 
         <input type="search" name="keyword">
      </label>
      <input type="submit" value="검색">
   </form>
</div>
<div id="usernameDiv">
   <form action="aSearchUN.do" method="post">
      <label>검색할 회원닉네임을 입력하세요 : 
         <input type="search" name="keyword">
      </label>
      <input type="submit" value="검색">
   </form>
</div>
</center>

<!-- 목록 출력 영역 -->

<center style="text-align: center;">
   <form  style="float: left;">

   </form>


</center>
<br>
<table class="table-fill" align="center" style="border: 1;"   >
   <tr style="width: 1000px; height: 50px;">
      <th>회원아이디</th>
      <th>회원이름</th>
      <th>회원등급</th>
      <th>포인트</th>
      <th>활동상태</th>
      <th>가입일</th>
      <th></th>
   </tr>
   <c:forEach items="${ requestScope.list }" var="u">
      <tr align="center">
         <td>${ u.user_id }</td>
         <td>${ u.user_name }</td>
         <td>${ u.user_level }</td>
         <td>${ u.user_point }</td>
         <td>
         <c:if test="${ u.user_status eq 'run' }">활동가능</c:if>
		 <c:if test="${ u.user_status eq 'pause' }">활동불가</c:if>
		 </td>
         <td>
			<fmt:formatDate value="${ u.user_enrolldate }" pattern="yyyy-MM-dd"/>
         </td>
         
         <td>
            <form action="uban.do?user_id=${ u.user_id }" method="post">
               <input type="submit" style="color:Lightgray; padding: 1px; margin: 2px; width: 150px;" value="활동정지/포인트차감">
            </form>
         </td>

      </tr>
   </c:forEach>
</table>


<c:import url="/WEB-INF/views/common/page.jsp"/>
<hr>
<!-- Footer -->
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>