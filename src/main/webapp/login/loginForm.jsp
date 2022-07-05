<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"	crossorigin="anonymous"></script>
<link rel="stylesheet" href="/Project2/css/loginForm.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

</script>
</head><body>
<form action="/Project2/login/login.do" method="post" name="frm" >
	<div class="wrap">
		<div class="login">
			<h2>로그인</h2>
			<div class="login_sns">
				<li><a href=""><i class="fab fa-instagram"></i></a></li>
				<li><a href=""><i class="fab fa-facebook-f"></i></a></li>
				<li><a href=""><i class="fab fa-twitter"></i></a></li>
			</div>
			<div class="login_id">
				<h4>ID</h4>
				<input type="text" name="id" id="id" placeholder="ID"
					 autofocus="autofocus">
			</div>
			<div class="login_pw">
				<h4>Password</h4>
				<input type="password" name="password" id="password" placeholder="Password">
			</div>
			<div class="login_etc">
				<div class="checkbox">
					<input type="checkbox" name="idSaveCheck" id="idSaveCheck"> 아이디 저장
				</div>
				<div class="forgot_pw" >
					<a href="/Project2/login/findPassword.do">Forgot Password?</a>
				</div>
			</div>
			<div class="back">
					<div class="button_base b03_skewed_slide_in">
						<div>
							<input class="box1" type=submit value="로그인">
						</div>
						<div></div>
						<div>
							<input class="box2" type=submit value="로그인">
						</div>
					</div>
				</div>		
					
			</form>
			<div class="back">				
			<form action="joinForm.do" >								
						<div class="button_base b03_skewed_slide_in"  >
							<div>
								<input class="box1" type=submit value="회원가입"  >
							</div>
							<div></div>
							<div>
								<input class="box2" type=submit value="회원가입"  >
							</div>
						</div>
					</form>
				</div>
			
</body>
</html>