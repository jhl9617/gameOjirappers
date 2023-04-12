<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>수정:${cBoard.cBoardTitle}</title>
</head>
<body>
<div class="container">

    <c:import url="/WEB-INF/views/community/commuDetailMenu.jsp"/>

    <form action="updateCommuPost.do" method="post" enctype="multipart/form-data">
    <div class="tab-content" id="communityTabsContent">

        <div class="tab-pane fade show active" id="community-info" role="tabpanel" aria-labelledby="community-info-tab">
            <!-- Community information content goes here -->

            <td>글제목</td>
            <input type="text" name="cBoardTitle" value="${cBoard.cBoardTitle}">
            <input type="hidden" name="communityid" value="${cBoard.communityid}">
            <input type="hidden" name="cBoardNo" value="${cBoard.cBoardNo}">

            <table class="table table-bordered">
                <!-- 첨부파일이 있는 게시글이라면 -->
                <c:if test="${ !empty cBoard.cBoardOrifile }">
                    <input type="hidden" name="board_original_filename"
                           value="${ cBoard.cBoardOrifile }">
                    <input type="hidden" name="board_rename_filename"
                           value="${ cBoard.cBoardRefile }">
                </c:if>
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
                        새로 첨부 : <input type="file" name="upfile">
                    </td>
                <tr>
                    <td>글내용</td>

                    <td><textarea name="cBoardContent" cols="100" rows="10">${fn:replace(cBoard.cBoardContent, '<br>', '')}</textarea></td>

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

        </div>


    </div>

        <%--수정 삭제 버튼--%>
        <div class="btn-group" role="group" aria-label="Basic example">
            <%--수정완료 버튼--%>
            <input type="submit" value="수정완료" class="btn btn-secondary">


        <hr>
        <a href="<c:url value="/commuMain.do"/>" class="btn btn-secondary">커뮤니티 메인으로 돌아가기</a>
    </div>
</form>

</body>
</html>
