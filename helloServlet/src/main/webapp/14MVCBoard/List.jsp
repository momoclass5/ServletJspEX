<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>MVC 모델2 게시판</h2>
	
	<c:forEach items="${list }" var="row" varStatus="loop">
		${row.idx }<br>
		${row.name }<br>
		${row.title }<br>
		================<br>
	</c:forEach>
</body>
</html>