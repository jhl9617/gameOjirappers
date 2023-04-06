<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UserDatailPage</title>
    <style>
    
    bady{
    margin-bottom:0px;
    font-family: 'HSSaemaul-Regular';
    }
    
    @font-face {
    font-family: 'HSSaemaul-Regular'; 
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSSaemaul-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}

    
    .table-container {
      display: flex;
      flex-direction: row;
    }
    
    .menu p {
      position: relative;
      top: -48px;
      width: 200px;
      padding-top: 10px;
    }
    
    .menu td {
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
      top: 0px;
      width: 700px;
      height: 80px;
      background: pink;
      }
      
    .user_community {
      position: relative;
      top: -30px;
      width: 700px;
      height: 100px;
      background: pink;        
      }
    .user_board {
      position: relative;
      top: -60px;
      width: 700px;
      height: 150px;
      background: pink;
      }
    .user_commont_comment {
      position: relative;
      top: -90px;
      width: 700px;
      height: 150px;
      background: pink;
      }
    .user_gamelist {
      position: relative;
      top: -120px;
      width: 700px;
      height: 150px;
      background: pink;
      }
      
	input[type="submit"],
	input[type="button"],
	.button {
	  -moz-appearance: none;
	  -webkit-appearance: none;
	  -ms-appearance: none;
	  appearance: none;
	  -moz-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  -webkit-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  -ms-transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
	  background-color: transparent;
	  border-radius: 0.375em;
	  border: 0;
	  box-shadow: inset 0 0 0 2px #f56a6a;
	  color: #f56a6a !important;
	  cursor: pointer;
	  display: inline-block;
	  font-family: 'Noto Sans KR', sans-serif;
	  font-size: 0.8em;
	  font-weight: 700;
	  height: 3.5em;
	  width: 150px;
	  letter-spacing: 0.075em;
	  line-height: 3.5em;
	  padding: 0;
	  text-align: center;
	  text-decoration: none;
	  text-transform: uppercase;
	  white-space: nowrap; }


    </style>
    
</head>
<body>
<%-- <c:import url="/WEB-INF/views/common/menubar.jsp"/> --%>
<br> <br>
    <div class="table-container">
      <div class="menu">
        <form>
        <br> <br> <br><br>
          <p>
         	<input type="button" onclick="#"  value="프로필이미지">
        	<input type="button" onclick="#"  value="프로필이미지수정"><br>
			<input type="button" onclick="#"  value="닉네임"><br>
			<input type="button" onclick="#"  value="내 등급"><br>
<%-- 			<a href="${ pageContext.servletContext.contextPath }/moveUpdatePage.do?user_id=${ sessionScope.loginUser.user_id }" class="button"><span class="label">회원정보관리</span></a> --%>
			<input type="button" onclick="location.href = 'moveUpdatePage.do?user_id=${ sessionScope.loginUser.user_id }'"  value="내 정보수정"><br>
			<input type="button" onclick="#"  value="메인화면으로"><br>
			<input type="button" onclick="location.href = 'delPage.do?user_id=${ sessionScope.loginUser.user_id }'"  value="탈퇴하기"><br>
        </form>
      </div>
      

      
      <br>
      <div class="user">
      <h4>마이페이지</h4>
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
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>