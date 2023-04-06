<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ICT02-14
  Date: 2023-04-04
  Time: PM 2:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
    <script>
        $(document).ready(function() {

            function htmlDecode(input) {
                var e = document.createElement('textarea');
                e.innerHTML = input;
                return e.childNodes.length === 0 ? "" : e.childNodes[0].nodeValue;
            }

            //수정 버튼 눌렀을 때 수정창 띄우기
            $(".edit-comment").on("click", function() {
                var ccomno = $(this).data("ccomno");
                var contentElem = $("#content-" + ccomno);
                var content = htmlDecode(contentElem.html());
                contentElem.html('<textarea id="edit-content-' + ccomno + '" class="form-control" rows="3">' + content + '</textarea>');
                $(this).hide();
                $(this).after('<a href="javascript:void(0)" class="update-comment" data-ccomno="' + ccomno + '">Confirm</a>');
            });


            //수정 버튼 이후 수정확인 클릭했을 때 수정된 내용 서버에 저장
            $(document).on("click", ".update-comment", function() {
                var ccomno = $(this).data("ccomno");
                var editedContent = $("#edit-content-" + ccomno).val();
                // Perform AJAX request to update the comment on the server
                $.ajax({
                    url: "updateCommuComment.do", // Replace with the URL to your controller method
                    type: 'POST',
                    data: {
                        ccomno: ccomno,
                        ccomcontent: editedContent
                    },
                    success: function(response) {
                        // Update the content and restore the buttons
                        $("#content-" + ccomno).text(editedContent);
                        $(".update-comment").remove();
                        $(".edit-comment").show();
                    },
                    error: function() {
                        alert("Failed to update comment.");
                    }
                });
            });

            $(".delete-comment").on("click", function() {
                var ccomno = $(this).data("ccomno");
                // Perform AJAX request to delete the comment on the server
                $.ajax({
                    url: 'deleteCommuComment.do', // Replace with the URL to your controller method
                    type: 'POST',
                    data: {
                        ccomno: ccomno
                    },
                    success: function(response) {
                        // Remove the comment from the page
                        $("#content-" + ccomno).parent().parent().remove();
                    },
                    error: function() {
                        alert("Failed to delete comment.");
                    }
                });
            });
        });
    </script>

</head>
<body>

<%--CComment 리스트로 가져와서 댓글 보여주기--%>
<c:forEach var="comment" items="${commentList}" >
    <div class="comment">

        <div class="comment-content">
            <span class="comment-author" id="author-${comment.ccomno}">${comment.user_id}</span>
            <span class="comment-date" id="date-${comment.ccomno}">${comment.ccomdate}</span>
            <h3><p id="content-${comment.ccomno}">${comment.ccomcontent}</p></h3>

        <%--수정삭제버튼--%>
            <div class="comment-btn">
                <a href="javascript:void(0)" class="edit-comment" data-ccomno="${comment.ccomno}">Edit</a>
                <a href="javascript:void(0)" class="delete-comment" data-ccomno="${comment.ccomno}">Delete</a>

                <hr>
        </div>
    </div>
</c:forEach>


</body>
</html>
