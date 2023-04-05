<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${cBoard.cBoardTitle}</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>" /><%--css 스타일 가져오기--%>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <script>
        $(document).ready(function() {
            var urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('scrollToComment') === 'true') {
                $('html, body').animate({
                    scrollTop: $('#comments-end').offset().top
                }, 500);
            }
        });
    </script>


</head>
<body>
<%--게시글 내용 보여주는 테이블--%>


<div class="container">

    <c:import url="/WEB-INF/views/community/commuDetailMenu.jsp"/>



    <div class="tab-content" id="communityTabsContent">
        <div class="tab-pane fade show active" id="community-info" role="tabpanel" aria-labelledby="community-info-tab">
            <!-- Community information content goes here -->
            <table class="table table-bordered">
                <tbody>
                <tr>
                    <td>글제목</td>
                    <td>${cBoard.cBoardTitle}</td>
                </tr>
                <tr>
                    <td height="200px">글내용</td>
                    <td>${cBoard.cBoardContent}</td>
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
                </tbody>
            </table>
        </div>

    </div>
    <%--수정 삭제 버튼--%>
    <div class="btn-group" role="group" aria-label="Basic example">
        <a href="" class="btn btn-secondary">게시물 수정</a>
        <a href="" class="btn btn-secondary">삭제</a>

        <hr>

    </div>

        <%--커뮤니티 댓글 리스트로 불러와서 보여주기--%>
        <c:import url="/WEB-INF/views/community/commuReplyList.jsp"/>
        <div id="comments-end"></div>

    <%--댓글 입력 form--%>
    <form action="<c:url value="/commuReplyWrite.do"/>" method="post">
        <input type="hidden" name="cboardno" value="${cBoard.cBoardNo}">
        <input type="hidden" name="user_id" value="${cBoard.user_id}">
        <input type="hidden" name="communityid" value="${cBoard.communityid}">
        <div class="form-group">
            <label for="ccomcontent">댓글 내용</label>
            <textarea class="form-control" id="ccomcontent" name="ccomcontent" rows="3"></textarea>
        </div>

        <button type="submit" class="btn btn-primary">댓글 작성</button>
    </form>
</body>

</div>
        <a href="<c:url value="/commuMain.do"/>" class="btn btn-secondary">커뮤니티 메인으로 돌아가기</a>
</body>
</html>
