<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/login/sessionChk.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>판매요청</title>
<link rel="stylesheet" href="/Project2/css/notice.css">
<style type="text/css">
.btnS {
	float: right;
	width: 200px;
	padding: 0;
	margin-bottom: 100;
	margin-top: -50px;
	height: 60px;
}
</style>
</head>
<body>
	<%
	String path = request.getContextPath();
	session.getAttribute("id");
	session.getAttribute("bay_notice_num");
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
			<strong>구매계시판</strong>
			<p>구매관련 글만 작서해주세요.</p>
			<div class="del">
				<div class="eff-7"></div>
				<a
					href="/Project2/sell_board/sell_notice.so?sell_notice_num=${sell_notice_board.sell_notice_num}&pageNum=${currentPage}"
					class="on">판매게시판으로</a>
			</div>
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
				<c:if test="${empty list }">
					<div class="text">계시글이 없습니다</div>
				</c:if>
				<c:if test="${not empty list }">
					<c:forEach var="bay_notice_board" items="${list }">
						<div class="text">
							<div class="num">${bay_notice_board.bay_notice_num}</div>
							<div class="title">
								<a
									href="/Project2/bay_board/bay_view.bo?bay_notice_num=${bay_notice_board.bay_notice_num}
								&pageNum=${currentPage}">${bay_notice_board.bay_notice_title}</a>
							</div>
							<div class="write">${bay_notice_board.id}</div>
							<div class="date">${bay_notice_board.bay_notice_reg_date}</div>
							<div class="count">${bay_notice_board.bay_notice_read_cnt }</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<div class="board_page">
				<c:if test="${currentPage !=0 }">
					<a
						onclick="locatio.href='/Project2/bay_board/bay_notice.bo?pageNum=${startPage }'"
						class="bt last"><<</a>
				</c:if>
				<c:if test="${startPage > PAGE_PER_BLOCK}">
					<a
						onclick="location.href='/Project2/bay_board/bay_notice.bo?pageNum=${startPage -1}'"
						class="bt prev"><</a>
				</c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<a
						onclick="location.href='/Project2/bay_board/bay_notice.bo?pageNum=${i}'"
						class="num on">${i}</a>
				</c:forEach>
				<c:if test="${endPage < totalPage}">
					<a
						onclick="location.href='/Project2/bay_board/bay_notice.bo?pageNum=${endPage + 1}'"
						class="bt last">></a>
				</c:if>
				<c:if test="${currentPage != 0 }">
					<a
						onclick="location.href='/Project2/bay_board/bay_notice.so?pageNum=${endPage }'"
						class="bt last">>></a>
				</c:if>
			</div>
			<div class="bt_wrap">
				<div class="back">
					<div class="button_base b03_skewed_slide_in">
						<div>
							<input class="box1" type="button" value="등록"
								onclick="location.href ='/Project2/bay_board/bay_write.bo'">
						</div>
						<div></div>
						<div>
							<input class="box2" type="button" value="등록"
								onclick="location.href ='/Project2/bay_board/bay_write.bo'">
						</div>
					</div>
					<div class="button_base b03_skewed_slide_in1">
						<div>
							<input class="box2" type="button" value="매인"
								onclick="location.href ='/Project2/main/loginmain.do'">
						</div>
						<div></div>
						<div>
							<input class="box1" type="button" value="매인"
								onclick="location.href ='/Project2/main/loginmain.do'">
						</div>
					</div>
				</div>
				<!--<a href="/Project2/bay_board/bay_write.bo" class="on">등록</a>
				<a href="/Project2/main/loginmain.do">매인</a> -->
			</div>
		</div>
	</div>
</body>
</html>





