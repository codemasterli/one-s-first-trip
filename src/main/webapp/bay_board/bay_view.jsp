<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../login/sessionChk.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="../js/jquery.js"></script>
<link rel="stylesheet" href="/Project2/css/notice.css">

<script type="text/javascript">
	$(function() {
		$('.mytextarea').hide()
		$('.mybutton').click(function() {
			$('.mytextarea').toggle();
		});
	});
</script>
<title>글 내용</title>
</head>
<body>
	<%
	String path = request.getContextPath();
	session.getAttribute("id");
	session.getAttribute("name");
	%>
	<div class="intro_bg">
		<div class="header1">
			<div class="search_area">

				<input type="checkbox" id="icon"> <label for="icon">
					<span></span> <span></span> <span></span>
				</label>
				<div id="header">
					<ul>
						<li><a href="/Project2/main/main.do">◾메인</a></li>
						<br>
						<c:if test="${id != 'master' }">
							<li><a href="/Project2/mypage/mypage.do">◾마이페이지</a></li>
							<br>
						</c:if>
						<c:if test="${id == 'master' }">
							<li><a href="/Project2/manager/masterUpdate.do">◾회원관리</a></li>
							<br>
						</c:if>
						<li><a href="/Project2/notice/Notice.no">◾공지사항</a></li>
						<br>
						<li><a href="/Project2/board/View_BoardForm.wo">◾취미</a></li>
						<br>
						<li><a href="/Project2/sell_board/sell_notice.so">◾거래게시판</a></li>
					</ul>
				</div>
				<form action='/Project2/search/search.no' class="d-flex">
					<input type="text" required="required" name="search"
						autofocus="autofocus"> <a><input class="btnbtn"
						id="search" type="submit" value="검색"></a>
					<!-- <a onclick="document.getElementById('frm').submit();">검색</a> -->
				</form>
			</div>
			<!-- 로고 -->
			<a href="/Project2/main/loginmain.do"> <img alt=""
				src="/Project2/images/first.png"
				style="width: 100px; position: absolute; top: 10px; right: 900px;"></a>
			<div class="nav">

				<b><%=session.getAttribute("id")%>님 </b>&nbsp;
				<%-- <b>${member.name }님 </b>&nbsp; --%>
				<c:if test="${id != 'master' }">
					<a href="/Project2/mypage/mypage.do?">마이페이지</a>
					<%-- <a href="/Project2/login/updateForm.do?name=${member.name}">회원정보 수정</a> --%>
				</c:if>
				<c:if test="${id == 'master' }">
					<!-- <a href='/Project2/manager/m_mypage.do'>관리자페이지</a> -->
					<a href="/Project2/manager/masterUpdate.do?">회원관리</a>
				</c:if>
				<a href='/Project2/login/logout.do'>로그아웃</a>
			</div>
		</div>
	</div>
	<div class="board_wrap">
		<div class="board_title">
			<strong>등록한 내용입니다</strong>
			<p>수정 가능</p>
		</div>
		<div class="board_view_wrap">
			<div class="btd">
				<div class="del" style="margin-top: -60px;">
					<div class="eff-7"></div>
					<a
						href='/Project2/bay_board/bay_delete.bo?bay_notice_num=
						${board.bay_notice_num}&pageNum=${currentPage}'">삭제</a>
				</div>
			</div>
			<div class="board_view">

				<div class="title">${board.bay_notice_title}</div>

				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd>${board.bay_notice_num}</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>${board.id}</dd>
					</dl>
					<dl>
						<dt>날짜</dt>
						<dd>${board.bay_notice_reg_date}</dd>
					</dl>
					<dl>
						<dt>조회수</dt>
						<dd>${board.bay_notice_read_cnt }</dd>
					</dl>
					<dl>
						<dt>가격</dt>
						<dd>${board.bay_notice_price }</dd>
					</dl>
				</div>
				<img src="/Project2/imgBay/${board.thumbnail}"
					style="width: 80%; margin-top: 30px">
				<div class="cont">${board.bay_notice_content}</div>
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
									<button class="mybutton">수정</button>
									<button class="mybutton">댓글쓰기</button>
									<button class="love">좋아욧</button>
								</div>
								<textarea class="mytextarea" style="width: 80%; height: 50px"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="cont">
					<div class="bt_wrap">
						<textarea></textarea>
						<div class="back">
							<div class="button_base b03_skewed_slide_in">
								<div>
									<input class="box1" type="button" value="확인"
										onclick="location.href ='/Project2/bay_board/bay_notice.bo?bay_notice_num=${board.bay_notice_num }&pageNum=${currentPage}'">
								</div>
								<div></div>
								<div>
									<input class="box2" type="button" value="확인"
										onclick="location.href ='/Project2/bay_board/bay_notice.bo?bay_notice_num=${board.bay_notice_num }&pageNum=${currentPage}'">
								</div>
							</div>
							<div class="button_base b03_skewed_slide_in1">
								<div>
									<input class="box2" type="button" value="수정"
										onclick="location.href ='/Project2/bay_board/bay_EditAction.bo?bay_notice_num=${board.bay_notice_num }&pageNum=${currentPage}'">
								</div>
								<div></div>
								<div>
									<input class="box1" type="button" value="수정"
										onclick="location.href ='/Project2/bay_board/bay_EditAction.bo?bay_notice_num=${board.bay_notice_num }&pageNum=${currentPage}'">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
</body>
</html>