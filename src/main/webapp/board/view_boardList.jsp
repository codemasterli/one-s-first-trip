<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<ul>
			<c:forEach var="review_board" items="${list}">
				<li><a href="boardView.wo?review_num=${review_board.review_num}"> <span
						class="bd_text">${review_board.review_reg_date } | ${review_board.review_read_cnt } 읽음</span>
						<img alt="썸네일" src="../upload/${review_board.thumbnail}">
						<div class="bd_text_area">
							<p class="bd_text_title">${review_board.review_title}</p>
							<pre class="bd_text_content">${review_board.review_content}</pre>
							<div class="bd_text_bottom">
								<img alt="하트" src="../../images/icons/heart.png"> <span>${review_board.review_likes}</span>
								<img alt="댓글" src="../../images/icons/comment.png"> <span>${review_board.cnt}</span>
								<div class="bd_text_bottom_right">
									<img alt="닉네임" src="../../images/icons/by.svg"> <span>${review_board.nick_nm}</span>
								</div>
							</div>
						</div></a></li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>