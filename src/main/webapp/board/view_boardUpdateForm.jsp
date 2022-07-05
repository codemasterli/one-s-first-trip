<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/login/sessionChk.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" href="/Project2/css/notice.css">
</head>
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
	<div class="board_wrap">
		<div class="board_title" style="margin-bottom: -50px;">
			<strong>게시판 수정</strong>
			<p>내용을 수정 할 수 있습니다.</p>
		</div>
	</div>
	<form
		action="/Project2/board/View_BoardUpdate.wo?review_num=${review_board.review_num}&pageNum=${currentPage}"
		method="post" id="frm" enctype="multipart/form-data">
		<!-- 게시글 번호 -->
		<input type="hidden" name="review_num"
			value="${review_board.review_num }">
		<!-- 아이디 -->
		<input type="hidden" name="id" value=${id }>
		<!-- 페이지 번호 -->
		<input type="hidden" name="pageNum" value="${pageNum }">
		<!-- 취미 태그 -->
		<input type="hidden" name="review_hb_tag" value="${review_hb_tag }">

		<div class="board_wrap">
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<div class="column">
							<label for="f1" class="btn_stroke file_label">썸네일 이미지 업로드</label>
							<input type="file" id="f1" name="thumbnail">${review_board.thumbnail }
						</div>
						<dl class="title_min">
							<dt>제목</dt>
							<dd>
								<input type="text" name="review_title" id="notice_title"
									placeholder="글제목을 입력하세요" value="${review_board.review_title}">
							</dd>
						</dl>
					</div>
					<!-- 내용 작성 -->
					<textarea id="summernote" name="review_content">${review_board.review_content }</textarea>
					<!-- 하단 버튼 -->
					<div class="bt_wrap">
					<div class="back">
						<div class="button_base b03_skewed_slide_in"  >
							<div>
								<input class="box1" type="button" value="수정" onclick="document.getElementById('frm').submit();" id="btn">
							</div>
							<div></div>
							<div>
								<input class="box2"  type="button"  value="수정" onclick="document.getElementById('frm').submit();" id="btn">
							</div>
						</div>
						<div class="button_base b03_skewed_slide_in1" >
							<div>
								<input class="box2"  type="button"  value="취소" onclick=history.back()>
							</div>
							<div></div>
							<div>
								<input class="box1"  type="button"  value="취소" onclick=history.back()>
							</div>
						</div>
					</div>
					<!-- 	<a onclick="document.getElementById('frm').submit();" id="btn"
							class="on">수정</a> <a onclick=history.back()>취소</a> -->
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
