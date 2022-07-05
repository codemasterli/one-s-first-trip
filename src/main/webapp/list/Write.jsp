<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../login/sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
		rel="stylesheet">
	<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
	<link rel="stylesheet" href="notice.css">
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
					<form>
						<input type="checkbox" id="icon"> 
						<label for="icon">
							<span></span> 
							<span></span> 
							<span></span>
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
						<a href="../login/LoginForm.jsp">login</a>
						<a href="../login/JoinForm.jsp">회원가입</a>
					</div>
				</div>
			</div>
    <div class="board_wrap">
        <div class="board_title">
            <strong>글쓰기</strong>
            <p>재밌는 내용을쓰자</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="글 제목을 입력하세요"></dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea id="summernote"></textarea>
                </div>
            <div class="bt_wrap">
                <a href="View.jsp" class="on">등록</a>
                <a href="Notice.jsp">취소</a>
            </div>
        </div>
    </div>
</body>
</html>
                
                 
                
                
        
                