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
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<hr>
<h2 align="center">게시글 등록</h2>
<form action="bginsert.do" method="post" enctype="multipart/form-data">
<table align="center" width="500" border="1" cellspacing="0"
cellpadding="5">
	<tr><th>제목</th><td><input type="text" name="board_title"></td></tr>
	<tr><th>작성자</th>
		<td><input type="text" name="user_id" > 
			
		</td>
	</tr>
	 <tr><th>첨부파일</th>
		<td><input type="file" name="upfile"></td>
	</tr>  
	<tr><th>내용</th><td><textarea name="board_content" rows="5" cols="50"></textarea></td></tr>
	<tr><th colspan="2">
		<button onclick="javascript:history.go(-1); return false;">목록</button>
		&nbsp; 
		<input type="submit" value="등록하기"> &nbsp;
		<input type="reset" value="작성취소">
	</th></tr>
</table>
</form>
<br>
<hr>


<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>