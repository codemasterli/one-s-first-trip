<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Project2/css/page2.css">
</head><body>
     <div class="wrap">
                <div class="join">
                    <h2>회원정보 수정</h2>
                    <div class="join_sns">
                        <li><a href=""><i class="fab fa-instagram"></i></a></li>
                        <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href=""><i class="fab fa-twitter"></i></a></li>
                    </div>
                    <div class="join_id">
                       	<h4>아이디</h4>
                        <input type="text" name="" id="" placeholder="변경할 아이디를 입력하세요" 
                        required="required" autofocus="autofocus">
                    </div>
                    <div class="join_pw">
                        <h4>비밀밀호</h4>
                        <input type="password" name="" id="" placeholder="변경할 비밀번호를 입력하세요">
                    </div>
                    <div class="join_name">
                        <h4>이름</h4>
                        <input type="text" name="" id="" placeholder="변경할 이름을 입력해주세요">
                    </div>
                    <div class="join_tel">
                        <h4>전화번호</h4>
                        <input type="text" name="" id="" placeholder="변경할 전화번호를 입력해주세요">
                    </div>
                    <div class="join_em">
                        <h4>Email</h4>
                        <input type="text" name="" id="" placeholder="변경할 Email을 입력해주세요">
                    </div>
                    <div class="submit">
                        <input type="submit" value="회원정보 수정" onclick="location.href='/Project2/login/LoginForm.jsp'">
                    </div>
                </div>
            </div>
</body>
</html>