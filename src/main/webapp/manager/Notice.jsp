<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/login/sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="/Project2/css/notice.css">
</head><body>
		<div class="intro_bg">
			<div class="header1">
				<div class="search_area">
					<form>
						<input type="checkbox" id="icon"> 
						<label for="icon">
							<span></span> 
							<span></span> 
							<span></span>
						</label>
						<div id="header">
							<ul>
								<li><a href="#">menu1</a></li>
								<li><a href="#">menu1</a></li>
								<li><a href="#">menu1</a></li>
								<li><a href="#">menu1</a></li>
								<li><a href="#">menu1</a></li>
							</ul>
						</div>
						<input type="search" placeholder="Search" required="required"
							autofocus="autofocus"> <span>검색</span>
					</form>					
				</div>
					<div class="nav">
						<a href="/Project2/login/LoginForm.do">로그인</a>
						<a href="/Project2/login/JoinForm.do">회원가입</a>
					</div>
				</div>
			</div>
    <div class="board_wrap">
        <div class="board_title">
            <strong>회원관리</strong>
            <p>회원정보</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">아이디</div>
                    <div class="num">이름</div>
                    <div class="num">주소</div>
                    <div class="num">나이</div>
                    <div class="num">전화번호</div>
                    <div class="num">성별</div>
                    <div class="num">이메일</div>
                </div>
                <c:if test="${empty list}">
	            <tr><th colspan="5">데이터가 없습니다</th></tr>
               </c:if>
               <c:if test="${not empty list}">
	<c:forEach var="member" items="${list }">
                <div class="text">     
                    <div class="num">${member.id }</div>
                    <div class="title">${member.name }</div>
                    <div class="write">${member.address }</div>
                    <div class="date">${member.age }</div>
                    <div class="count">${member.tel }</div>
                    <div class="count">${member.gender }</div>
                    <div class="count">${member.mail }</div>
                    <div class="count"><input type="button" value="회원탈퇴" onclick="location.href='/Project2/master/masterDelete.do?id=${member.id}'"></div>
                </div>
                </c:forEach>
                </c:if>
            </div>
            <div class="board_page">
              <a href="#" class="bt first"><<</a>
              <a href="#" class="bt prev"><</a>
              <a href="#" class="num on">1</a>
              <a href="#" class="num">2</a>
              <a href="#" class="num">3</a>
              <a href="#" class="num">4</a>
              <a href="#" class="num">5</a>
              <a href="#" class="bt naxt">></a>
              <a href="#" class="bt last">>></a>
            </div>
            <div class="bt_wrap">
                <a href="/Project2/list/Write.wo" class="on">등록</a>
             <!--    <a href="Edit.jsp">수정</a> -->
            </div>
        </div>
    </div>
</body>
</html>
                
                
                
                
        
                