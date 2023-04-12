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
        }

        #schlist td {
            background-color: white;
        }

        #schlist {
            border: 1px solid black;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        #schlist tr th {
            border-left: 1px solid black;
            text-align: center;
            padding-top: 5%;
            background-color: #f56a6a;
            color: unset;
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

            if (asch.style.display === 'none') {
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
                            + "<tr><td colspan=\"5\"><span class=\"button\" onclick=\"voting1(" + json.list[i].schId + ");\">참가</span>"
                            + "&nbsp; &nbsp; <span class=\"button\" onclick=\"voting2(" + json.list[i].schId + ");\">불참</span></td>"
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
<body>
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

    <div id="asch">
        <form action="insertsch.do" method="post">
            <input type="hidden" name="communityid" value="${communityid}">
            <!-- 일정명 -->
            <label>일정이름 : <input type="text" name="schName" id="tn"></label>
            <!-- 일정 설명 -->
            <label>일정내용 : <textarea name="schDes" rows="5" cols="30"
                                    id="td"></textarea></label>
            <!-- 일정 시작일 -->
            <label>일정시작일 : &nbsp; <input type="date" name="schStart"></label>
            <!-- 일정 종료일 -->
            <label>일정종료일 : &nbsp; <input type="date" name="schEnd"></label>
            <input type="submit">
        </form>
    </div>


    <hr>

    <table style=" max-width: 900px;" id="schlist">
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
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>