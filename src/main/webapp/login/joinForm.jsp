<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/Project2/css/joinForm.css">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
	rel="stylesheet">
<script src="https://kit.fontawesome.com/53a8c415f1.js"	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- <script type="text/javascript" src="../js/jquery.js"></script> -->
<script type="text/javascript">
/* 	 function checkemailaddy(obj){
		  
        if (form.join_em.email_select.value == '1') {
            form.join_em.mail2.readOnly = false;
            form.join_em.mail2.value = '';
            form.join_em.mail2.focus();
        }
        else {
             form.join_em.mail2.readOnly = true; 
            form.join_em.mail2.value = obj.value;
        }
    }  */
    /*  var checkemailaddy = function(value) {
		$("#mail2").val(value);
	} */
	// 이메일 형식 집어 넣기
	 $(document).ready(function() {
		$("#email_select").change(function() {
			$("#mail2").val($(this).val());
		});
	});  
	
	//암호확인
	function chk() {
		if (form.password.value != form.password2.value) {
			alert("암호를 확인해주세요");	form.password.focus();
			form.password.value = "";		form.password2.value = "";
			return false;
		}
		
	}
	function dupChk() {
		if (!form.id.value) {	alert("아이디를 입력하고 체크하세요");
			form.id.focus();		return false;
		}
		/* $가 jQuery사용한다 post는 메서드가 post방식 */
		$.post('/Project2/login/confirm.do','id='+form.id.value, function(data) {
			
			$('#err').html(data);
		});
	
	}
		</script>
</head>
<body>
<form action="/Project2/login/join.do" name="form" method="post" onsubmit="return chk()">
	<div class="wrap">
		<div class="join">
			<h2>Log-in</h2>
			<div class="join_sns">
				<li><a href=""><i class="fab fa-instagram"></i></a></li>
				<li><a href=""><i class="fab fa-facebook-f"></i></a></li>
				<li><a href=""><i class="fab fa-twitter"></i></a></li>
			</div>
			<div class="join_id">
				<h4>아이디</h4>
				<input type="text" name="id" id="id" placeholder="아이디를 입력하세요"
					required="required" autofocus="autofocus">
					<input type="button" id="btn"value="중복체크"  onclick="dupChk()">
		<div id="err"></div>
			</div>
		
			<div class="join_pw">
				<h4>비밀밀호</h4>
				<input type="password" name="password" id="password"
					placeholder="비밀번호를 입력하세요">
			</div>
			<div class="join_pw2">
				<h4>비밀번호 확인</h4>
				<input type="password" name="password2" id="password2"
					placeholder="비밀번호를 다시입력해주세요">
			</div>
			<div class="join_name">
				<h4>이름</h4>
				<input type="text" name="name" id="name" placeholder="이름을 입력해 주세요">
			</div>
			<div class="join_age">
				<h4>나이</h4>
				<input type="text" name="age" id="age" placeholder=" 나이를 입력해 주세요">
			</div>
			<div class="join_tel">
				<h4>주소</h4>
				<input type="text" name="address" id="address"
					placeholder=" 나이를 입력해 주세요">
			</div>
			<div class="join_tel">
				<h4>전화번호</h4>
				<input type="tel" name="tel" id="tel" placeholder="전화번호를 입력해주세요">
			</div>
			<div class="join_em">
				<h4>이메일</h4>
				<input name="mail" type="text" class="box" id="mail" value="">@<input
					name="mail2" type="text" class="box" id="mail2" value="">
				<select name="email_select" class="box" id="email_select"
					>
					<option value="" selected>선택하세요</option>
					<option value="naver.com">naver.com</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="hanmail.com">hanmail.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
					<option value="">직접입력</option>
				</select>
			</div>			
			<br>
			<div class="join_gen">
				<h4>성별</h4> &nbsp; &nbsp; &nbsp; 
				<label>남자</label>
				<input type="radio"	name="gender" id="man" value="m">&nbsp; &nbsp; &nbsp; 
				<label>여자</label>
				<input type="radio" name="gender" id="woman" value="w">
			</div>
		<div class="back">
			<div class="button_base b03_skewed_slide_in">
				<div><input  class="box1" type=submit  value="회원가입"></div>
				<div></div>
				<div><input class="box2" type=submit  value="회원가입"></div>
			</div>
		</div>
	</div>
			
</div>
</form>
</body>
</html>