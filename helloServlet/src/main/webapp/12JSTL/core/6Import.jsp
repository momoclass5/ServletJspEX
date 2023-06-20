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
	<!-- 
	import : 외부파일을 현재 위치에 삽입
	
		url 	: 외부파일 파일 경로
		scope 	: 영역
		var 	: 변수명
					변수명을 사용하면 선언과 삽입을 분리 할수 있습니다.
	
	외부파일에 매개변수 넣기
		- url의 쿼리스트링으로 전달하기
		- c:param 태그를 이용하기
	
	 -->
	 
	 <c:import url="/6세션/Link.jsp" var="link">
	 <c:param name="user_param2" value="기본서" />
	 </c:import>
	 
	 <h4>다른 문서 삽입하기</h4>
	 ${link }
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
</body>
</html>