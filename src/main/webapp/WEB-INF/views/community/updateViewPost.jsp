<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ICT02-14
  Date: 2023-04-04
  Time: PM 12:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정:${cBoard.cBoardTitle}</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>" />
</head>
<body>
<div class="container">

    <c:import url="/WEB-INF/views/community/commuDetailMenu.jsp"/>



    <div class="tab-content" id="communityTabsContent">

        <div class="tab-pane fade show active" id="community-info" role="tabpanel" aria-labelledby="community-info-tab">
            <!-- Community information content goes here -->

            <form>
            <td>글제목</td>
            <input type="text" name="cBoardTitle" value="${cBoard.cBoardTitle}">

            <table class="table table-bordered">

                <tr>
                    <td>글내용</td>
                    <td><textarea name="cBoardContent" cols="100" rows="10">${cBoard.cBoardContent}</textarea></td>

                </tr>
                <tr>
                    <td>작성일</td>


                    <td>${cBoard.cBoardDate}</td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td>${cBoard.user_id}</td>
                </tr>
                <tr>
                    <th>글 번호</th>
                    <td>${cBoard.cBoardNo}</td>
                </tr>

            </table>
            </form>
        </div>

    </div>
    <%--수정 삭제 버튼--%>
    <div class="btn-group" role="group" aria-label="Basic example">
        <a href="<c:url value="/updateViewPost.do?cBoardNo=${cBoard.cBoardNo}"/>" class="btn btn-secondary">수정</a>
        <a href="<c:url value="/commuDelete.do?cBoardNo=${cBoard.cBoardNo}"/>" class="btn btn-secondary">삭제</a>
        <hr>
        <a href="<c:url value="/commuMain.do"/>" class="btn btn-secondary">커뮤니티 메인으로 돌아가기</a>
    </div>

</body>
</html>
