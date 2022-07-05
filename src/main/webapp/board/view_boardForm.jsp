<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*,model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시판 목록</title>
<link rel="stylesheet" href="/Project2/css/notice.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#board_list1').css("display", "block");
	});
	function filterChange() {
		var filter = document.getElementById("filter");
		var value = filter.options[filter.selectedIndex].value;
		location.href="View_BoardFormTag.wo?review_hb_tag="+value;
	}
</script>
</head>
<body>
	<%
	String path = request.getContextPath();
	session.getAttribute("id");
	session.getAttribute("review_num");
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
	<!-- 게시판 메인 시작 -->
	<div class="board_wrap">
		<div class="board_title">
			<strong>취미 게시판</strong>
			<p>취미와 무관한 이야기는 안되요 !!</p>
			<select id="filter" onchange="filterChange()" name="review_hb_tag"
				class="selbox">
				<option>선택하세요</option>
				<!-- 취미 별 선택 -->
				<c:forEach var="str" items="${hb_tag_list }">
					<option value="${str }">${str }</option>
				</c:forEach>
			</select>
		</div>
		<div class="board_list_wrap">
			<!-- 축구 -->
			<div class="board_list">
				<!-- 게시판 헤드 -->
				<div class="top">
					<div class="num">번호</div>
					<div class="title">글제목</div>
					<div class="writer">글쓴이</div>
					<div class="date">날짜</div>
					<div class="count">조회수</div>
				</div>
				<!-- 게시물이 없을 경우 -->
				<c:if test="${empty list }">
					<div class="text">게시글이 없습니다</div>
				</c:if>
				<!-- 게시물이 있을 경우 -->
				<!-- 현재 게시물 정리 순서는 최신순 정렬 -->
				<c:if test="${not empty list}">
					<c:forEach var="review_board" items="${list }">
						<div class="text">
							<div class="num">${review_board.review_num}</div>
							<div class="title">
								<a
									href="View_boardView.wo?review_num=${review_board.review_num }">${review_board.review_title}</a>
							</div>
							<div class="write">${review_board.id}</div>
							<div class="date">${review_board.review_reg_date}</div>
							<div class="count">${review_board.review_read_cnt }</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<!-- 페이징 파트 -->
			<div class="board_page">
				<!-- 첫 페이지 이동 -->
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<a class="bt first"
						onclick="location.href='View_BoardForm.wo?pageNum=${pageNum = 1}'"><<</a>
				</c:if>
				<!-- 페이지 블록 넘기기 ( 이전 ) -->
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<a
						onclick="location.href='View_BoardForm.wo?pageNum=${startPage -1}'"
						class="bt prev"><</a>
				</c:if>
				<!-- 페이지 블록 5개 표시 -->
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a onclick="location.href='View_BoardForm.wo?pageNum=${i}'">${i}</a>
				</c:forEach>
				<!-- 페이지 블록 넘기기 ( 다음 ) -->
				<c:if test="${endPage < totalPage}">
					<a
						onclick="location.href='View_BoardForm.wo?pageNum=${endPage + 1}'"
						class="bt naxt">></a>
				</c:if>
				<!-- 마지막 페이지 이동 -->
				<c:if test="${endPage < totalPage}">
					<a onclick="location.href='View_BoardForm.wo?pageNum=${totalPage}'"
						class="bt last">>></a>
				</c:if>
			</div>
			<div class="bt_wrap">
				<div class="bt_wrap">		
					<div class="back">
						<div class="button_base b03_skewed_slide_in"  >
							<div>
								<input class="box1" type="button" value="등록" onclick="location.href ='/Project2/board/View_BoardWriteForm.wo'">
							</div>
							<div></div>
							<div>
								<input class="box2"  type="button"  value="등록" onclick="location.href ='/Project2/board/View_BoardWriteForm.wo'">
							</div>
						</div>
						<div class="button_base b03_skewed_slide_in1" >
							<div>
								<input class="box2"  type="button"  value="매인" onclick="location.href ='/Project2/main/loginmain.do'">
							</div>
							<div></div>
							<div>
								<input class="box1"  type="button"  value="매인" onclick="location.href='/Project2/main/loginmain.do'">
							</div>
						</div>
				</div>
				<!-- 	<a href="/Project2/board/View_BoardWriteForm.wo" class="on">등록</a> <a
					href="/Project2/main/loginmain.do">메인</a> -->
			</div>
		</div>
	</div>
</body>
</html>