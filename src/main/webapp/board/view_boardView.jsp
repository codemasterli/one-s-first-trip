<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../login/sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* 등록하기버튼 */
/*  .btn3 {  
	position: absolute;
	top: 450px;
	right:580px;
}  */
/* 수정버튼 */
/* .asd{
   position: absolute;
	top: 550px;
	right: 450px;
} */
/* 삭제 */
.rwq {
	position: absolute;
	top: 180px;
	right: 460px;
</style>
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script type="text/javascript" src="../js/jquery.js"></script>
<link rel="stylesheet" href="/Project2/css/notice.css">
</head>
<body>
	<%
	String path = request.getContextPath();
	session.getAttribute("id");
	session.getAttribute("name");
	%>
	<script type="text/javascript">
$(document).ready(function () {
	// 수정 폼 hide
	 $(".update_form").css("display", "none"); 
	$(".update_hide").css("display", "none");
	// 댓글 수정 폼 show
	$(".update_view").click(
			function() {
				$(this).parents(".replay").find(".updat").css(
						"display", "block");
				/* $(this).parents(".replay").find(".text_title").css(
						"display", "none"); */
				$(this).css("display", "none");
				$(this).siblings().css("display", "block");	
				
			});
	/* $(".update_frm_hide").click(
		history.back();
				
			}); */
	// 댓글 수정 폼 hide
/* 	$(".update_hide").click(
			function() {
				$(this).parents(".replay").find(".updat").css(
						"display", "none");
				$(this).parents(".replay").find(".text_title").css(
						"display", "block");
				$(this).css("display", "none");

				$(this).siblings().css("display", "block");	
			}); */
	
});
function update() {
	alert("댓글이 수정되었습니다.");
}

function del() {
	var con = confirm("정말로 삭제하시겠습니까?")
	if (con) {
		alert("삭제되었습니다.")
		return
	} else
		alert("삭제가 취소되었습니다.")
		return false
}
//답글 폼에서 취소 버튼 클릭(답글 폼 hide)
$(".update_frm_hide").click(function() {
	$(this).parents(".asd").css("display", "none");
});
function chk(re_no,review_num,content) {
	$('#div_'+re_no).text('');
	$('#up_'+re_no).html('<form action="/Project2/reply/replyUpdate.ro" method="post" class="update_form">'+
		'<input type="hidden" name="re_no" value="'+re_no+
		'"> <input type="hidden" name="review_num" value="'+review_num+
		'">	<pre><textarea name="content" required style="width: 80%; height: 50px" rows="5" cols="40">'+content+'</textarea></pre>'+
		'<div class="asd"><input type="submit" class="btn btn_small" value="수정">'+
		'<button class="update_frm_hide">취소</button></div></form>');
}
function del2(re_no,review_num,id) {
	var con = confirm("정말로 삭제하시겠습니까?")
	if (con) {
		alert("삭제되었습니다.")
		location.href="/Project2/reply/replyDelete.ro?ro_no=${reply.ro_no}&review_num=${board.review_num}&id=${id}"
	} else
		alert("삭제가 취소되었습니다.")
		return false
}
</script>
		<div class="intro_bg">
			<div class="header1">
				<div class="search_area">

					<input type="checkbox" id="icon"> <label for="icon">
						<span></span> <span></span> <span></span>
					</label>
					<div id="header">
						<ul>
							<li><a href="/Project2/main/main.do">◾메인</a></li><br>
							<c:if test="${id != 'master' }">
							<li><a href="/Project2/mypage/mypage.do">◾마이페이지</a></li><br>
							</c:if>
							<c:if test="${id == 'master' }">
							<li><a href="/Project2/manager/masterUpdate.do">◾회원관리</a></li><br>
							</c:if>
							<li><a href="/Project2/notice/Notice.no">◾공지사항</a></li><br>
							<li><a href="/Project2/board/View_BoardForm.wo">◾취미</a></li><br>
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
		<a href="/Project2/main/loginmain.do">
		<img alt="" src="/Project2/images/first.png" style="width: 100px;position: absolute;top: 10px;  right: 900px;"></a>
						<div class="nav">
					
					 <b><%=session.getAttribute("id") %>님 </b>&nbsp;
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
			<div class="del" style="margin-top: -60px;">
    			<div class="eff-7"></div>
					<a	onclick="location.href='/Project2/board/boardDelete.wo?review_num=${board.review_num}&pageNum=${currentPage}'">삭제</a>
				</div>
			<div class="board_view">
				<div class="title">${board.review_title}</div>
				<div class="info">
					<dl>
						<dt>번호</dt>
						<dd>${board.review_num}</dd>
					</dl>
					<dl>
						<dt>글쓴이</dt>
						<dd>${board.id}</dd>
					</dl>
					<dl>
						<dt>날짜</dt>
						<dd>${board.review_reg_date}</dd>
					</dl>
					<dl>
						<dt>조회수</dt>
						<dd>${board.review_read_cnt }</dd>
					</dl>
				</div>
				<img alt="" src="/Project2/upload/${board.thumbnail}"
					style="width: 80%; margin-top: 30px">
				<div class="cont">${board.review_content }</div>				
					
			</div>
		</div>
		<br>
		<h2>댓글 창</h2>
		<div class="replay">
			<form action="/Project2/reply/replyWrite.ro" >
				<input type="hidden" name="review_num" value="${board.review_num}">
				<input type="hidden" name="re_no" value="0"> <input
					type="hidden" name="ref" value="0"> <input type="hidden"
					name="ref_level" value="0"> <input type="hidden"
					name="ref_step" value="0">
				<textarea class="mytextarea" name="content" id="content"
					style="width: 80%; height: 50px" rows="5" cols="40"
					name="review_reply" required="required"></textarea>
				<div class="submit_box">
						 	<input type="submit" class="btn3" value="등록하기" style="width: 130px; height: 40px; ">
							<!-- <a onclick="document.getElementById('frm').submit();" id="btn3">등록</a> -->			
				</div>
			</form>
			<c:forEach var="reply" items="${list}">
				<div class="reply_update">
					<div class="board_list_wrap">
						<div class="board_list">
							<div class="text">
								<div class="num">${reply.id}</div>
								<div class="title" style="width: 90%;">
									<div class="text_id"></div>
									<div class="text_title" id="div_${reply.re_no}">${reply.content}</div>
									<div id="up_${reply.re_no }"></div>
									<div class="text_row">
										${reply.reg_date}
										<c:if test="${reply.id == id}">
											<div class="text_icon">
												<button class="update_view"
													onclick="chk(${reply.re_no},${board.review_num},'${reply.content}')">수정</button>
												<!-- <button class="update_hide">수정취소</button> -->
												<form action="/Project2/reply/replyDelete.ro">
													<input type="hidden" name="re_no" value="${reply.re_no}">
													<input type="hidden" name="review_num"
														value="${board.review_num}"> <input type="hidden"
														name="id" value="${id}">
													<button type="submit" class="btnsty" value="삭제">삭제</button>

												</form>
											</div>
										</c:if>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<div id="updat"></div>
		</div>	
		<div class="bt_wrap">
			<div class="back" 	style="margin-right:300px;" >
					<div class="button_base b03_skewed_slide_in">
						<div>
							<input class="box1" type="button" value="확인"
								onclick="location.href ='/Project2/board/View_BoardForm.wo?review_num=${board.review_num}&pageNum=${currentPage}'">
						</div>
							<div></div>
						<div>
							<input class="box2" type="button" value="확인"
								onclick="location.href ='/Project2/board/View_BoardForm.wo?review_num=${board.review_num}&pageNum=${currentPage}'">
						</div>
					</div>
					<div class="button_base b03_skewed_slide_in1">
						<div>
							<input class="box2" type="button" value="수정"
								onclick="location.href ='/Project2/board/View_BoardUpdateForm.wo?review_num=${board.review_num}&pageNum=${currentPage}'">
						</div>
						<div></div>
						<div>
							<input class="box1" type="button" value="수정"
								onclick="location.href ='/Project2/board/View_BoardUpdateForm.wo?review_num=${board.review_num}&pageNum=${currentPage}'">
						</div>
					</div>
				
			</div>
		</div>
	</body>
</html>
			<%-- <a	href="/Project2/board/View_BoardForm.wo?review_num=${board.review_num}&pageNum=${currentPage}"
					class="on">확인</a> 

				<a href="/Project2/board/View_BoardUpdateForm.wo?review_num=${board.review_num}&pageNum=${currentPage}">수정</a>--%>
	

	<!-- <div class="board_page">
										<a href="#" class="bt first"><<</a> <a href="#"
											class="bt prev"><</a> <a href="#" class="num on">1</a> <a
											href="#" class="num">2</a> <a href="#" class="num">3</a> <a
											href="#" class="num">4</a> <a href="#" class="num">5</a> <a
											href="#" class="bt naxt">></a> <a href="#" class="bt last">>></a>
									</div> -->
	<!-- 	<div class="cont">
										<div class="bt_wrap"> 
										 <textarea></textarea> 
											 <a href="Notice.jsp" class="on">등록</a>										
										</div>
									</div>
									
							</div> -->



