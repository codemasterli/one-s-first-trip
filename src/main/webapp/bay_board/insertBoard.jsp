<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.*,dao.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Bay_Notice_BoardDao bd = Bay_Notice_BoardDao.getInstnace();
	
	for (int i = 1; i <= 120; i++){
		Bay_Notice_Board board = new Bay_Notice_Board();

		board.setBay_notice_title("실험용 게시글" + 1);
		board.setBay_notice_content("실험용 계시글 내용" + 1);
		board.setBay_notice_price(i);
		board.setId("1");
		bd.insert(board);
		
	}
%>
</body>
</html>