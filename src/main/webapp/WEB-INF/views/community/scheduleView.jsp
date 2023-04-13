<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 허브</title>

    <style type="text/css">
        #asch {
            display: none;
            width: 500px;
            height: 300px;
            margin:0 auto;
            text-align: center;
        }

        #calendar{
            color: #f56a6a;
            margin: 0 auto;
        }

        #calendar a {
            background: #f56a6a;
        }

        #tn {
            width: 150px;
        }

        #td {
            width: 200px;
        }

        #calendar {
            max-width: 900px;
            max-height: 600px;
            margin-bottom: 200px;
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

        .table-fill th {
            color: #fef2dc !important;
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

        .table-fill tr:first-child {
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
        }

        .table-fill th:first-child {
            border-top-left-radius: inherit;
        }

        .table-fill th:last-child {
            border-top-right-radius: inherit;
        }

        .table-fill tr {
            border-bottom: 2px;
            border-top: 2px;
            color: #666B85;
            text-shadow: 0 1px 1px rgba(256, 256, 256, 0.1);
        }


        .table-fill td {
            background: #081c2b;
            color: #fef2dc;
        }

        .table-fill tr:last-child{
            border-bottom-right-radius: 20px;
            border-bottom-left-radius: 20px;
        }

    </style>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css'/>
    <script type="text/javascript"
            src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js'></script>
    <script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js'></script>
    <script type="text/javascript">
        // 일정 추가
        function addsch() {
            const asch = document.getElementById('asch');

            if (asch.style.display == 'none') {
                asch.style.display = 'block';
            } else {
                asch.style.display = 'none';
            }
        }

        // 일정 참가
        function voting1(schid) {
            if(confirm("참가하시겠습니까?")){
                location.href = "voting1.do?schid=" + schid + "&user_id=${loginUser.user_id}&communityid=${communityid}";
            } else {
                return false;
            }
        }

        // 일정 불참
        function voting2(schid) {
            if(confirm("불참하시겠습니까?")){
                location.href = "voting2.do?schid=" + schid + "&user_id=${loginUser.user_id}&communityid=${communityid}";
            } else {
                return false;
            }
        }

        $(function () {
            var values = $('#schlist').html();
            // 일정 리스트
            $.ajax({
                url: "schlist.do",
                type: "post",
                data: {
                    "communityid": "${communityid}",
                    "login_id": "${loginUser.user_id}"
                },
                dataType: "json",
                success: function (data) {
                    var jsonStr = JSON.stringify(data);
                    var json = JSON.parse(jsonStr);

                    for (var i in json.list) {
                        values += "<tr><td>"
                            + decodeURIComponent(json.list[i].schName).replace(
                                /\+/gi, " ")
                            + "</td><td>"
                            + decodeURIComponent(json.list[i].schDes).replace(
                                /\+/gi, " ") + "</td><td>"
                            + json.list[i].schStart + "</td><td>"
                            + json.list[i].schEnd + "</td><td>"
                            + json.list[i].votePart
                            + "</td></tr>"
                            + "<tr style='text-align: center;'><td colspan=\"5\"><span class=\"button\" style='width:50px;' onclick=\"voting1(" + json.list[i].schId + ");\">참가</span>"
                            + "&nbsp; &nbsp; <span class=\"button\" style='width:50px;'  onclick=\"voting2(" + json.list[i].schId + ");\">불참</span></td>"
                            + "</tr>"
                        ;
                    }

                    $('#schlist').html(values);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log("error : " + JSON.stringify(jqXHR) + ", "
                        + textStatus + ", " + errorThrown);
                }
            }); // list

            // 일정 달력
            $.ajax({
                url: 'schcal.do', // Replace with your server URL that returns the JSON object
                type: 'post',
                data: {
                    "communityid": "${communityid}"
                },
                dataType: 'json',
                success: function (data) {
                    var jsonStr = JSON.stringify(data);
                    var json = JSON.parse(jsonStr).list;
                    console.log("data : " + JSON.stringify(json));
                    var events = [];
                    for (var i in json) {

                        events.push({
                            title: decodeURIComponent(json[i].title).replace(
                                /\+/gi, " "),
                            start: json[i].start,
                            end: json[i].end
                        });
                    }
                    $('#calendar').fullCalendar({

                        initialView: 'dayGridMonth',
                        events: events
                    });
                },
                error: function (jqXHR, err, errorThrown) {
                    console.error('Error loading events: ' + JSON.stringify(jqXHR) + "[" + JSON.stringify(err) + "], " + errorThrown);
                }
            });
        }); //document ready


    </script>


    <%--css 스타일 가져오기--%>
</head>
<body style="padding: 0 0 70px 0;">
<c:import url="/WEB-INF/views/common/menubar.jsp"/>
<br>
<br>
<hr>
<center>
    <h2>이번 달 일정</h2>


    <div id="calendar"></div>

    <c:if test="${loginUser.user_id eq cGroup.user_id}">
        <div align="center">
            <span onclick="addsch();" class="button">새로운 일정 등록</span>
        </div>
    </c:if>
<br>
    <br>
    <table id="asch" class="table-fill" style="padding-left: 10%">
        <form action="insertsch.do" method="post">
            <tr>
                <th> <!-- 일정명 -->
                    일정이름 </th>
                <td><input type="text" name="schName" id="tn"></td>
            </tr>
            <tr>
                <th>일정내용</th>
                <td> <textarea name="schDes" rows="5" cols="30" id="td"></textarea></td>
            </tr>
            <tr>
                <th>일정시작일</th>
                <td><input type="date" name="schStart"></td>
            </tr>
            <tr>
                <th>일정종료일</th>
                <td><input type="date" name="schEnd"></td>
            </tr>
            <input type="hidden" name="communityid" value="${communityid}">
            <tr><td colspan="2"><input class="button" style="width: 70px;" type="submit"></td></tr>
        </form>
    </table>


    <hr>

    <table style=" max-width: 900px;" id="schlist" class="table-fill">
        <tr>
            <th><h5>일정이름</h5></th>
            <th><h5>일정내용</h5></th>
            <th><h5>시작일</h5></th>
            <th><h5>종료일</h5></th>
            <th><h5>참가여부</h5></th>
        </tr>
    </table>
</center>
<br>
<br>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>