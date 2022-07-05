<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="dao.*,model.*"%>
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
	function sub() {
		if ($("input[name=title]").val() == ""
			|| $("input[name=title]").val() == null) {
		alert("제목 입력란을 작성하세요");
		return false;
	} else if ($("input[type=file]").val() == ""
			|| $("input[type=file]").val() == null) {
		alert("썸네일 이미지를 선택하세요");
		return false;
	} else if ($(".note-editable").text() == ""
			|| $(".note-editable").text() == null) {
		alert("내용 입력란을 작성하세요");
		return false;
	}
    if ($("#selbox").val() == "direct") {
    	if (!frm.hb_tag2.value) {
    		alert("데이터를 직접 입력하세요");
    		frm.hb_tag2.focus();
    		return false;
    	} else {
    		frm.hb_tag[frm.hb_tag.selectedIndex].value = frm.hb_tag2.value;
    	}	    		
    }
		frm.submit();
	}
	$(document).ready(function() {
		// content 입력 폼
		$('#summernote').summernote({
			height : 400, // 에디터 높이
			minHeight : 400, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
		}); 
		  //직접입력 인풋박스 기존에는 숨어있다가
		$("#selboxDirect").hide();
		$("#selbox").change(function() {
	                //직접입력을 누를 때 나타남
			if($("#selbox").val() == "direct") {
				$("#selboxDirect").show();
			}  else {
				$("#selboxDirect").hide();
			}
		});
	});
</script>
</head>
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
	<!-- 필요한 정보 : 아이디 / 제목 / 썸네일 / 내용 -->
	<form enctype="multipart/form-data" method="post" id="frm"
		action="View_BoardResult.wo">
		<!-- 게시글 번호 -->
		<input type="hidden" name="review_num" value="${review_num }">
		<!-- 아이디 -->
		<input type="hidden" name="id" value="${id }">
		<!-- 작성 날짜 -->
		<input type="hidden" name="review_reg_date"
			value="${review_reg_date }">
		<!-- 상단 버튼 -->
		<div class="board_wrap">
			<div class="board_title" style="">
				<strong>글쓰기</strong> <br> <br>
				<p>재밌는 내용을쓰자</p>
			</div>
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<div class="column">
							<input type="text" id="selboxDirect" name="hb_tag2"
								style="float: right; width: 160px; height: 30px; margin-left: 20px;" />
							<!-- 썸네일 이미지 -->
							<label for="f1" class="btn_stroke file_label"
								style="font-weight: bold; font-size: 1.4rem;">썸네일 이미지</label> <input
								type="file" id="f1" name="thumbnail" style="margin-left: 20px;">
							<!-- 취미 태그 선택 -->
							<select id="selbox" class="selbox" name="hb_tag">
								<option value="">선택하세요</option>
								<c:forEach var="str" items="${hb_tag_list }">
									<option value="${str }">${str }</option>
								</c:forEach>
								<option value="direct">직접입력</option>
							</select>
						</div>
						<dl class="title_min">
							<!-- 제목 -->
							<dt>제목</dt>
							<dd>
								<input type="text" name="title" id="notice_title"
									placeholder="글 제목을 입력하세요">
							</dd>
						</dl>
					</div>
					<div class="cont">
						<!-- 내용 작성 -->
						<textarea id="summernote" name="content" class="clear"></textarea>
					</div>
					<!-- 하단 버튼 영역 -->
					<div class="bt_wrap">
						<a onclick="sub()" id="btn" class="on">등록</a> <a
							onclick=history.back()>취소</a>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>