<%@page import="common.JSFunction"%>
<%@page import="dao.NewBoardDao"%>
<%@page import="dao.BoardDao"%>
<%@page import="dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../6세션/IsLogin.jsp"%>
<%@ include file = "../6세션/Link.jsp" %>
<%
	Board board = new Board();

	board.setTitle(request.getParameter("title"));
	board.setContent(request.getParameter("content"));
	board.setId(session.getAttribute("UserId").toString());
	
	NewBoardDao dao = new NewBoardDao();
	int res = dao.insert(board);
	
	if(res>0) {
		// 입력성공
		JSFunction.alertLocation("입력되었습니다.", "List.jsp", out);
	} else {
		// 입력실패
		JSFunction.alertBack("입력중 오류가 발생 하였습니다.\n 관리자에게 문의해주세요", out);
	}
	
	
%>
</body>
</html>














