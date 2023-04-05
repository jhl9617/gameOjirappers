<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserDatailPage</title>
    <style>
      .table-container {

        display: flex;
        flex-direction: row;
      }
      
      .table1 {
        position: relative;
        top: -48px;
        width: 200px;
        padding: 10px;
      }
      
      .table1 td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
      }
      
      /* ////////////////////////////////// */
      .div {
      position: static;
      }
      
      .user_point { 
        position: relative;
        top: 40px;
        width: 700px;
        height: 80px;
        background: pink;
        }
        
      .user_community {
        position: relative;
        top: 5px;
        width: 700px;
        height: 100px;
        background: pink;        
        }
      .user_board {
        position: relative;
        top: -30px;
        width: 700px;
        height: 150px;
        background: pink;
        }
      .user_commont_comment {
        position: relative;
        top: -65px;
        width: 700px;
        height: 150px;
        background: pink;
        }
      .user_gamelist {
        position: relative;
        top: -100px;
        width: 700px;
        height: 150px;
        background: pink;
        }
      
      
    </style>
    
</head>
<body>

<h1> 마이페이지임</h1>

    <div class="table-container">
      <div class="table1">
        <table>
        <br> <br>
          <tr>
            <td>프로필이미지</td>
          </tr>
          <tr>
            <td>프로필이미지수정</td>
          </tr>
          <tr>
            <td>닉네임</td>
          </tr>
          <tr>
            <td>등급</td>
          </tr>
          
          <br><br>
          
          <tr>
            <td>회원정보관리</td>
          </tr>
          <tr>
            <td>메인화면으로</td>
          </tr>
          <tr>
            <td>탈퇴하기</td>
          </tr>
        </table>
      </div>
      
      <br>
      <div class="user">
      <div class="user_point">
        <h5>누적적립포인트</h5>
        <table>
          <tr>
            <td>누적적립포인트 출력예정</td>
          </tr>
        </table>
      </div>
      
      <br>
      <div class="user_community">
        <h5>내가 가입한 밴드</h5>
        <table>
          <tr>
            <td>내가 가입한 밴드 출력예정</td>
          </tr>
        </table>
      </div>
      
      <br>
      <div class="user_board">
        <h5>내가 쓴 글 보기</h5>
        <table>
          <tr>
            <td>내가 쓴 글 보기 출력예정</td>
          </tr>
        </table>
      </div>
      
      <br>
      <div class="user_commont_comment">
        <h5>내가 쓴 댓글 보기</h5>
        <table>
          <tr>
            <td>내가 쓴 댓글 보기 출력예정</td>
          </tr>
        </table>
      </div>
      
      <br>
      <div class="user_gamelist">
        <h5>즐겨찾기한 게임리스트</h5>
        <table>
          <tr>
            <td>즐겨찾기한 게임리스트 출력예정</td>
          </tr>
        </table>
      </div>
      </div>
      
      
    </div><%-- all div close --%>

</body>
</html>