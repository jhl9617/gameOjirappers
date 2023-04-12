<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>커뮤니티 허브</title>

    <script src="${pageContext.servletContext.contextPath}/resources/js/jquery-3.6.3.min.js"></script>
    <link href="${pageContext.servletContext.contextPath}/resources/css/table.css" rel="stylesheet">
<style>
    .commucon {
        text-align: center;

    }



    .commtable {
        border-collapse: separate;
        border-spacing: 20px;
        width: 60%;
    }

    .commtable td {
        padding: 10px;
    }


</style>
    <script>
        $(function() {
            <c:if test="${not empty message}">

            alert("${message}");
            const state = null;
            const title = null;
            const url = `commuMain.do`;
            history.pushState(state, title, url);
            window.onpopstate = function(event) {
                history.go(1);
            };
        </c:if>
        });
        function gocommu(loc){
            location.href = "viewgroup.do?communityid="+loc;
        }
</script>

<%--css 스타일 가져오기--%>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp" />

<div class="commucon">
    <h1 class="my-4" style="color: #a22b40;">커뮤니티 허브</h1>
<table class="commtable" style="margin: 0 auto;">
    <tr>
        <td>
            <h2 class="my-4" style="color: #a22b40;">커뮤니티 찾아보기</h2>

            <div class="search-window">
                <form action="commuSearch.do" method="post">
                    <div class="search-wrap">
                        <label for="search" >커뮤니티 검색</label>
                        <input id="search" size="15" maxlength="30" type="keyword" name="keyword" placeholder="이름으로 검색하세요." value=""><br><br>
                        <button class="button" type="submit" style="border-radius:20px;">검색</button>
                    </div>
                </form>
            </div>
        </td>
        <td>
            <h2 style="color: #a22b40;">나만의 커뮤니티 생성</h2>
            <form action="commuCreate.do" method="post">
                <div class="form-group">
                    <label for="communityname">Group Name:</label>
                    <input type="text" class="pos" id="communityname" name="communityname" required>
                </div>
                <br>
                <button class="button" type="submit" style="border-radius: 20px; ">나만의 커뮤니티 이름 입력하고 만들기</button>
            </form>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <div class="big-table">
                <h3 align="center">총 커뮤니티 수 : ${listCount} 개</h3>
                <table class="table-fill">
                    <thead>
                    <tr>
                        <th scope="col">커뮤니티 이름</th>
                        <th scope="col">생성자</th>
                        <th scope="col">커뮤 생성일</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="group" items="${list}">
                        <c:set value="${group.communityid}" var="communityid" />
                        <tr onclick="gocommu('${communityid}');">
                            <td>${group.communityname}</td>
                            <td>${group.user_id}</td>
                            <td colspan="2"><fmt:formatDate value="${group.communitydate}" pattern="yyyy-MM-dd" /></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <br>
            <c:import url="/WEB-INF/views/common/page.jsp" />
        </td>
    </tr>
</table>
    <br>
    <c:import url="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>


