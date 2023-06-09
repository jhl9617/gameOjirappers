<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="currentPage" value="${ requestScope.currentPage }"/>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title></title>
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/css/table.css">
    <style>
        h2, h4{
            color: #fef2dc;
        }

        td {
            background: #555;
        }
        tr{
            text-align: center;
        }
    </style>
    <script>
        function btdelcheck() {
            if (confirm("정말 삭제하시겠습니까?")) {
                return true;
            } else {
                return false;
            }
        }
        function btupcheck(){
            if (confirm("정말 수정하시겠습니까?")) {
                return true;
            } else {
                return false;
            }
        }
    </script>
</head>
<body style="padding:0 0 70px 0;">
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br>
<br>
<!-- 좋아요 수 증가용 url -->
<c:url value="/tarlike.do" var="likeUrl">
    <c:param name="board_no" value="${boardTar.board_no}"/>
    <c:param name="user_id" value="${loginUser.user_id}"/>
    <c:param name="appid" value="${appid}"/>
</c:url>
<!-- 좋아요 수 감소용 url -->
<c:url value="/tarlike2.do" var="likeUrl2">
    <c:param name="board_no" value="${boardTar.board_no}"/>
    <c:param name="user_id" value="${loginUser.user_id}"/>
    <c:param name="appid" value="${appid}"/>
</c:url>
<center>

    <h2 style="color: #8c7474">${boardTar.board_no}번 게시물</h2>
    <h4>조회수 : [${boardTar.board_count}]</h4>
    <h4>좋아요 수 : [${boardTar.board_like}]</h4> &nbsp;
    <c:if test="${checked eq 'n'}"><a href="${likeUrl}">좋아요</a></c:if>
    <c:if test="${checked ne 'n'}"><a href="${likeUrl2}">좋아요취소</a></c:if>
    <br>
    <table style="width:600px; ">

        <tr>
            <th>제목</th>
            <td style="border-top-right-radius: 20px;">${boardTar.board_title}</td>
        </tr>

        <tr>
            <th>게임이름</th>
            <td>${name}</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${boardTar.user_id}</td>
        </tr>
        <tr>
            <th>작성날짜</th>
            <td>${boardTar.board_date}</td>
        </tr>
        <tr>
            <th>첨부파일</th>
            <td>
                <c:if test="${!empty boardTar.board_orifile}">
                    <c:url var="bfd" value="/btfdown.do">
                        <c:param name="ofile" value="${boardTar.board_orifile}"/>
                        <c:param name="rfile" value="${boardTar.board_refile}"/>
                    </c:url>
                    <a href="${bfd}">${boardTar.board_orifile}</a>
                </c:if>
                <!-- 첨부파일이 없다면, 공백 처리 -->
                <c:if test="${empty boardTar.board_orifile}">
                    &nbsp;
                </c:if>
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${boardTar.board_content}</td>
        </tr>
        <tr>
            <td style="border-bottom-left-radius: 20px; border-bottom-right-radius: 20px;" colspan="2">
                <c:if test="${loginUser.user_id eq boardTar.user_id}">
                    <c:url var="btd" value="/btdelete.do">
                        <c:param name="board_no" value="${boardTar.board_no}"/>
                        <c:param name="page" value="${page}"/>
                        <c:param name="appid" value="${appid}"/>
                    </c:url>
                    <a href="${btd}" class="button" style="width: 60px;" onclick="return btdelcheck();">삭제</a>
                    <c:url var="btu" value="/btupdate.do">
                        <c:param name="board_no" value="${boardTar.board_no}"/>
                        <c:param name="page" value="${page}"/>
                        <c:param name="appid" value="${appid}"/>
                        <c:param name="name" value="${name}"/>
                    </c:url>
                    <a href="${btu}" class="button" style="width: 60px;"  onclick="return btupcheck();">수정</a>
                </c:if>
                <c:url var="btl" value="/movegameboard.do">
                    <c:param name="page" value="${page}"/>
                    <c:param name="appid" value="${appid}"/>
                </c:url>
                <a class="button" style="width: 60px;"  href="${btl}">목록으로</a>
            </td>
        </tr>

    </table>
</center>
</form>
<br>
<br>
<%-- 댓글 리스트로 불러와서 보여주기--%>
<c:import url="/WEB-INF/views/boardTar/gameReplyList.jsp"/>
<div id="comments-end"></div>
<%--댓글 입력 form--%>
<form action="<c:url value="/gameReplyWrite.do"/>" method="post">
    <input type="hidden" name="board_no" value="${board_no}">
    <input type="hidden" name="user_id" value="${boardTar.user_id}">
    <input type="hidden" name="appid" value="${appid}">
    <input type="hidden" name="name" value="${name}">
    <div class="form-group">
        <textarea placeholder="댓글 내용" class="form-control" id="reply_contents" name="reply_contents" rows="3"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">댓글 작성</button>
</form>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>