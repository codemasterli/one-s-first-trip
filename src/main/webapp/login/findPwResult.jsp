<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="/Project2/css/loginForm.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.title{
 margin-top :50px;
}
#paw{
    margin-top: 50px;
}
#tit{
  margin-top: 50px;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="wrap">
	<br><br><br><br><br>
		<div class="login">
		<div id="tit">
			<h2>비밀번호 찾기</h2>
			</div>
		<div class="login_sns">
				<li><a href=""><i class="fab fa-instagram"></i></a></li>
				<li><a href=""><i class="fab fa-facebook-f"></i></a></li>
				<li><a href=""><i class="fab fa-twitter"></i></a></li>
			</div>
			
			
			<div class="container">
	<h1 class="title" style="text-align: center;">비밀번호 찾기 결과</h1>
		<c:if test="${member != null }">
<!-- 이 경우 수정하기 / 아니면 비번은 8글자 이상으로 설정하기 -->
    <div id="paw" style="text-align: center;">
			<c:if test="${fn:length(member.password)<4}">
				비빌번호는 <strong> ${fn:substring(member.password,0,4) } 
					<c:forEach begin="1" end="${fn:length(member.password)-1 }">
					*
					</c:forEach>
				</strong> 입니다.
			</c:if>
			
			<!-- 앞에서 4글자만 보여주고 나머지는 * 처리 -->
			<c:if test="${fn:length(member.password)>=4}">
				비빌번호는 <strong> ${fn:substring(member.password,0,4) } 
					<c:forEach begin="1" end="${fn:length(member.password)-4 }">
					*
					</c:forEach>
				</strong> 입니다.
			</c:if>
		</c:if>

		<c:if test="${member == null }">
			존재하지 않는 회원정보 입니다.
		</c:if>

	</div>
	
		<div class="back" style="margin-top: 100px;">
			<form action="/Project2/login/loginForm.do" >	
					<div class="button_base b03_skewed_slide_in">
						<div>
							<input class="box1" type=submit value="확인">
						</div>
						<div></div>
						<div>
							<input class="box2" type=submit value="확인">
						</div>
					</div>
					</form>
					
				</div>	
		

</body>
</html>