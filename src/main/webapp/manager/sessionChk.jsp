<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="id" value="${sessionScope.id}" ></c:set>
<c:if test="${ id }" != 'master'>
	<script>
		location.href="loginForm.do";
	</script>
</c:if>