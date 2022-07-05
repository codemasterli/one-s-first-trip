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
            <strong>공지사항</strong>
            <p>일단 아무거나</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="num">번호</div>
                    <div class="title">글제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">날짜</div>
                    <div class="count">조회수</div>
                </div>
                <div class="text">     
                    <div class="num">5</div>
                    <div class="title"><a href="View.jsp">일단 아무거나</a></div>
                    <div class="write">백씨</div>
                    <div class="date">2022.3.20</div>
                    <div class="count">33</div>
                    
                </div>
                <div class="text">
                    <div class="num">4</div>
                    <div class="title"><a href="View.jsp">일단 아무거나</a></div>
                    <div class="write">백씨</div>
                    <div class="date">2022.3.20</div>
                    <div class="count">33</div>
                </div>
                <div class="text">
                    <div class="num">3</div>
                       <div class="title"><a href="View.jsp">일단 아무거나</a></div>
                    <div class="write">백씨</div>
                    <div class="date">2022.3.20</div>
                    <div class="count">33</div>
                </div>
                <div class="text">
                    <div class="num">2</div>
                    <div class="title"><a href="View.jsp">일단 아무거나</a></div>
                    <div class="write">백씨</div>
                    <div class="date">2022.3.20</div>
                    <div class="count">33</div>
                </div>
                <div class="text">
                    <div class="num">1</div>
                    <div class="title"><a href="View.jsp">일단 아무거나</a></div>
                    <div class="write">백씨</div>
                    <div class="date">2022.3.20</div>
                    <div class="count">33</div>
                </div>
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
                
                
                
                
        
                