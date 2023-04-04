<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${group.communityname}</title>
    <script>
        function reqjoin(){

            location.href="movejoinpage.do?communityid="+ ${communityid};
            return false;

        }
    </script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>" />
<%--css 스타일 가져오기--%>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />
<br>
<br>

<div class="container">

    <div style="all: inherit;">
        <h1 class="my-4">${group.communityname}</h1>
        <c:if test="${!empty loginUser && sessionScope.loginUser.user_id ne group.user_id}">
        <button style="width: 100px;" class="button" onclick="reqjoin();">가입신청</button>
        </c:if>

    </div>
    <br style="clear: both">
    <c:import url="/WEB-INF/views/community/commuDetailMenu.jsp"/>


    </ul>
    <div class="tab-content" id="communityTabsContent">
        <div class="tab-pane fade show active" id="community-info" role="tabpanel" aria-labelledby="community-info-tab">
            <!-- Community information content goes here -->
            <table class="table table-bordered">
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
                    <th>설명</th>
                    <td>${group.communitydesc}</td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>

    <a href="<c:url value="/commuMain.do"/>" class="btn btn-secondary">커뮤니티 메인으로 돌아가기</a>
</div>

<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>