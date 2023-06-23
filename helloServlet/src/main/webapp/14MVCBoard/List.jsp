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
	
	
	<h4>총 게시물수 : ${totalCnt }</h4>
	<!-- 검색 폼 -->
    <form method="get" name="searchForm">  
    <table border="1" width="90%">
    
    <!-- 페이지 번호 -->
    <input type="hidden" name="pageNo">
    
    <tr>
        <td align="center">
            <select name="searchField">
                <option value="title">제목</option>
                <option value="content" 
                	${param.searchField eq "content" ? "selected" : "" }>
                	내용</option>
            </select>
            <input type="text" name="searchWord" value="${param.searchWord }" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>
    </table>
    </form>
    
	<!-- 목록 테이블 -->
	<table border = "1" width="90%">
		<tr>
			<th width="10%">번호</th>
            <th width="*">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
            <th width="8%">첨부</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty list }">
				<!-- 조회된 게시물이 없는경우 -->
				<tr>
					<td colspan="6">등록된 게시물이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<!-- 게시물 목록 출력 -->
				<c:forEach items="${list }" var="row" varStatus="loop">
					<tr>	
						<td>${row.idx }</td>
						<td>
						<a href="../mvcboard/View.do?idx=${row.idx }">
							${row.title }
						</a></td>
						<td>${row.name }</td>
						<td>${row.visitcount }</td>
						<td>${row.postdate }</td>
						<td>첨부파일</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	
	</table>
	
	<!-- 글쓰기 버튼 추가
		글쓰기 버튼 클릭시 글쓰기 페이지로 이동  -->
	<table>
		<tr>
			<td align="right">
				
				<button onclick="location.href='../mvcboard/write.do'"></button>
			</td>
		</tr>
	</table>
	
	
	<table border="1" width="90%">
		<tr>
			<td align="center">
				<%@include file="../9페이지/PageNavi.jsp" %>
			</td>
		</tr>
	</table>
	
	
</body>
</html>











