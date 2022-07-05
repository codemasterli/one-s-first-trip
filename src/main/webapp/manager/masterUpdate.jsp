<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/login/sessionChk.jsp" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="/Project2/css/notice2.css">
</head><body>
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
					    <b><%=session.getAttribute("id") %>님 </b>&nbsp;
					    <c:if test="${id != 'master' }">						
						<a href="/Project2/mypage/mypage.do">마이페이지</a>
						<a href="/Project2/login/updateForm.do">회원정보 수정</a>
						</c:if>
						<c:if test="${id == 'master' }">
						
						<!-- <a href='/Project2/manager/m_mypage.do'>관리자페이지</a> -->
							<a href="/Project2/manager/masterUpdate.do">회원관리</a>						
					</c:if>
					&nbsp;<a href='/Project2/login/logout.do'>로그아웃</a>					
				</div>
				</div>
			</div>
    <div class="board_wrap">
        <div class="board_title">
            <strong>회원관리</strong>
            <p>회원정보</p>
        </div>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top"  >
                    <div class="num1" >아이디</div>
                    <div class="num2" >이름</div>
                    <div class="num3" >주소</div>
                    <div class="num4" >나이</div>
                    <div class="num5" >전화번호</div>
                    <div class="num6" >성별</div>
                    <div class="num7" >이메일</div>                    
                  	<div class="num8" >회원탈퇴</div>
                </div>
                
                <c:if test="${empty list}">
	            <tr><th colspan="5">데이터가 없습니다</th></tr>
               </c:if>
               <c:if test="${not empty list}">
	<c:forEach var="member" items="${list }">
                <div class="text">     
                    <div class="num1" >${member.id }</div>
                    <div class="num2" >${member.name }</div>
                    <div class="num3" >${member.address }</div>
                    <div class="num4" >${member.age }</div>
                    <div class="num5">${member.tel }</div>
                    <div class="num6" >${member.gender }</div>
                    <div class="num7"  >${member.mail }</div>                    
                    <div class="num8"  ><input type="button" value="회원탈퇴" onclick="location.href='/Project2/manager/masterDelete.do?id=${member.id}'"></div>
                </div>
                </c:forEach>
                </c:if>
            </div>
            <div class="board_page">
				<c:if test="${currentPage !=0 }">
				<a onclick="locatio.href='/Project2/manger/masterUpdate.do?pageNum=${startPage }'" class="bt last"><<</a>
				</c:if>
				 <c:if test="${startPage > PAGE_PER_BLOCK}">
			    <a onclick="locatio.href='/Project2/manger/masterUpdate.do?pageNum=${startPage -1}'" class="bt prev"><</a>
			     </c:if>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a onclick="locatio.href='/Project2/manger/masterUpdate.do?pageNum=${i}'" class="num on">${i}</a>
				</c:forEach>
				<c:if test="${endPage < totalPage}">
				<a onclick="locatio.href='/Project2/manger/masterUpdate.do?pageNum=${endPage + 1}'" class="bt last">></a>
				</c:if>
				<c:if test="${currentPage != 0 }">
				<a onclick="locatio.href='/Project2/manger/masterUpdate.do?pageNum=${endPage }'" class="bt last">>></a>
				</c:if>
			</div>
            <div class="bt_wrap">
                <a href="/Project2/main/loginmain.do" class="on">확인</a>
             <!--    <a href="Edit.jsp">수정</a> -->
            </div>
        </div>
    </div>
</body>
</html>
                
                
                
                
        
                