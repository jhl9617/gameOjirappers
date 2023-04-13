<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정:${cBoard.cBoardTitle}</title>
    <link href="${pageContext.request.contextPath}/resources/css/table.css" rel="stylesheet">
    <style>
        * {
            margin: 0 auto;
        }
        body {
            height: 90vh;
        }

        #comtitable {
            text-align: center;
            color: #fef2dc;
            margin: 0 auto;
            height: 35%;
            box-shadow: 1px 1px 1px 1px #555555;
            border-radius: 20px;
        }
        h1{
            color: #fef2dc;
        }
        #comtitable td {
            background: #333341;
            width: 500px;
        }

        #comtitable tr:first-child td{
            border-top-right-radius: 20px;
        }
        #comtitable tr:last-child td{
            border-bottom-right-radius: 20px;
        }

        #boardbody tr:hover td {
            background: #3a3a3a;
        }

        #menup {
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

<br><br>
    <div id="menup">
        <c:import url="/WEB-INF/views/community/commuDetailMenu.jsp"/>
    </div>
    <br><br>
    <form action="updateCommuPost.do" method="post" enctype="multipart/form-data">
    <div class="tab-content" id="communityTabsContent">

        <div class="tab-pane fade show active" id="community-info" role="tabpanel" aria-labelledby="community-info-tab">
            <!-- Community information content goes here -->


            <input type="hidden" name="communityid" value="${cBoard.communityid}">
            <input type="hidden" name="cBoardNo" value="${cBoard.cBoardNo}">

            <table id="comtitable">
                <!-- 첨부파일이 있는 게시글이라면 -->
                <c:if test="${ !empty cBoard.cBoardOrifile }">
                    <input type="hidden" name="board_original_filename"
                           value="${ cBoard.cBoardOrifile }">
                    <input type="hidden" name="board_rename_filename"
                           value="${ cBoard.cBoardRefile }">
                </c:if>
                <tr>
                    <th>글제목</th>
                    <td><input type="text" name="cBoardTitle" value="${cBoard.cBoardTitle}"></td>
                </tr>
                <tr><th>첨부파일</th>
                    <td>
                        <!-- 첨부파일이 있는 경우, 파일삭제 기능 추가 -->
                        <c:if test="${ !empty cBoard.cBoardOrifile }">
                            ${ cBoard.cBoardOrifile } &nbsp;
                            <label>
                                파일삭제
                            </label>
                            <br>
                        </c:if>
                        <label class="infilebtn" for="input-file">
                            파일등록
                        </label>
                        <input style="display: none;" type="file" name="upfile" id="input-file">
                    </td>
                <tr>
                    <th>글내용</th>

                    <td><textarea name="cBoardContent" cols="70" rows="10">${fn:replace(cBoard.cBoardContent, '<br>', '')}</textarea></td>

                </tr>
                <tr>
                    <th>작성일</th>

                    <td>${cBoard.cBoardDate}</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${cBoard.user_id}</td>
                </tr>
                <tr>
                    <th style="border-bottom-left-radius: 20px;">글 번호</th>
                    <td>${cBoard.cBoardNo}</td>
                </tr>

            </table>

        </div>


    </div>

        <%--수정 삭제 버튼--%>
        <div style="text-align: center;">
            <br>
            <%--수정완료 버튼--%>
            <input type="submit" style="width: 100px; height: 50px; margin-left: 10px;" class="button" value="수정완료" class="btn btn-secondary">
                <br><br>

            <hr>
                <br>
            <a href="<c:url value="/commuMain.do"/>" class="btn btn-secondary">커뮤니티 메인으로 돌아가기</a>
        </div>
</form>
        <c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
