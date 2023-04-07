<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>"/>
    <style>
        nav ul li {
            margin-top: 20px;
            display: block;
        }

        div {
            display: none;
            margin-right: 20%;
            padding: 0;
            border: 1px solid crimson;
        }

        th {
            border: 1px solid white;
            background-color: #956565;
            text-align: center;
        }
        nav{
            margin: 0; padding: 0; width: 30%;
        }
        table tr {text-align: center;}
    </style>
</head>
<body>
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
<script>
    function showAlertMessage() {
        <c:if test="${not empty message}">
        alert("${message}");
        </c:if>

    }
</script>
<br>
<br>
<table>
    <tr>
        <td>
            <nav style=" margin: 0; padding: 0; width: 30%;">
                <ul style="list-style: none; padding: 0;">
                    <li><span class="button" onclick="showDiv(1);">가입신청 관리</span></li>
                    <li><span class="button" onclick="showDiv(2);">커뮤니티 멤버 관리</span></li>
                    <li><span class="button" onclick="showDiv(3);">커뮤니티 정보 수정</span></li>
                    <li><span class="button" onclick="showDiv(4);">커뮤니티 삭제</span></li>
                </ul>
            </nav>
        </td>
        <td>
            <div id="mdiv1">
                <h2 align="center">가입신청 관리</h2>
                <table>
                    <tr>
                        <th>신청 번호</th>
                        <th>신청자 id</th>
                        <th>신청 내용</th>
                        <th>신청 날짜</th>
                        <th>승인/거절</th>
                    </tr>
                    <c:forEach items="${requests}" var="rq" >
                        <tr>
                            <td>${rq.reqno}</td>
                            <td>${rq.user_id}</td>
                            <td>${rq.requestdes}</td>
                            <td>${rq.requestdate}</td>
                            <td>
                                <button class="button" onclick="ac(${rq.reqno});">승인</button>&nbsp;<button class="button" onclick="dc(${rq.reqno});">거절</button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div id="mdiv2">
                2번
            </div>
            <div id="mdiv3">
                3번
            </div>
            <div id="mdiv4">
                4번
            </div>
            <script>
                $(function(){
                    document.getElementById("mdiv1").style.display = "block";
                });
                function showDiv(num) {
                    // Hide all divs
                    document.getElementById("mdiv1").style.display = "none";
                    document.getElementById("mdiv2").style.display = "none";
                    document.getElementById("mdiv3").style.display = "none";
                    document.getElementById("mdiv4").style.display = "none";

                    // Show the selected div
                    document.getElementById("mdiv" + num).style.display = "block";
                }
                function ac(num){
                    location.href = "acceptreq.do?reqno=" + num;
                }

                function dc(num){
                    location.href = "declinereq.do?reqno=" + num;
                }
            </script>
        </td>
    </tr>
</table>
<br style="clear: both">
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
