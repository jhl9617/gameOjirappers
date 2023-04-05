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

</head>
<body>
<c:import url="../common/menubar.jsp" />      
<hr>
<h2 align="center">${ boardGen.board_no } 번 게시글 수정</h2>
<br>

<%-- <c:if test="#"> --%>
<form action="bgoriginup.do" method="post" >
<!-- 페이징 처리 후 추가 코드 -->
	 <input type="text" name="board_no" value="${ boardGen.board_no }">
	<input type="text" name="page" value="${ currentPage }"> 
	<!-- 첨부파일이 있는 게시글이라면 -->
	 <c:if test="${ !empty boardGen.board_orifile }">
		<input type="hidden" name="board_orifile" 
			value="${ boardGen.board_orifile }">
		<input type="hidden" name="board_refile" 
			value="${ boardGen.board_refile }">	
	</c:if> 
<table align="center" width="500" border="1" cellspacing="0"
cellpadding="5">
	<tr><th>제목</th>
		<td><input type="text" name="board_title" value="${ boardGen.board_title }"></td></tr>
	<tr><th>작성자</th>
		<td><input type="text" name="board_writer" readonly 
			value="${ boardGen.user_id }">
		</td>
	</tr>
	<tr><th>첨부파일</th>
		<td>
			<!-- 첨부파일이 있는 경우, 파일삭제 기능 추가 -->
			<c:if test="${ !empty boardGen.board_orifile }">
				${ boardGen.board_orifile } &nbsp; 
				<input type="checkbox" name="delfile" value="yes"> 파일삭제
				<br>
			</c:if>
			새로 첨부 : <input type="file" name="upfile">
		</td>
	</tr>
	<tr><th>내용</th>
		<td><textarea name="board_content" rows="5" cols="50">${ boardGen.board_content }</textarea></td></tr>
	<tr><th colspan="2">
		<button onclick="javascript:history.go(-1); return false;">이전 페이지</button>
		&nbsp; 
		<input type="submit" value="수정하기"> &nbsp;
		<input type="reset" value="수정취소" onclick="alert('수정 사항이 초기화 됩니다, 이전 페이지로 이동합니다.'); javascript:history.go(-1); return false;">
	</th></tr>
</table>
</form>

<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
<%-- </c:if>  --%>
</body>
</html>