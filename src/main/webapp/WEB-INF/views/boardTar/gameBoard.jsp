<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="ListCount" value="${ requestScope.paging.listCount }"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>boardDetailView</title>
    <style type="text/css">
        .search-window {
            text-align: center;
        }

        .list-table {
            text-align: center;
        }

        .big-table {
            text-align: center;
        }
        a {
            color: #fef2dc;
        }
        a:visited {
            color: #fef2dc;
        }
        body {
            background-color: #081c2b;
            font-family: "Roboto", helvetica, arial, sans-serif;
            font-size: 16px;
            font-weight: 400;
            text-rendering: optimizeLegibility;
        }

        div.table-title {
            display: block;
            margin: auto;
            max-width: 600px;
            padding: 5px;
            width: 100%;
            text-align: center;
        }

        .table-title h3 {
            color: #dcd9d9;
            font-size: 30px;
            font-weight: 400;
            font-style: normal;
            font-family: "Roboto", helvetica, arial, sans-serif;
            text-shadow: -1px -1px 1px rgba(0, 0, 0, 0.1);
            text-transform: uppercase;
        }


        /*** Table Styles **/

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

        tbody tr:hover td {
            background: #3a3a3a;
        }

        tr:last-child{
            border-bottom-right-radius: 20px;
            border-bottom-left-radius: 20px;
        }

    </style>
    <script>
        window.onload = function () {
            if (${!empty message && message ne '${name}게시판에 오신것을 환영합니다.' }) {
                alert("${message}");
                history.pushState({"appid":${appid}}, null, "movegameboard.do");
                window.onpopstate = function (event) {
                    history.go(1);
                };
            }
        }
    </script>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>

<header>
    <link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
</header>


<section class="notice">
    <div>
        <div class="table-title">
            <h3>${name} 게시판</h3>
        </div>
    </div>

    <!-- board seach area -->

    <div class="search-window">
        <form action="gameboardsearch.do" method="post">
            <input type="hidden" name="appid" value="${appid}">
            <input type="hidden" name="page" value="${page}">
            <div class="search-wrap">
                <select name="action">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="id">아이디</option>
                </select>
                <input id="search" type="search" name="keyword" placeholder="검색할 내용을 입력하세요">
                <button type="submit" class="btn btn-dark">검색</button>
            </div>
        </form>
    </div>
    <br>
    <br>
    <div class="big-table">
        <aside>
            <c:url var="gbwrite" value="/gbwriteform.do">
                <c:param name="page" value="${page}"/>
                <c:param name="appid" value="${appid}"/>
                <c:param name="name" value="${name}"/>
            </c:url>
            <button onclick="javascript:location.href='${gbwrite}';">글작성</button>
        </aside>

        <div class="list-table">

            <table class="table-fill">
                <thead>
                <tr>
                    <th class="th-num">조회수</th>
                    <th class="th-title">제목</th>
                    <th class="th-date">등록일</th>
                    <th class="th-id">ID</th>
                    <th class="th-num">번호</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach items="${ requestScope.list }" var="boardTar">

                    <tr>
                        <c:url var="dtview" value="/movetarboarddetail.do">
                            <c:param name="board_no" value="${ boardTar.board_no }"/>
                            <c:param name="page" value="${ page }"/>
                            <c:param name="appid" value="${appid}"/>
                            <c:param name="name" value="${name}"/>
                            <c:param name="user_id" value="${ loginUser.user_id }"/>
                        </c:url>

                        <td>${ boardTar.board_count }</td>
                        <td>
                            <a href="${ dtview }">${ boardTar.board_title }</a>
                        </td>
                        <td><fmt:formatDate value="${ boardTar.board_date }" pattern="yyyy-MM-dd"/></td>
                        <td>${ boardTar.user_id }</td>
                        <td>${ boardTar.board_no }</td>
                    </tr>


                </c:forEach>
                </tbody>
                <br>
            </table>

        </div>

    </div>
    <br style="clear: both;">
    <br>
    <jsp:include page="/WEB-INF/views/common/page.jsp"/>
    <br>

    <c:import url="/WEB-INF/views/common/footer.jsp"/>

</section>

</body>
</html>