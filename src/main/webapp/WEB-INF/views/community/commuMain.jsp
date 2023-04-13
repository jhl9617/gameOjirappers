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

    .table-fill {
        background: #081c2b;
        border: 2px;
        border-radius: 20px;
        border-collapse: collapse;
        margin: 0 auto;
        max-width: 600px;
        padding: 5px;
        width: 100%;
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        animation: float 5s infinite;
    }

    th {
        color: #a0a0a0;
        background: #282828;
        border-bottom: 4px ;
        border-right: 1px;
        border-left: 2px;
        border-bottom: #ece8dd;
        padding: 5px;
        text-align: center;
        text-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        vertical-align: middle;
        background-clip: padding-box;
    }

    tr:first-child {
        border-top-left-radius: 20px;
        border-top-right-radius: 20px;
    }

    th:first-child {
        border-top-left-radius: inherit;
    }

    th:last-child {
        border-top-right-radius: inherit;
    }

    tr {
        border-bottom: 2px;
        border-top: 2px;
        color: #666B85;
        text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
    }


    td {
        background: #081c2b;
        color: #fef2dc;
    }



    tr:last-child{
        border-bottom-right-radius: 20px;
        border-bottom-left-radius: 20px;
    }

    h2 {
        color: #dcd9d9;
        font-size: 30px;
        font-weight: 400;
        font-style: normal;
        font-family: "Roboto", helvetica, arial, sans-serif;
        text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
        text-transform: uppercase;
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

    <h1 class="my-4" style="color: #f56a6a;">커뮤니티 허브</h1>
<table class="commtable" style="margin: 0 auto;">
    <tr>
        <td>
            <h2 class="my-4" style="color: #f56a6a;">커뮤니티 찾아보기</h2>


            <div class="search-window">
                <form action="commuSearch.do" method="post">
                    <div class="search-wrap">
                        <label for="search" >커뮤니티 검색</label>

                        <input id="search" size="15" maxlength="30" style="background: lightgray;" type="keyword" name="keyword" placeholder="이름으로 검색하세요." value=""><br><br>
                        <button class="button" type="submit" style="border-radius:20px;">커뮤니티 검색</button>

                    </div>
                </form>
            </div>
        </td>
        <td>
            <h2 style="color: #f56a6a;">나만의 커뮤니티 생성</h2>
            <form action="commuCreate.do" method="post">
                <div class="form-group">
                    <label for="communityname">Group Name:</label>
                    <input type="text" class="pos" style="background: lightgray;" id="communityname" name="communityname" placeholder="생성할 커뮤니티 이름 입력" required>
                </div>
                <br>
                <button class="button" type="submit" style="border-radius: 20px; ">커뮤니티 생성</button>

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


