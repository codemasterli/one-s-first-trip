<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/login/sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<style type="text/css">
@import url("/Project2/css/main.css");
</style>
<style type="text/css">
#chat {
	position: absolute;
	width: 40px;
	top: 800px;
	right: 170px;
	padding: 0;
	margin: 0;
	z-index: 1000;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {

				var topHeight = parseInt($("#chat").css("top").substring(0,
						$("#chat").css("top").indexOf("px")));

				$(window).scroll(function() {
					offset = topHeight + $(document).scrollTop() + "px";
					$("#chat").animate({
						top : offset
					}, {
						duration : 0,
						queue : false
					});
				});

			});
</script>
</head>
<body>
	<%
	String path = request.getContextPath();
	session.getAttribute("id");
	session.getAttribute("name");
	%>
	<div class="wrap">
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

					<%-- <b><%=session.getAttribute("name") %>님 </b>&nbsp; --%>
					<b>${member.name }님 </b>&nbsp;
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
		<div class="slide">
			<ul class="slide_list">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		<div class="gnb_meun" style="margin-top: 67px;">
			<ul>
				<li class="gnd_meun_list"><a
					href="/Project2/notice/Notice.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}&name=${member.name}">공지사항</a>
					<div></div></li>
			</ul>
			<ul>
				<li class="gnd_meun_list"><a
					href="/Project2/board/View_BoardForm.wo?name=${member.name}">취미</a>
					<div>
						<%-- 	<ul>
							<li><a
								href="/Project2/board/View_BoardForm.wo?name=${member.name}">축구</a></li>
							<li><a href="#">야구</a></li>
							<li><a href="#">족구</a></li>
							<li><a href="#">당구</a></li>
						</ul> --%>
					</div></li>
			</ul>
			<ul>
				<li class="gnd_meun_list"><a href="#">거래</a>
					<div>
						<ul>
							<li><a
								href="/Project2/sell_board/sell_notice.so?sell_notice_num=${sell_notice_board.sell_notice_num}&pageNum=${currentPage}">판매</a></li>
							<li><a href="#">구매</a></li>
				
						</ul>
					</div></li>
			</ul>
		</div>


		<div>
			<h1 class="bestweek">주간 베스트 🔥</h1>
		</div>

		<a href="/Project2/board/View_BoardForm.wo?name=${member.name}"
			class="boardclick"><h4>전체보기</h4></a>

		<!-- nev bar -->
		<!-- 게시물이 없을 경우 -->
		<c:if test="${empty list }">
			<div class="border_list">
				<div class="text">게시글이 없습니다</div>
			</div>
		</c:if>
		<!-- 게시물이 있을 경우 -->
		<!-- 현재 게시물 정리 순서는 최신순 정렬 -->
		<c:if test="${not empty list }">
			<c:forEach var="review_board" items="${list }">
				<div class="border_list">
					<div class="left">
						<div class="border_list_img" style="margin: auto;">
							<img class="thumbnail" alt=""
								src="/Project2/upload/${review_board.thumbnail}"
								style="width: 100%; height: 500px; display: block; margin: auto; overflow: hidden;">
						</div>
					</div>
					<div class="right">
						<div class="hotpro"
							style="display: flex; margin-top: 50px; margin-left: 50px;">
							<img alt="" src="/Project2/images/man2.png" style="width: 50px">
							<div class="hotname">
								<h5>${id }</h5>
								<p>${review_board.review_reg_date }</p>
							</div>
						</div>
						<h5 style="font-size: xx-large; margin-left: 50px;">${review_board.review_title}</h5>
						<div class="right_text"
							style="align-content: center; overflow: hidden; padding-top: 20px; margin-left: 50px; height: 55%; padding-right: 50px;">${review_board.review_content }</div>
						<br>
						<hr>
						<div class="right_icon" style="margin-left: 40px;">
							<p>조회수 : ${review_board.review_read_cnt }회</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<div id="chat">
			<a href="../index.jsp"> <img alt=""
				src="/Project2/images/talk.png"></a>
		</div>

	</div>

</body>
</html>