<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/login/sessionChk.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.btd {
	position: absolute;
	top: 270px;
	right: 458px;
}
</style>
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
			<p>수정쌉가능</p>
		</div>
		<div class="board_view_wrap">
			<div class="del" style="margin-top: -60px;">
				<div class="eff-7"></div>
				<a
					href="/Project2/notice/delete.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}">삭제</a>
			</div>
			<div class="board_view">
				<div class="title">${notice_board.notice_title}</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd>${notice_board.notice_num}</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>${notice_board.id}</dd>
					</dl>
					<dl>
						<dt>날짜</dt>
						<dd>${notice_board.notice_reg_date}</dd>
					</dl>
					<dl>
						<dt>조회수</dt>
						<dd>${notice_board.notice_read_cnt }</dd>
					</dl>
				</div>
				<div class="cont">${notice_board.notice_content }</div>

			</div>
			<div class="bt_wrap">
				<div class="bt_wrap">
					<c:if test="${id != 'master' }">
						<div class="back" style="position: absolute; left:900px">
								<div class="button_base b03_skewed_slide_in">
								<div>
									<input class="box1" type="button" value="확인"
										onclick="location.href ='/Project2/notice/Notice.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}'">
								</div>
								<div></div>
								<div>
									<input class="box2" type="button" value="확인"
										onclick="location.href ='/Project2/notice/Notice.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}'">
								</div>
							</div>
						</div>
						<!--    <a onclick="location.href='/Project2/main/loginmain.do'">메인</a> -->
					</c:if>
					<c:if test="${id == 'master' }">
						<div class="back">
							<div class="button_base b03_skewed_slide_in">
								<div>
									<input class="box1" type="button" value="확인"
										onclick="location.href ='/Project2/notice/Notice.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}'">
								</div>
								<div></div>
								<div>
									<input class="box2" type="button" value="확인"
										onclick="location.href ='/Project2/notice/Notice.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}'">
								</div>
							</div>
							<div class="button_base b03_skewed_slide_in1">
								<div>
									<input class="box2" type="button" value="수정"
										onclick="location.href ='/Project2/notice/edit.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}'">
								</div>
								<div></div>
								<div>
									<input class="box1" type="button" value="수정"
										onclick="location.href ='/Project2/notice/edit.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}'">
								</div>
							</div>
						</div>
					</c:if>
				</div>
				<%-- <c:if test="${id != 'master' }">
					<a href="/Project2/notice/Notice.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}" class="on">확인</a>
					</c:if> 
					<c:if test="${id == 'master' }">
					<a href="/Project2/notice/Notice.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}" class="on">확인</a>
					<a href="/Project2/notice/edit.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}">수정</a>
					</c:if>
				</div>
			</div> --%>

			</div>
</body>
</html>