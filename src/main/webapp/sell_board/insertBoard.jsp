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
	Sell_Notice_BoardDao bd = Sell_Notice_BoardDao.getInstnace();
	
	for (int i = 1; i <= 120; i++){
		Sell_Notice_Board board = new Sell_Notice_Board();

		board.setSell_notice_title("실험용 게시글" + 1);
		board.setSell_notice_content("실험용 게시글 내용" +i);
		board.setSell_notice_price(i);
		board.setSell("n");
		board.setId("1");
		bd.insert(board);
		
	}
%>
</body>
</html>