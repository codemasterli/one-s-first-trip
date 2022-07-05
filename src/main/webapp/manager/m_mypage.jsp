<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../login/sessionChk.jsp" %>
	
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<style type="text/css">

.btn{ position: absolute;
        top: 115px; right: 10px;}
</style>
<style type="text/css">@import url("/Project2/css/page.css");
</style></head><body>
<% String path = request.getContextPath();
   session.getAttribute("id");
%>
<script type="text/javascript">
function del() {
	// 확인을 check하면 true이고 취소를 체크하면 false;
	var ch = confirm("정말로 탈퇴하시겠습니까 ?");
	if (ch) location.href="/Project2/login/delete.do";
	else alert("탈퇴가 취소 되었습니다");
}
</script>
	<div class="wrap" style=" margin-top: 100px;
    width: 50%;
    /* align-content: center; */
    margin-left: 450px;
    border: 2px solid;">
		<div class="greenContainer">
			<div>
 				<h1>My Page</h1>
				<div class="grade">GOLD</div>
				<div class="name"><%=session.getAttribute("id") %>님</div>
			</div>
	<button class="btn" onclick="del()" >회원 탈퇴</button>
		</div>
		<div class="summaryContainer">
			<div class="item">
				<div class="number">354</div>
				<div>단골상점</div>
			</div>
			<div class="item">
				<div class="number">354</div>
				<div>상품후기</div>
			</div>
			<div class="item">
				<div class="number">354</div>
				<div>적립금(BLCT)</div>
			</div>
		</div>
		<div class="shippingStatusContainer">
			<div class="title">활동이력</div>
			<div class="status">

				<div class="item">
					<div>
						<div class="green number">6</div>
						<div class="text">계시글</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="number">0</div>
						<div class="text">답장</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="green number">1</div>
						<div class="text">모임횟수</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="green number">3</div>
						<div class="text">후기</div>
					</div>
				</div>

			</div>

		</div>
		<div class="listContainer">
			<a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">
					주문목록<span class="circle"></span>
				</div>
				<div class="right">></div>
			</a> <a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">상품후기</div>
				<div class="right">></div>
			</a> <a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">상품문의</div>
				<div class="right">></div>
			</a> <a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">단골상점</div>
				<div class="right">></div>
			</a> <a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">찜한상품</div>
				<div class="right">></div>
			</a>
		</div>
		<div class="listContainer">
			<a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">
					<span>내지갑</span> <span class="smallLight"> <span>|</span> <span>보유
							적립금</span>
					</span>
				</div>
				<div class="right">
					<span class="blct">175 BLCT</span> >
				</div>
			</a> <a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">알림</div>
				<div class="right">></div>
			</a> <a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">설정</div>
				<div class="right">></div>
			</a>
		</div>
		<div class="infoContainer">
			<a href="#" class="item">
				<div>icon</div>
				<div>공지사항</div>
			</a> <a href="#" class="item">
				<div>icos</div>
				<div>이용안내</div>
			</a> <a href="#" class="item">
				<div>icon</div>
				<div>고객센터</div>
			</a>
		</div>
	</div>
</body>
</html>