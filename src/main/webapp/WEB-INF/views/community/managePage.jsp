<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
    <link href="${pageContext.servletContext.contextPath}/resources/css/table.css" rel="stylesheet">
    <style>
        #bodytable{
            height: 50vh;
            width: 100vw;
            margin: 0 auto;
            border-collapse: separate;
            background: inherit;
        }
        #bodytable tr{
            background: inherit;
        }

        #bodytable td {
            text-align: center;
            margin: 0 auto;
            padding: 0;
            background: #3a3a3a;
            border-radius: 30px;
        }
        #bodytable td:first-child{
            width: 20%;
            padding: 0;
        }

        #menulist li{
            margin-bottom: 20px;

        }

        #menulist li span{
            background: #000000;
            box-shadow: 1px 1px 1px 1px #c01111;
            color: #bfc1ce;
        }



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
<table id="bodytable">
    <tr>
        <td>

                <ul id="menulist" style="list-style: none; padding: 0;">
                    <li><span class="button" onclick="showDiv(1);">가입신청 관리</span></li>
                    <li><span class="button" onclick="showDiv(2);">커뮤니티 멤버 관리</span></li>
                    <li><span class="button" onclick="showDiv(3);">커뮤니티 정보 수정</span></li>
                </ul>

        </td>
        <td>
            <div id="mdiv1">
                <div class="table-title">
                <h2 align="center">가입신청 관리</h2>
                </div>
                <table class="table-fill">
                    <tr>
                        <th>신청 번호</th>
                        <th>신청자 id</th>
                        <th>신청 내용</th>
                        <th>신청 날짜</th>
                        <th>승인/거절</th>
                    </tr>
                    <c:forEach items="${requests}" var="rq">
                        <tr>
                            <td>${rq.reqno}</td>
                            <td>${rq.user_id}</td>
                            <td>${rq.requestdes}</td>
                            <td>${rq.requestdate}</td>
                            <td>
                                <button class="button" onclick="ac(${rq.reqno});">승인</button>&nbsp;<button
                                    class="button" onclick="dc(${rq.reqno});">거절
                            </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div id="mdiv2">
                <div class="table-title">
                <h2 align="center">커뮤니티 멤버 관리</h2>
                </div>
                <table id="membertable" class="table-fill">
                    <tr>
                        <th>멤버 아이디</th>
                        <th>멤버 닉네임</th>
                        <th>멤버 등급</th>
                        <th>탈퇴</th>
                    </tr>

                </table>
            </div>
            <div id="mdiv3">
                <!-- 커뮤니티 이미지, 이름, 생성일 , 생성자 설명 보여주는 테이블 -->
                <table id="upform1" class="table-fill">
                    <tr>
                        <th>커뮤니티 이름</th>
                        <td>${group.communityname}</td>
                    </tr>
                    <tr>
                        <th>커뮤니티 설명</th>
                        <td>${group.communitydesc}</td>
                    </tr>
                    <tr>
                        <th>커뮤니티 생성일</th>
                        <td>${group.communitydate}</td>
                    </tr>
                    <tr>
                        <th>커뮤니티 생성자</th>
                        <td>${group.user_id}</td>
                    </tr>
                    <tr>
                        <th>커뮤니티 이미지</th>
                        <c:if test="${group.communityimgrename == null}">
                        <td>커뮤니티 대표 이미지가 지정되지 않았습니다.
                        <td>
                            </c:if>
                            <c:if test="${group.communityimgrename != null}">
                        <td><img src="${pageContext.servletContext.contextPath}/resources/commuimg/${group.communityimgrename}" width="100px" height="100px"></td>
                        </c:if>
                    </tr>
                    <td>
                        <th colspan="2" style="align-items: center">
                            <button onclick="updateform();">수정</button> &nbsp;
                            <button onclick="deletecommu();">삭제</button>
                        </th>
                    </td>
                </table>
                <form action="updatecommu.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="communityid" value="${group.communityid}">
                    <table id="upform2" class="table-fill">
                        <tr>
                            <th>커뮤니티 이름</th>
                            <td><input name="communityname" placeholder="${group.communityname}"></td>
                        </tr>
                        <tr>
                            <th>커뮤니티 설명</th>
                            <td><input name="communitydesc" placeholder="${group.communitydesc}}"></td>
                        </tr>
                        <tr>
                            <th>커뮤니티 생성일</th>
                            <td>${group.communitydate}</td>
                        </tr>
                        <tr>
                            <th>커뮤니티 생성자</th>
                            <td>${group.user_id}</td>
                        </tr>
                        <tr>
                            <th>커뮤니티 이미지</th>
                                <td><input type="file" name="orifile" value="이미지파일 등록">

                            <c:if test="${group.communityimgrename != null}">
                                <input type="hidden" name="changeimg" value="${group.communityimgrename}">
                                &nbsp; &nbsp; <input type="checkbox" name="delflag" value="yes"> 파일삭제
                            </c:if>
                                </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="align-items: center">
                                <input type="submit" value="수정확인"> &nbsp;&nbsp; <input type="button" value="수정취소"
                                    onclick="updateform();">
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <script>
                $(function () {
                    document.getElementById("mdiv1").style.display = "block";
                    document.getElementById("mdiv2").style.display = "none";
                    document.getElementById("mdiv3").style.display = "none";
                    $('#upform2').css("display", "none");
                });

                function deletemember(id) {
                    var user_id = id;
                    location.href = "deletemember.do?user_id=" + user_id + "&communityid=${communityid}";
                    return false;
                }

                function showDiv(num) {
                    // Hide all divs
                    document.getElementById("mdiv1").style.display = "none";
                    document.getElementById("mdiv2").style.display = "none";
                    document.getElementById("mdiv3").style.display = "none";

                    // Show the selected div
                    document.getElementById("mdiv" + num).style.display = "block";
                    if (num === 2) {

                        $.ajax({
                            url: "managemember.do",
                            type: "post",
                            data: {
                                "communityid": "${communityid}"
                            },
                            dataType: "json",
                            success: function (data) {
                                var json = JSON.parse(JSON.stringify(data));
                                var members = "<tr><th>멤버 아이디</th><th>멤버 닉네임</th><th>멤버 등급</th><th>탈퇴</th> </tr>";

                                for (var i in json.list) {
                                    var role = '';
                                    if (json.list[i].user_id == "${group.user_id}" || json.list[i].admin_id  == 'Y') {
                                        role = '관리자';
                                        members += "<tr><td>" + json.list[i].user_id + "</td><td>" + json.list[i].user_nickname + "</td><td>" + role + "</td><td></td></tr>";
                                    } else {
                                        role = '회원';
                                        members += "<tr><td>" + json.list[i].user_id + "</td><td>" + json.list[i].user_nickname + "</td><td>" + role + "</td><td>" + "<button onclick=\"deletemember('"+user_id+"');\">탈퇴</button></td></tr>";
                                    }
                                    var user_id = json.list[i].user_id;


                                }
                                $("#membertable").html(members);
                            },
                            error: function (request, status, errorData) {
                                alert("error code : " + request.status + ", error message : " + request.response
                                    + "Error : " + errorData);
                            }
                        });
                    }
                }


                function updateform() {

                   if($('#upform1').css("display") == "none"){
                       $('#upform1').css("display", "block");
                       $('#upform2').css("display", "none");
                     }else{
                       $('#upform1').css("display", "none");
                       $('#upform2').css("display", "block");
                     }
                }

                function ac(num) {
                    location.href = "acceptreq.do?reqno=" + num;
                }

                function dc(num) {
                    location.href = "declinereq.do?reqno=" + num;
                }
                function deletecommu() {
                   if(confirm("정말로 삭제하시겠습니까?")){
                    location.href = "deletecommu.do?communityid=${communityid}";
                   } else {
                          return false;
                   }
                }
            </script>
        </td>
    </tr>
</table>
<br style="clear: both">
<c:import url="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
