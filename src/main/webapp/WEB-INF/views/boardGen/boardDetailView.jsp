<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<c:set var="currentPage" value="${ requestScope.currentPage }" />

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<style>
		table {
			border-collapse: collapse;
			width: 40%;
			margin: auto;
		}

		th, td {
			padding: 10px;
			text-align: center;
			border: 1px solid #ddd;
		}

		th {
			background-color: #f2f2f2;
		}

		td:first-child {
			font-weight: bold;
		}

		button {
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
			font-family: "Roboto Slab", serif;
			font-size: 0.8em;
			font-weight: 700;
			height: 3.5em;
			letter-spacing: 0.075em;
			line-height: 3.5em;
			padding: 0 2.25em;
			text-align: center;
			text-decoration: none;
			text-transform: uppercase;
			white-space: nowrap;
		}


		a {
			background-color: #008CBA;
			color: white;
			border: none;
			padding: 10px 20px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 14px;
			margin: 4px 2px;
			cursor: pointer;
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
<title></title>

<style>
	table {
		border-collapse: collapse;
		width: 40%;
		margin: auto;
	}
	th, td {
		padding: 10px;
		text-align: center;
		border: 1px solid #ddd;
	}
	th {
		background-color: #f2f2f2;
	}
	td:first-child {
		font-weight: bold;
	}
	button {
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
     font-family: "Roboto Slab", serif;
     font-size: 0.8em;
     font-weight: 700;
     height: 3.5em;
     letter-spacing: 0.075em;
     line-height: 3.5em;
     padding: 0 2.25em;
     text-align: center;
     text-decoration: none;
     text-transform: uppercase;
     white-space: nowrap; }


	a {
		background-color: #008CBA;
		color: white;
		border: none;
		padding: 10px 20px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 14px;
		margin: 4px 2px;
		cursor: pointer;
	}
	
</style>

</head>
<body>
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
	<h4>조회수 : [${boardGen.board_count}]</h4>
	<h4>좋아요 수 : [${boardGen.board_like}]</h4> &nbsp;
	<c:if test="${checked eq 'n'}"><a href="${likeUrl}">좋아요</a></c:if>
	<c:if test="${checked ne 'n'}"><a href="${likeUrl2}">좋아요취소</a></c:if>
	<br><br>
<table align="center" width="50" border="1" cellspacing="0"
cellpadding="50">
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
			<c:param name="board_no" value="${boardGen.board_no}"/>
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
		<label for="reply_contents">댓글 내용</label>
		<textarea class="form-control" id="reply_contents" name="reply_contents" rows="3"></textarea>
	</div>
	<button type="submit" class="btn btn-primary">댓글 작성</button>
</form>

		
    
</ul>



<br>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>