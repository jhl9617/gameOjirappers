<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardWriteForm</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br>
<br>
<form action="inserttarboard.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="appid" value="${appid}">
	<table>
		<tr>
			<th>게시글 제목</th>
			<td>
				<input type="text" name="board_title">
			</td>
		</tr>
		<tr>
			<th>게임명</th>
			<td>${name}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${loginUseer.user_id}</td>
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
				<textarea name="board_content" cols="30" rows="10"></textarea>
			</td>
		</tr>
		<tr>
			<th>공지 여부</th>
			<td>
				<input type="radio" name="board_notice" value="Y">공지
				<input type="radio" name="board_notice" value="N">일반
			</td>
		</tr>
	</table>

</form>
<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>