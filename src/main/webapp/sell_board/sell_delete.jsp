<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<c:if test="${result > 0 }">
<script type="text/javascript">
	alert("게시글이 삭제 되었습니다");
	location.href="/Project2/sell_notice/Sell_NoticeAction.so";
</script>
</c:if>
<c:if test="${result == 0 }">
<script type="text/javascript">
	alert("오류가 발생하여 삭제되지 않았습니다");
	history.go(-1);
</script>
</c:if>
</body>
</html>