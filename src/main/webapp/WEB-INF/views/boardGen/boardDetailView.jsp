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
<!-- 상대경로로 대상 파일의 위치를 지정한 경우 -->
<c:import url="../common/menubar.jsp" />
<hr>
<h2 align="center">${ requestScope.boardGen.board_no } 번 게시글 </h2>
<br>
<table align="center" width="500" border="1" cellspacing="0"
cellpadding="5">
	<tr><th>제목</th><td>${ boardGen.board_title }</td></tr>
	<tr><th>작성자</th><td>${ boardGen.user_id }</td></tr>
	
	<tr><th>첨부파일</th>
		<td>
			<!-- 첨부파일이 있다면, 파일명 클릭시 다운로드 실행 처리 -->
			<c:if test="${ !empty boardGen.board_orifile }">
				<c:url var="bfd" value="/bfdown.do">
					<c:param name="ofile" value="${ boardGen.board_orifile }" />
					<c:param name="rfile" value="${ boardGen.board_refile }" />
				</c:url>
				<a href="${ bfd }">${ boardGen.board_orifile }</a>
			</c:if>
			<!-- 첨부파일이 없다면, 공백 처리 -->
			<c:if test="${ empty boardGen.board_orifile }">
				&nbsp;
			</c:if>
		</td>
	</tr>
	
	<tr><th>날짜</th>
		<td><fmt:formatDate value="${ boardGen.board_date }" 
			type="date" pattern="yyyy-MM-dd" /></td>
	</tr>
	
	<tr><th>내용</th><td>${ boardGen.board_content }</td></tr>
	<tr><th colspan="2">
		<button onclick="javascript:location.href='blist.do?page=${ currentPage }';">목록</button>
		&nbsp; 
		
		<c:url var="bup" value="bgupdate.do">
			<c:param name="board_no" value="${boardGen.board_no}" />
			<c:param name="page" value="${ currentPage }"/>
		</c:url>
			<a href="${ bup }">[수정페이지]</a> &nbsp;
			
			<c:url var="bdl" value="/bgdelete.do">
				<c:param name="board_no" value="${boardGen.board_no}" />
				<c:param name="board_refile" value="${ boardGen.board_refile }" />
		</c:url>
			<a href="${ bdl }">[삭제]</a>
		
	</th></tr>
</table>
<br>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>