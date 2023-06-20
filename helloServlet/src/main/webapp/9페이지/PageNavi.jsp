<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dto.Criteria"%>
<%@page import="dto.PageDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="pageDto" value="<%=pageDto %>"/>

<!-- 이전버튼 -->
<c:if test="${pageDto.prev }">
	<a href='List.jsp?pageNo=${pageDto.startNo-1 }'>이전</a>
</c:if>

<!-- 페이지번호 출력 -->
<c:forEach begin="${pageDto.startNo }" end="${pageDto.endNo }" var="i">
	<a href='List.jsp?pageNo=${i }'>${i }</a>
</c:forEach>

<!-- 다음버튼 -->
<c:if test="${pageDto.next }">
	<a href='List.jsp?pageNo=${pageDto.endNo+1 }'>다음</a>
</c:if>


</body>
</html>




















