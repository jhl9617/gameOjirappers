<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${group.communityname}</title>
    <link href="${pageContext.servletContext.contextPath}/resources/css/table.css" rel="stylesheet">
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <style>
        h1{
            color: #fef2dc;
        }
    </style>

    <script>
        function reqjoin() {
            location.href = "movejoinpage.do?communityid=" + ${communityid};
            return false;

        }

        function report() {
            location.href = "moveReport.do?communityid=" + ${communityid};
            return false;
        }

        $(function () {
            <c:if test="${!empty message}">
                alert("${message}");
                const state = { communityid: ${communityid}};
                const title = null;
                const url = `viewgroup.do?communityid=${communityid}`;
                history.pushState(state, title, url);
                window.onpopstate = function(event) {
                    history.go(1);
                };
            </c:if>
        });
    </script>

    <%--css 스타일 가져오기--%>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br>
<br>

<div class="container" style="text-align: center;">

    <div style="text-align: center;">
        <h1 class="my-4">${group.communityname}</h1>
        <c:if test="${sessionScope.loginUser.user_id ne group.user_id}">
            <button style="width: 100px;" class="button" onclick="reqjoin();">가입신청</button>
            <button style="width: 100px;" class="button" onclick="report();">신고하기</button>
        </c:if>

    </div>
    <br>
    <c:import url="/WEB-INF/views/community/commuDetailMenu.jsp"/>

    <br>
    <div style="text-align: center; margin: 0 auto;">
        <c:if test="${!empty group.communityimgori}">
            <img src="${pageContext.servletContext.contextPath}/resources/commuimg/${group.communityimgrename}" style="width: 15%; height: 100%; border-radius: 20px;">
        </c:if>
        <!-- Community information content goes here -->
        <table class="table table-bordered" style="margin:0 auto;">
            <tbody>
            <tr>
                <th>커뮤니티 ID</th>
                <td>${group.communityid}</td>
            </tr>
            <tr>
                <th>커뮤니티 이름</th>
                <td>${group.communityname}</td>
            </tr>
            <tr>
                <th>생성일</th>
                <td>${group.communitydate}</td>
            </tr>
            <tr>
                <th>관리자 id</th>
                <td>${group.user_id}</td>
            </tr>
            <tr>
                <th style="border-bottom-left-radius: 20px;">설명</th>
                <td>${group.communitydesc}</td>
            </tr>
            </tbody>
        </table>
    </div>
    <br><br><br>

    <a href="<c:url value="/commuMain.do"/>" class="btn btn-secondary">커뮤니티 메인으로 돌아가기</a>
</div>

<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>