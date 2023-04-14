<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${ requestScope.currentPage }"/>

<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">

	<title></title>
	<link href="${pageContext.request.contextPath}/resources/css/table.css" rel="stylesheet">
	<style>

		.table-fill{
			margin: 0 auto;
			color: #fef2dc;
			border-collapse: separate;
			text-align: center;
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

		h4 {
			color: #fef2dc;
		}

		h2 {
			color: #3a3a3a;
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
	<script>

	</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br>
<br>
<center>

	<h2>${boardTar.board_no}번 게시물</h2>
	<h4>조회수 : [${boardTar.board_count}]</h4>
	<h4>좋아요 수 : [${boardTar.board_like}]</h4> &nbsp;
	<br>
	<form action="boardTarUpdate.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="board_no" value="${boardTar.board_no}">
		<input type="hidden" name="name" value="${name}">
		<input type="hidden" name="user_id" value="${boardTar.user_id}">
		<input type="hidden" name="board_date" value="${boardTar.board_date}">
		<input type="hidden" name="appid" value="${appid}">
	<table class="table-fill">

		<tr>
			<th>제목</th>
			<td><input value="${boardTar.board_title}" name="board_title"/></td>
		</tr>

		<tr>
			<th>게임이름</th>
			<td>${name}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${boardTar.user_id}</td>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td>${boardTar.board_date}</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:if test="${!empty boardTar.board_orifile}">
					${boardTar.board_orifile} &nbsp; <input type="checkbox" name="delflag" value="yes"> 파일삭제<br>
					<input type="hidden" name="refile" value="${boardTar.board_refile}">
				</c:if>
				<label class="infilebtn" for="input-file">
					파일등록
				</label>
				<input style="display: none;" type="file" name="upfile" id="input-file">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="board_content"></textarea></td>
		</tr>
		<tr>
			<th style="border-bottom-left-radius: 20px;" colspan="2">
				<button class="updatebtn" style="width: 80px;" type="submit">수정</button> &nbsp; &nbsp;
				<c:url var="bdt" value="/movetarboarddetail.do">
					<c:param name="board_no" value="${boardTar.board_no}"/>
					<c:param name="page" value="${page}"/>
					<c:param name="appid" value="${appid}"/>
					<c:param name="name" value="${name}"/>
				</c:url>
				<button class="updatebtn" style="width: 80px;" type="reset" onclick="javascript:location.href='${bdt}'">취소</button> &nbsp; &nbsp;
				<c:url var="btl" value="/movegameboard.do">
					<c:param name="page" value="${page}"/>
					<c:param name="appid" value="${appid}"/>
				</c:url>
				<a class="updatebtn" style="width: 80px;" href="${btl}">목록으로</a>
			</th>
		</tr>
	</table>
</form>
</center>
</form>
<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>