<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${ requestScope.currentPage }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<link href="${pageContext.request.contextPath}/resources/css/table.css" rel="stylesheet">
	<style>
		#tableform {
			text-align: center;

		}
		.table-fill{
			margin: 0 auto;
			color: #fef2dc;
			border-collapse: separate;
		}
		.infilebtn {
			padding: 6px 25px;
			background-color: #d06c2e;
			border-radius: 5px;
			color: white;
			cursor: pointer;
		}

		td {
			background: #555;
		}

		.updatebtn {
			appearance: none;
			transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
			background-color: transparent;
			border-radius: 8px;
			border-top: 1px dimgray solid;
			border-left: 1px dimgray solid;
			box-shadow: 1px 1px 1px 1px #4d4848;
			color: Lightgray ;
			cursor: pointer;
			display: inline-block;
			font-size: 0.8em;
			font-weight: 700;
			height: max-content;
			width: max-content;
			letter-spacing: 0.075em;
			line-height: 3.5em;
			padding: 0;
			text-align: center;
			text-decoration: none;
			text-transform: uppercase;
			white-space: nowrap;
			vertical-align: center;
		}
	</style>
</head>
<body style="padding: 0 0 70px 0; margin:0;">
<c:import url="../common/menubar.jsp" />      
<hr>
<br>
<h2 style="color: #787fda;" align="center">${ boardGen.board_no } 번 게시글 수정</h2>
<br>

<%-- <c:if test="#"> --%>
<div id="tableform">
<form action="bgoriginup.do" method="post" enctype="multipart/form-data">
<!-- 페이징 처리 후 추가 코드 -->
	 <input type="hidden" name="board_no" value="${ boardGen.board_no }">
	<input type="hidden" name="page" value="${ currentPage }">
	<!-- 첨부파일이 있는 게시글이라면 -->
	 <c:if test="${ !empty boardGen.board_orifile }">
		<input type="hidden" name="board_orifile" 
			value="${ boardGen.board_orifile }">
		<input type="hidden" name="board_refile" 
			value="${ boardGen.board_refile }">	
	</c:if> 
<table class="table-fill">
	<tr><th>제목</th>
		<td style="border-top-right-radius: 20px;"><input style="background: #b6b6b8" type="text" name="board_title" value="${ boardGen.board_title }"></td></tr>
	<tr><th>작성자</th>
		<td><input style="background: #b6b6b8" type="text" name="board_writer" readonly
			value="${ boardGen.user_id }">
		</td>
	</tr>
	<tr><th>첨부파일</th>
		<td>
			<!-- 첨부파일이 있는 경우, 파일삭제 기능 추가 -->
			<c:if test="${ !empty boardGen.board_orifile }">
				${ boardGen.board_orifile } &nbsp; 
				<input  type="checkbox" name="delfile" value="yes"> 파일삭제
				<br>
			</c:if>
			<label class="infilebtn" for="input-file">
				파일등록
			</label>
			<input style="display: none;" type="file" name="upfile" id="input-file">
		</td>
	</tr>
	<tr><th>내용</th>
		<td><textarea style="background: #b6b6b8" name="board_content" rows="5" cols="50">${ boardGen.board_content }</textarea></td></tr>
	<tr><th style="border-bottom-right-radius: 20px; border-bottom-left-radius: 20px;" colspan="2">
		<button class="updatebtn" onclick="javascript:history.go(-1); return false;">이전 페이지</button>
		&nbsp;
		<input class="updatebtn"  type="submit" value="수정하기"> &nbsp;
		<input class="updatebtn"  type="reset" value="수정취소" onclick="alert('수정 사항이 초기화 됩니다, 이전 페이지로 이동합니다.'); javascript:history.go(-1); return false;">
	</th></tr>
</table>
</form>
</div>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
<%-- </c:if>  --%>
</body>
</html>