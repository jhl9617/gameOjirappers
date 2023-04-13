<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWriteForm</title>
	<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/table.css">
	<style>
		.table-fill tr td{
			background: #555;
		}
		.table-fill{
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
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br>
<br>
<center>
	<h1 style="color: gray;">게시글 작성</h1>
<form action="inserttarboard.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="appid" value="${appid}">
	<input type="hidden" name="user_id" value="${loginUser.user_id}"/>
	<table class="table-fill">
		<tr >
			<th>게시글 제목</th>
			<td>
				<input type="text" name="board_title" required>
			</td>
		</tr>
		<tr>
			<th>게임명</th>
			<td>${name}</td>
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
				<textarea name="board_content" cols="60" rows="10" required></textarea>
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
	<input class="button" style="width:50px;" type="submit" value="작성"> &nbsp;
	<input class="button" style="width:50px;" type="reset" value="취소">
</form>

</center>

<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>