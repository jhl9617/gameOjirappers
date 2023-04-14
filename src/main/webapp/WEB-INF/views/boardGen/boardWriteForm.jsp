<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWriteForm</title>
	<link href="${pageContext.servletContext.contextPath}/resources/css/table.css" rel="stylesheet" type="text/css">
	<style>
		.table-fill {
			text-align: center;
		}
		.infilebtn {
			padding: 6px 25px;
			background-color: #d06c2e;
			border-radius: 5px;
			color: white;
			cursor: pointer;
		}
	</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 style="color: gray" align="center">게시글 등록</h2>
<center>
	<form action="bginsert.do" method="post" enctype="multipart/form-data">

		<input type="hidden" name="user_id" value="${loginUser.user_id}"/>
		<table class="table-fill">
			<tr >
				<th>게시글 제목</th>
				<td>
					<input type="text" name="board_title" style="background: #555555" required>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${loginUser.user_id}</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<label class="infilebtn" for="input-file">
						파일등록
					</label>
					<input style="display: none;" type="file" name="upfile" id="input-file">
				</td>
			</tr>
			<tr>
				<th>게시글 내용</th>
				<td>
					<textarea style="background: #555555" name="board_content" cols="60" rows="10" required></textarea>
				</td>
			</tr>
			<c:if test="${loginUser.admin_id == 'Y'}">
				<tr>
					<th>공지 여부</th>
					<td>
						<input type="radio" name="board_notice" value="N" checked>일반
						<input type="radio" name="board_notice" value="Y">공지
					</td>
				</tr>
			</c:if>

		</table>
		<br>
		<input style="box-shadow: 1px 1px 1px black; width: 60px;" class="button" type="submit" value="작성"> &nbsp;
		<input style="box-shadow: 1px 1px 1px black; width: 60px" class="button" type="reset" value="취소">
	</form>
</center>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>