<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWriteForm</title>
	<style>
		tr {
			border-bottom: 1px solid orangered;
		}
		th{
			width: 100px;
			text-align: center;
			background-color: #f5f5f5;
		}
		td{
			width: 500px;
			text-align: center;
		}
	</style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br>
<br>
<center>
<form action="inserttarboard.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="appid" value="${appid}">
	<input type="hidden" name="user_id" value="${loginUser.user_id}"/>
	<table style="border:1px solid orangered;">
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
				<input type="file" name="upfile">
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
		<tr>
			<td colspan="2">
				<input type="submit" value="작성">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</form>
</center>

<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>