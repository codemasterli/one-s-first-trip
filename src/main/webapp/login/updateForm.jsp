<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Project2/css/updateForm.css">
<script type="text/javascript">
function chk() {
	if (frm.password.value != frm.password2.value) {
		alert("암호와 암호확인이 다릅니다");  frm.password.focus();
		frm.password.value = "";	frm.password2.value = "";
		return false;
	}
}
</script>
</head><body>

<form action="/Project2/login/update.do" method="post" name="frm" onsubmit="return chk()">
   <input type="hidden" name="id" value="${member.id }">
     <div class="wrap">
                <div class="join">
                    <h2>회원정보 수정</h2>
                    <div class="join_sns">
                        <li><a href=""><i class="fab fa-instagram"></i></a></li>
                        <li><a href=""><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href=""><i class="fab fa-twitter"></i></a></li>
                    </div>
                    <div class="join_id">
                       	<h4>비밀번호</h4>
                        <input type="password" name="password" id="password" placeholder="변경할 비밀번호를 입력하세요" 
                        required="required" autofocus="autofocus">
                    </div>
                    <div class="join_pw">
                        <h4>비밀밀호 확인</h4>
                        <input type="password" name="password2" id="password2" placeholder="변경할 비밀번호를 확인하세요">
                    </div>
                    <div class="join_name">
                        <h4>이름</h4>
                        <input type="text" name="name" id="name" placeholder="변경할 이름을 입력해주세요" value="${member.name }">
                    </div>
                    <div class="join_tel">
                        <h4>전화번호</h4>
                        <input type="tel" name="tel" id="tel" placeholder="변경할 전화번호를 입력해주세요" value="${member.tel }">
                    </div>
                    <div class="join_tel">
                        <h4>주소</h4>
                        <input type="text" name="address" id="address" placeholder="변경할 주소를 입력해주세요" value="${member.address }">
                    </div>
                    <div class="join_em">
                        <h4>Email</h4>
                        <input type="email" name="mail" id="mail" placeholder="변경할 Email을 입력해주세요" value="${member.mail }">
                    </div>
                    <div class="submit">
                        <input type="submit" value="회원정보 수정" >
                    </div>
                </div>
            </div>
            </form>
</body>
</html>