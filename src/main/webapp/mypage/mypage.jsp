<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="/login/sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<!-- <style type="text/css">
.btn{ position: absolute;
        top: 115px; right: 10px;}
</style> -->
<style type="text/css">
.wrap{ /* margin: auto; */
    width: 50%;
    /* text-align: -webkit-right; */
    margin-inline: auto;
    /* margin-top: 5%; */
    /* padding-top: 5%; */
    margin-top: 100px;
    border: 1px solid;
    }
</style>
<style type="text/css">@import url("/Project2/css/page.css");
</style></head><body>
<% String path = request.getContextPath();
   session.getAttribute("id");
   session.getAttribute("name");
%>
<script type="text/javascript">
function del() {
	// 확인을 check하면 true이고 취소를 체크하면 false;
	var ch = confirm("정말로 탈퇴하시겠습니까 ?");
	if (ch) location.href="/Project2/login/delete.do";
	else alert("탈퇴가 취소 되었습니다");
}
function uda() {
	// 확인을 check하면 true이고 취소를 체크하면 false;
	var ch = confirm("수정하시겠습니까 ?");
	if (ch) location.href="/Project2/login/updateForm.do";
	else alert("탈퇴가 취소 되었습니다");
}
function not() {
	location.href="/Project2/notice/Notice.no?notice_num=${notice_board.notice_num}&pageNum=${currentPage}";
	}
function rew() {
	location.href="/Project2/board/View_BoardForm.wo";
	}
function sel() {
	location.href="/Project2/sell_board/sell_notice.so?sell_notice_num=${sell_notice_board.sell_notice_num}&pageNum=${currentPage}";
	}
function main() {
	location.href="/Project2/main/loginmain.do";
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
				<div class="name">${member.name }님 </div>
		</div>
	
		</div>
		<div class="summaryContainer">
			<div class="item">
				<div class="number" id="div_main" onclick="main()">메인 페이지</div>
				<div></div>
			</div>
			<div class="item">
				<div class="number"></div>
				<div></div>
			</div>
			<div class="item">
				<div class="number"></div>
				<div></div>
			</div>
		</div>
		<div class="shippingStatusContainer">
			<div class="title">활동이력</div>
			<div class="status">

				<div class="item">
					<div>
						<div class="green number">0</div>
						<div class="text">게시글</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="number">0</div>
						<div class="text">구매횟수</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="green number">0</div>
						<div class="text">판매횟수</div>
					</div>
					<div class="icon">></div>
				</div>
				<div class="item">
					<div>
						<div class="green number">0</div>
						<div class="text">후기</div>
					</div>
				</div>

			</div>

		</div>
		<div class="listContainer">
			<a href="#" class="item">
				<div class="icon">⬛</div>
				<div class="text">
				<button class="btn1">주문목록</button>
				<span class="circle"></span>
				</div>
				<div class="right">></div>
			</a> <a href="#" class="item">
				<div class="icon">⬛</div>
				<div class="text">
				<button class="btn1">댓글목록</button>
				</div>
				<div class="right">></div>
			</a> <a href="#" class="item">
				<div class="icon">⬛</div>
				<div class="text">
				<button class="btn1">좋아요 한 게시글</button>
				</div>
				<div class="right">></div>
			<!-- </a> <a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">단골상점</div>
				<div class="right">></div>
			</a> <a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">찜한상품</div>
				<div class="right">></div> -->
			</a>
		</div>
		<div class="listContainer">
			<!-- <a href="#" class="item">
				<div class="icon">ii</div>
				<div class="text">
					<span>내지갑</span> <span class="smallLight"> <span>|</span> <span>보유
							적립금</span>
					</span>
				</div> -->
				<div class="right">
					<span class="blct">회원 설정</span> 
				</div>
			</a> <a href="#" class="item">
				<div class="icon">⬛</div>
				<div class="text">				
					<button class="btn1" onclick="del()" >회원 탈퇴</button>
				</div>
				<div class="right">></div>
			</a> <a href="#" class="item">
				<div class="icon">⬛</div>
				<div class="text">
					<button class="btn1" onclick="uda()" >회원 정보수정</button>
				</div>
				<div class="right">></div>
			</a>
			</div>
		</div>
		<div class="infoContainer">
			<a href="#" class="item">
				<div>⬛</div>
				<div id="icon-div" onclick="not()">공지사항</div>
			</a> <a href="#" class="item">
				<div>⬛</div>
				<div id="icon-div2" onclick="rew()">리뷰게시판</div>
			</a> <a href="#" class="item">
				<div>⬛</div>
				<div id="icon-div3" onclick="sel()">거래게시판</div>
			</a>
			
		</div>
</body>
</html>