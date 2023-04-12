<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ICT02-14
  Date: 2023-04-05
  Time: PM 5:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>새로운 글작성</title>

    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <script>
        function showAlertMessage() {
            <c:if test="${not empty message}">
            alert("${message}");
            </c:if>
        }
        document.addEventListener("DOMContentLoaded", function() {
            showAlertMessage();
        });
    </script>
</head>

<body onload="showAlertMessage()">

<div class="container">

    <c:import url="/WEB-INF/views/community/commuDetailMenu.jsp"/>


    <div class="tab-content" id="communityTabsContent">
        <div class="tab-pane fade show active" id="community-info" role="tabpanel" aria-labelledby="community-info-tab">
            <form action="insertCommuPost.do" method="post" enctype="multipart/form-data">

            <td>글제목</td>
                <input type="text" name="cBoardTitle" value="">
                <input type="hidden" name="communityid" value="${communityid}">

                <table class="table table-bordered">
                    <tr><th>첨부파일</th>
                        <td><input type="file" name="upfile"></td>
                    </tr>
                    <tr>
                        <td>글내용</td>
                        <td><textarea name="cBoardContent" cols="100" rows="10"></textarea></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td><div>${sessionScope.loginUser.user_nickname}</div></td>
                    </tr>
                </table>
                <input type="hidden" name="user_id" value="${sessionScope.loginUser.user_id}">
                <input type="submit" value="글 쓰기">
            </form>
        </div>
    </div>
    <%--수정 삭제 버튼--%>
    <div class="btn-group" role="group" aria-label="Basic example">

        <a href="<c:url value="/commuMain.do"/>" class="btn btn-secondary">커뮤니티 메인으로 돌아가기</a>
    </div>
</div>
</body>
</html>
