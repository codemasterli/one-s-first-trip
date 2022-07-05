<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/login/sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
		rel="stylesheet">
	<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<link rel="stylesheet" href="/Project2/css/notice.css">
    <title>글 등록</title>

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
</script></head><body>

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
			 <form action="/Project2/notice/write.no" method="post" id="frm">
 			<input type="hidden" name="notice_num" value="${notice_num }"> <input
				type="hidden" name="id" value=${id }> <input type="hidden"
				name="pageNum" value="${pageNum }"> <input type="hidden"
				name="notice_reg_date" value="${notice_reg_date }"> 
				<input type="hidden" name="notice_read_cnt" value="${notice_read_cnt }">
    <div class="board_wrap">
        <div class="board_title">
            <strong>공지사항</strong>
            <p>글쓰기</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" name="notice_title" id="notice_title" placeholder="글 제목을 입력하세요"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea id="summernote" name="notice_content"></textarea>
                </div>
            <div class="bt_wrap">
                <a onclick="document.getElementById('frm').submit();" id="btn" class="on">등록</a>
                <a onclick=history.back()>취소</a>
            </div>
        </div>
    </div>
    </div>
    </form>
</body>
</html>
                
                 
                
                
        
                