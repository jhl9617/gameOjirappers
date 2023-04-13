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
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/table.css">
	<style>
		.table-fill {
			text-align: center;
		}

		.table-fill tr td {
			background: #555;
		}

		.table-fill tr:first-child td {
			border-top-right-radius: 20px;
		}
		h2, h4 {
			text-align: center;
			color: #fef2dc;
		}
		#likediv {
			text-align: center;
		}

	</style>
	<script>
		function btdelcheck() {
			if (confirm("정말 삭제하시겠습니까?")) {
				return true;
			} else {
				return false;
			}
		}
		function btupcheck(){
			if (confirm("정말 수정하시겠습니까?")) {
				return true;
			} else {
				return false;
			}
		}
	</script>


</head>
<body style="margin:0; padding: 0 0 70px 0;">
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<!-- 상대경로로 대상 파일의 위치를 지정한 경우 -->

<!-- 좋아요 수 증가용 url -->
<c:url value="/genlike.do" var="likeUrl">
	<c:param name="board_no" value="${boardGen.board_no}"/>
	<c:param name="user_id" value="${loginUser.user_id}"/>
</c:url>
<!-- 좋아요 수 감소용 url -->
<c:url value="/genlike2.do" var="likeUrl2">
	<c:param name="board_no" value="${boardGen.board_no}"/>
	<c:param name="user_id" value="${loginUser.user_id}"/>
</c:url>

	<h2>${boardGen.board_no}번 게시물</h2>
	<h4>조회수 : [<span style="color: #d06c2e">${boardGen.board_count}</span>]</h4>
	<h4>좋아요 수 : [<span style="color: #d06c2e">${boardGen.board_like}</span>]</h4> &nbsp;
<div id="likediv">
	<c:if test="${checked eq 'n'}"><a style="width: 100px; height: 48px;" class="button" href="${likeUrl}">좋아요</a></c:if>
	<c:if test="${checked ne 'n'}"><a style="width: 100px; height: 48px;" class="button" href="${likeUrl2}">좋아요취소</a></c:if>
</div>
	<br><br>
<table style="width:600px;" class="table-fill">
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
	<tr><th style="border-bottom-left-radius: 20px; border-bottom-right-radius: 20px;" colspan="2">
		<button style="width: 85px; box-shadow: 1px 1px 1px black;" class="button" onclick="javascript:location.href='blist.do?page=${ currentPage }';">목록</button>
		&nbsp; 
		
		<c:url var="bup" value="bgupdate.do">
			<c:param name="board_no" value="${boardGen.board_no}"/>
			<c:param name="page" value="${ currentPage }"/>
		</c:url>
			<c:if test="${ loginUser.user_id eq boardGen.user_id }">
			<a style="width: 85px; box-shadow: 1px 1px 1px black;" class="button" href="${ bup }">수정페이지</a> &nbsp;
			</c:if>
			
			<c:url var="bdl" value="/bgdelete.do">
				<c:param name="board_no" value="${boardGen.board_no}" />
				<c:param name="board_refile" value="${ boardGen.board_refile }" />
		</c:url>
			<c:if test="${ loginUser.user_id eq boardGen.user_id or loginUser.admin_id == 'Y'}">
			<a style="width: 85px; box-shadow: 1px 1px 1px black;" class="button" href="${ bdl }">삭제</a>
			</c:if>
	</th></tr>
</table>

<hr />

<!-- 댓글 리스트 -->
<c:import url="/WEB-INF/views/boardGen/genReplyList.jsp"/>
<br>

<div id="comments-end"></div>
<%--댓글 입력 form--%>
<form action="<c:url value="/genReplyWrite.do"/>" method="post">
	<input type="hidden" name="board_no" value="${boardGen.board_no}">
	<input type="hidden" name="user_id" value="${sessionScope.loginUser.user_id}">
	<div class="form-group">
		<textarea style="background: #b6b6b8" class="form-control" placeholder="댓글 내용" id="reply_contents" name="reply_contents" rows="3"></textarea>
	</div>

	<c:if test="${ loginUser.user_status eq run }">
	<button class="button" style="width: 65px;" type="submit" class="btn btn-primary">댓글 작성</button>
	</c:if>

</form>

		
    
</ul>



<br>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
