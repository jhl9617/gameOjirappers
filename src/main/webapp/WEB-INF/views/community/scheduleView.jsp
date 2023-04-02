<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 허브</title>
    <style type="text/css">
        #asch{
            visibility: hidden;
        }
    </style>
    <script type="text/javascript">
        function addsch(){
            const asch = document.getElementById('asch');

            if (asch.style.visibility === 'hidden') {
                asch.style.visibility = 'visible';
            } else {
                asch.style.visibility = 'hidden';
            }
        }

        $(function () {
            $.ajax({
                type: 'POST',
                url: '/schlist.do',
                dataType: 'json',
                success: function(data) {
                    // 받은 Object => string 으로 바꿈
                    var jsonStr = JSON.stringify(data);
                    // sting => json 객체로 바꿈
                    var json = JSON.parse(jsonStr);

                    var schs = $('#schlist').html();

                    for(var i in json.list){
                        schs += "<tr><td>"+ json.list[i].schName +
                                "</td><td>"+ json.list[i].schDes +
                                "</td><td>"+ json.list[i].schStart +
                                "</td><td>"+ json.list[i].schEnd +
                                "</td></tr>"
                    }

                    $('#schlist').html(schs);
                },
                error: function(xhr, status, error) {
                    // AJAX 요청이 실패하면 실행되는 콜백 함수입니다.
                    // 오류 메시지를 출력합니다.
                    console.error(xhr + ", " + status + ", " + error);
                }
            });
        });
    </script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>"/>
    <%--css 스타일 가져오기--%>
</head>
<body>
<c:import url="${pageContext.servletContext.contextPath}/WEB-INF/views/common/menubar.jsp"/>
<br>
<br>
<hr>
<section>
    <div>
        <span onclick="addsch();">새로운 일정 등록</span>
    </div>
    <div id="asch">
        <form action="insertsch.do" method="post">
            <input type="hidden" name="communityid" value="${communityid}">
            <!-- 일정명 -->
            <input type="text" name="schName">
            <!-- 일정 설명 -->
            <textarea name="schDes" rows="5" cols="50"></textarea>
            <!-- 일정 시작일 -->
            <input type="date" name="schStart">
            <!-- 일정 종료일 -->
            <input type="date" name="schEnd">
            <input type="submit">
        </form>
    </div>
</section>

<br>
<br>
<hr>
<c:import url="${pageContext.servletContext.contextPath}/WEB-INF/views/common/footer.jsp"/>
</body>
</html>