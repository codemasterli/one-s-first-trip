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

</script>
</head><body>
<form action="/Project2/login/findPwResult.do" method="post" name="frm" >
	<div class="wrap">
		<div class="login">
			<h2 style="margin-top: 30px;">비밀번호 찾기</h2>
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
				<h4>이름</h4>
				<input type="text" name="name" id="name" placeholder="이름">
			</div>
			
			
			<div class="back">
					<div class="button_base b03_skewed_slide_in">
						<div>
							<input class="box1" type=submit value="비밀번호 찾기">
						</div>
						<div></div>
						<div>
							<input class="box2" type=submit value="비밀번호 찾기">
						</div>
					</div>
				</div>		
					
			</form>
			<div class="back">				
			<form action="/Project2/login/loginForm.do" >								
						<div class="button_base b03_skewed_slide_in"  >
							<div>
								<input class="box1" type=submit value="취소"  >
							</div>
							<div></div>
							<div>
								<input class="box2" type=submit value="취소"  >
							</div>
						</div>
					</form>
				</div>
			
</body>
</html>