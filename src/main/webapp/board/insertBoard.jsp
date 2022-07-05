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
	Review_BoardDao bd = Review_BoardDao.getInstance();
	
	for (int i = 11; i <= 120; i++){
		Review_Board board = new Review_Board();
		
		board.setReview_title("실험용 게시글" + i);
		board.setReview_content("실험용 게시글 내용" +i);
		board.setThumbnail("test" +i +".jpg");
		board.setId("1");
		bd.insert(board);
		
	}
%>
</body>
</html>