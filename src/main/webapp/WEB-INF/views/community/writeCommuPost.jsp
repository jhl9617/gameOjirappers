<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>새로운 글작성</title>
    <link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/css/table.css">
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <style>
        body {
            height: 90vh;
        }

        #comtitable {
            text-align: center;
            color: #fef2dc;
            margin: 0 auto;
            height: 50%;
        }

        #comtitable td {
            background: inherit;
        }
        #community-info {
            text-align: center;
            height:60%;
        }

        #incomform {
            margin: 0 auto;
            width: 100%;
            text-align: center;
            height: 400px;
        }

        .infilebtn {
            padding: 6px 25px;
            background-color: #d06c2e;
            border-radius: 5px;
            color: white;
            cursor: pointer;
        }
    </style>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            <c:if test="${not empty message}">
            alert("${message}");
            </c:if>
        });
    </script>
</head>

<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br><br>
<div id="community-info">
    <c:import url="/WEB-INF/views/community/commuDetailMenu.jsp"/>
            <br>
    <br>
            <form id="incomform" action="insertCommuPost.do" method="post" enctype="multipart/form-data">
                <table id="comtitable">
                    <tr><th>글제목</th><td><input style="background: lightgray;" type="text" name="cBoardTitle" value=""></td></tr>

                    <input type="hidden" name="communityid" value="${communityid}">
                    <tr><th>첨부파일</th>

                        <td>
                            <label class="infilebtn" for="input-file">
                                파일등록
                            </label>
                            <input style="display: none;" type="file" name="upfile" id="input-file"></td>
                    </tr>
                    <tr>
                        <th>글내용</th>
                        <td><textarea style="background: lightgray;" name="cBoardContent" cols="70" rows="10"></textarea></td>
                    </tr>
                    <tr>
                        <th style="border-bottom-left-radius: 20px;">작성자</th>
                        <td><div>${sessionScope.loginUser.user_nickname}</div></td>
                    </tr>
                </table>
                <input type="hidden" name="user_id" value="${sessionScope.loginUser.user_id}">
                <br>
                <br>
                <input type="submit" class="button" style="height: 50px; width: 55px;" value="글 쓰기">
            </form>
        </div>



        <a href="<c:url value="/commuMain.do"/>" class="btn btn-secondary">커뮤니티 메인으로 돌아가기</a>


<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
