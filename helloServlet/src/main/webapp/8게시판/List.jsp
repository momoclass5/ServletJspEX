<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body>
    <h2>목록 보기(List)</h2>
    <!-- 검색폼 --> 
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
        </tr>
        <!-- 목록의 내용 --> 

        <tr align="center">
            <td>1</td>  <!--게시물 번호-->
            <td align="left">  <!--제목(+ 하이퍼링크)-->
                제목</a> 
            </td>
            <td align="center">아이디</td>          <!--작성자 아이디-->
            <td align="center">조회수</td>  <!--조회수-->
            <td align="center">작성일</td>    <!--작성일-->
        </tr>

    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button">글쓰기</button></td>
        </tr>
    </table>
</body>
</html>
