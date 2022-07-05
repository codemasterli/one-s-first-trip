<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/login/sessionChk.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항</title>
<link rel="stylesheet" href="/Project2/css/notice.css">
<script type="text/javascript" src="/Project2/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#board_list1').css("display", "block");
	});
	function filterChange() {
		var filter = document.getElementById("filter");
		var value = filter.options[filter.selectedIndex].value;
		$('.board_list').css("display", "none");
		$('#board_list' + value).css("display", "block");
	}
</script>
</head>
<body>
	<%
	String path = request.getContextPath();
	session.getAttribute("id");
	session.getAttribute("notice_num");
	%>
	<div class="intro_bg">
		<div class="header1">
			<div class="search_area">
				<form>
					<input type="checkbox" id="icon"> <label for="icon">
						<span></span> <span></span> <span></span>
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
				<b><%=session.getAttribute("id")%>님 </b>&nbsp;
				<c:if test="${id != 'master' }">

					<a href="/Project2/mypage/mypage.do">마이페이지</a>
					<a href="/Project2/login/updateForm.do">회원정보 수정</a>
				</c:if>
				<c:if test="${id == 'master' }">

					<!-- <a href='/Project2/manager/m_mypage.do'>관리자페이지</a> -->
					<a href="/Project2/manager/masterUpdate.do">회원관리</a>
				</c:if>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='/Project2/login/logout.do'>로그아웃</a>
			</div>
		</div>
	</div>
	<select id="filter" onchange="filterChange()">
		<option value="1">공지사항</option>
		<option value="2">리뷰게시판</option>
		<option value="3">인기순</option>
	</select>
	<!-- 공지사항 -->
	<div class="board_wrap">
		<div class="board_list_wrap">
			<div class="board_title">
				<strong>공지사항</strong>
				<p>읽기 전용 게시판 입니다.</p>
			</div>
			<!-- 공지사항 -->
			<div class="board_list" id="board_list1">
				<div class="top">
					<div class="num">번호</div>
					<div class="title">글제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">날짜</div>
					<div class="count">조회수</div>
				</div>
				<c:if test="${empty listSearch }">
					<div class="text">게시글이 없습니다</div>
				</c:if>
				<c:if test="${not empty listSearch }">
					<c:forEach var="notice_board" items="${listSearch }">
						<div class="text">
							<div class="num">${notice_board.notice_num}</div>
							<div class="title">
								<a
									href="/Project2/notice/view.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}">${notice_board.notice_title}</a>
							</div>
							<div class="write">${notice_board.id}</div>
							<div class="date">${notice_board.notice_reg_date}</div>
							<div class="count">${notice_board.notice_read_cnt }</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<!-- 취미 -->
			<div class="board_list" id="board_list2">
				<div class="top">
					<div class="num">번호</div>
					<div class="title">글제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">날짜</div>
					<div class="count">조회수</div>
				</div>
				<c:if test="${empty listSearch2 }">
					<div class="text">게시글이 없습니다</div>
				</c:if>
				<c:if test="${not empty listSearch2 }">
					<c:forEach var="review_board" items="${listSearch2 }">
						<div class="text">
							<div class="num">${review_board.review_num}</div>
							<div class="title">
								<a
									href="/Project2/board/View_boardView.wo?review_num=${review_board.review_num}&pageNum=${currentPage}">${review_board.review_title}</a>
							</div>
							<div class="write">${review_board.id}</div>
							<div class="date">${review_board.review_reg_date}</div>
							<div class="count">${review_board.review_read_cnt }</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<!-- 페이징 -->
			<div class="board_page">
				<c:if test="${currentPage != 0 }">
					<a
						onclick="location.href='/Project2/notice/Notice.no?pageNum=${startPage }'"
						class="bt last"><<</a>
				</c:if>
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<a
						onclick="location.href='/Project2/notice/Notice.no?pageNum=${startPage -1}'"
						class="bt prev"><</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a
						onclick="location.href='/Project2/notice/Notice.no?pageNum=${i}'"
						class="num on">${i}</a>
				</c:forEach>
				<%-- <c:if test="${endPage - totalPage < 0 }">
				<button onclick="location.href='/Project2/notice/Notice.no?pageNum=${endPage+1}'" class="bt naxt">></button>
				</c:if> --%>
				<c:if test="${endPage < totalPage}">
					<a
						onclick="location.href='/Project2/notice/Notice.no?pageNum=${endPage + 1}'"
						class="bt last">></a>
				</c:if>
				<c:if test="${currentPage != 0 }">
					<a
						onclick="location.href='/Project2/notice/Notice.no?pageNum=${endPage }'"
						class="bt last">>></a>
				</c:if>
			</div>
			<div class="bt_wrap">
				<c:if test="${id != 'master' }">
				</c:if>
				<c:if test="${id == 'master' }">
					<div>
						<a
							onclick="location.href='/Project2/notice/WriteForm.no?action=insert'"
							class="on">등록</a> <a
							onclick="location.href='/Project2/main/loginmain.do'">메인</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>





