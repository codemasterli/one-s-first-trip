<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title></head><body>
<c:if test="${result > 0 }">
<script type="text/javascript">
	alert("수정 성공했습니다.");
	location.href="/Project2/sell_board/sell_view.so?sell_notice_num=${sell_notice_num}&pageNum=${pageNum}";
</script>
</c:if>
<c:if test="${result <= 0 }">
<script type="text/javascript">
	alert("수정 실패했습니다.");
	history.back();
</script>
</c:if>
</body>
</html>