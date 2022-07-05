<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../login/sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="../js/jquery.js"></script>
<link rel="stylesheet" href="/Project2/css/notice.css">
<script type="text/javascript">
$(function() { 	
	$('.mytextarea').hide()
	$('.mybutton').click(function () {
		$('.mytextarea').toggle();
	});
});
</script>
<title>글 내용</title>
</head>
<body>
	<form action="view.do" name="form" method="post">
		<div class="intro_bg">
			<div class="header1">
				<div class="search_area">
					<input type="checkbox" id="icon"> <label for="icon">
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
				</div>
				<div class="nav">
					<a href="../login/LoginForm.jsp">login</a> <a
						href="../login/JoinForm.jsp">회원가입</a>
				</div>
			</div>
		</div>
		<div class="board_wrap">
			<div class="board_title">
				<strong>등록한 내용입니다</strong>
				<p>수정쌉가능</p>
			</div>
			<div class="board_view_wrap">
				<div class="board_view">
					<div class="title">글을 수정할수 있습니다</div>
					<div class="info">
						<dl>
							<dt>번호</dt>
							<dd>1</dd>
						</dl>
						<dl>
							<dt>글쓴이</dt>
							<dd>백씨</dd>
						</dl>
						<dl>
							<dt>날짜</dt>
							<dd>2022.03.20</dd>
						</dl>
						<dl>
							<dt>조회수</dt>
							<dd>33</dd>
						</dl>
					</div>
					<div class="cont">
						글내용이 들어갑니다<br> 글내용이 들어갑니다<br> 글내용이 들어갑니다<br> 글내용이
						들어갑니다<br> 글내용이 들어갑니다<br> 글내용이 들어갑니다<br> 글내용이 들어갑니다<br>
						글내용이 들어갑니다<br> 글내용이 들어갑니다<br> 글내용이 들어갑니다
					</div>
				</div>
				<div class="bt_wrap">
					<a href="Notice.jsp" class="on">확인</a> 
					<a href="Edit.jsp">수정</a>
				</div>
			</div>
			<div class="replay">
				<h2>댓글 창</h2>
				<div class="board_list_wrap">
					<div class="board_list">
						<div class="text">
							<div class="num">6</div>
							<div class="title" style="width: 90%;">
								<div class="text_id">
									<a>너의 이름은</a>
								</div>
								<div class="text_title">이것은 제목입니다</div>
								<div class="text_row">
									2022/4/16
									<div class="text_icon">								
										<button  class="mybutton">수정</button>
										<button  class="mybutton">댓글쓰기</button>
										<button  class="love">좋아욧</button>
									</div>
								<textarea class="mytextarea" 
								style="width: 80%; height: 50px" ></textarea>
								</div>
							</div>
						</div>

									</div>
									<div class="board_page">
										<a href="#" class="bt first"><<</a> <a href="#"
											class="bt prev"><</a> <a href="#" class="num on">1</a> <a
											href="#" class="num">2</a> <a href="#" class="num">3</a> <a
											href="#" class="num">4</a> <a href="#" class="num">5</a> <a
											href="#" class="bt naxt">></a> <a href="#" class="bt last">>></a>
									</div>
									<div class="cont">
										<div class="bt_wrap">
										<textarea></textarea>
											<a href="Notice.jsp" class="on">등록</a>											
										</div>
									</div>
							</div>
						</div>
					</div>

	</form>
</body>
</html>