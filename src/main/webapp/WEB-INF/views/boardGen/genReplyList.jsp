<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.6.3.min.js"></script>
  <style>
    .comment-content * {
      color: #fef2dc;
    }
    .comment-author, .comment-date {
      color: #ad7c8c;
    }
  </style>
  <script>
    $(document).ready(function() {

      function htmlDecode(input) {
        var e = document.createElement('textarea');
        e.innerHTML = input;
        return e.childNodes.length === 0 ? "" : e.childNodes[0].nodeValue;
      }

      //수정 버튼 눌렀을 때 수정창 띄우기
      $(".edit-comment").on("click", function() {
        var com_no = $(this).data("com_no");
        var contentElem = $("#content-" + com_no);
        var content = htmlDecode(contentElem.html());
        contentElem.html('<textarea id="edit-content-' + com_no + '" class="form-control" rows="3">' + content + '</textarea>');
        $(this).hide();
        $(this).after('<a href="javascript:void(0)" class="update-comment" data-com_no="' + com_no + '">수정완료</a>');
      });

      //수정 버튼 이후 수정확인 클릭했을 때 수정된 내용 서버에 저장
      $(document).on("click", ".update-comment", function() {
        var com_no = $(this).data("com_no");
        var editedContent = $("#edit-content-" + com_no).val();
        var board_no = $("#board_no").val();

        // Perform AJAX request to update the comment on the server
        $.ajax({
          url: "updateGameComment.do", // Replace with the URL to your controller method
          type: 'POST',
          data: {
            com_no: com_no,
            com_contents : editedContent,
            board_no: board_no,
            user_id: $("#author-" + com_no).text()
          },
          success: function(response) {
            // Update the content and restore the buttons
            $("#content-" + com_no).text(editedContent);
            $(".update-comment").remove();
            $(".edit-comment").show();
          },
          error: function() {
            alert("Failed to update comment.");
          }
        });
      });

      $(".delete-comment").on("click", function() {
        var com_no = $(this).data("com_no");
        // Perform AJAX request to delete the comment on the server
        $.ajax({
          url: 'deleteGameComment.do', // Replace with the URL to your controller method
          type: 'POST',
          data: {
            com_no: com_no
          },
          success: function(response) {
            // Remove the comment from the page
            $("#content-" + com_no).parent().parent().remove();
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

<c:forEach var="comment" items="${comment}" >
<div class="comment">
  <div class="comment-content">
    <span class="comment-author" id="author-${comment.com_no}">${comment.user_id}</span>
    <span class="comment-date" id="date-${comment.com_no}">${comment.com_date}</span>
    <h3><p id="content-${comment.com_no}">${comment.com_contents}</p></h3>
      <%--수정삭제버튼 if 문 확인해야함--%>
    <div class="comment-btn">
      <c:if test="${comment.user_id eq sessionScope.loginUser.user_id}">
        <a href="javascript:void(0)" class="edit-comment" data-com_no="${comment.com_no}">수정</a> &nbsp;
        <a href="javascript:void(0)" class="delete-comment" data-com_no="${comment.com_no}">삭제</a>
      </c:if>
      <hr>
    </div>
  </div>
  </c:forEach>

</body>
</html>