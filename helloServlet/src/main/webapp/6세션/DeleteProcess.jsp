<%@page import="common.JSFunction"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String num = request.getParameter("num");
	out.print(num);
	BoardDao dao = new BoardDao();
	int res = dao.delete(num);
	
	if(res>0){
		// 삭제 성공 : 메세지 출력후 리스트로 이동
		JSFunction.alertLocation("삭제 되었습니다.", "Board.jsp", out);
	} else {
		// 삭제 실패
		JSFunction.alertBack("삭제중 오류가 발생 하였습니다.", out);
	}
%>
</body>
</html>










