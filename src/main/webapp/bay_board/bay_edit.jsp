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
<title>게시판 작성</title>
<link rel="stylesheet" href="/Project2/css/notice.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<link rel="stylesheet" href="../summernote/summernote-lite.css">
<script src="../summernote/summernote-lite.js"></script>
<script src="../summernote/lang/summernote-ko-KR.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      // textarea
      $('#summernote').summernote({
         height : 400, // 에디터 높이
         minHeight : 400, // 최소 높이
         maxHeight : null, // 최대 높이
         focus : true, // 에디터 로딩후 포커스를 맞출지 여부
         lang : "ko-KR", // 한글 설정
         placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
      });
      // input type file 파일명 변경 설정
      $("#f1").on('change', function() {
         var fileName = $(this).val();
         var realFileName = fileName.split("\\");
         $(".file_label").text(realFileName[2]);
      });
   });
</script>
<script type="text/javascript">
	function insertChk() {
		if ($("input[name=sell_notice_title]").val() == ""
				|| $("input[name=sell_notice_title]").val() == null) {		
	alert("제목 입력란을 작성하세요");
			return false;
		} else if ($("input[name=sell_notice_price]").val() == ""
				|| $("input[name=sell_notice_price]").val() == null) {
			alert("가격 입력란을 작성하세요");
			return false;
		} else if ($(".note-editable").text() == ""
				|| $(".note-editable").text() == null) {
			alert("내용 입력란을 작성하세요");
			return false;
		} else if ($("input[type=file]").val() == ""
			|| $("input[type=file]").val() == null) {
		alert("썸네일 이미지를 선택하세요");
		return false;
		}
	}
</script>
<body>
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
	<form enctype="multipart/form-data" method="post" id="frm"
		action="bay_EditResult.bo?bay_notice_num=${board.bay_notice_num }&pageNum=${currentPage}"
		onsubmit="return insertChk()">
		<!-- 게시글 번호 -->
		<input type="hidden" name="bay_notice_num" value="${bay_notice_num }">
		<!-- 아이디 -->
		<input type="hidden" name="id" value="${id }">
		<!-- 작성 날짜 -->
		<input type="hidden" name="bay_notice_reg_date"
			value="${bay_notice_reg_date }">
		<div class="board_wrap">
			<div class="board_title">
				<strong>수정</strong>
				<p>내용을 김수정 할수 있습니다</p>
			</div>
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="column">
						<label for="f1" class="btn_stroke file_label">썸네일 이미지 업로드</label>
						<input type="file" id="f1" name="thumbnail">
					</div>
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" name="bay_notice_title" id="bay_notice_title"
									placeholder="글 제목을 입력하세요">
							</dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>판매금액</dt>
							<dd>
								<input type="text" name="bay_notice_price" id="bay_notice_price"
									placeholder="판매금액을 재시해주세요">
							</dd>
						</dl>
					</div>
					<!--<div class="summernote"> -->
					<textarea id="summernote" name="bay_notice_content" class="clear"></textarea>
					<!-- </div>     -->
					<div class="bt_wrap">
						<div class="back">
							<div class="button_base b03_skewed_slide_in">
								<div>
									<input class="box1" type="button" value="등록"
										onclick="document.getElementById('frm').submit();" id="btn">
								</div>
								<div></div>
								<div>
									<input class="box2" type="button" value="등록"
										onclick="document.getElementById('frm').submit();" id="btn">
								</div>
							</div>
							<div class="button_base b03_skewed_slide_in1">
								<div>
									<input class="box2" type="button" value="취소"
										onclick=history.back()>
								</div>
								<div></div>
								<div>
									<input class="box1" type="button" value="취소"
										onclick=history.back()>
								</div>
							</div>
						</div>
						<!-- 	<a onclick="document.getElementById('frm').submit();" id="btn"
							class="on">등록</a> <a onclick=history.back()>취소</a> -->
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
