<%@ page import="java.util.*"%>
<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page import="JDBC.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);

Map<String, Object> parameter = new HashMap<>();		//	사용자가 검색한 단어를 담기위한 객체
String searchField = request.getParameter("searchField");		// 카테고리
String searchWord = request.getParameter("searchWord"); 		// 검색내용

parameter.put("searchField", searchField);
parameter.put("searchWord", searchWord);

int total = dao.selectCount(parameter);
ArrayList<BoardDTO> list = dao.selectList(parameter);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
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
        <%
        for(BoardDTO bDTO : list) {
        %>
        	<tr>
        		<th width="10%"><%= bDTO.getNum() %></th>
           		<th width="50%">
           		<a href = "List.jsp?num=<%= bDTO.getNum() %>"><%= bDTO.getTitle() %>
           		</a></th>
           		<th width="15%"><%= bDTO.getId() %></th>
            	<th width="10%"><%= bDTO.getVisitcount() %></th>
            	<th width="15%"><%= bDTO.getPostdate() %></th>
        	</tr>
        <%	
        }
        %>
        
	</table>
	
</body>
</html>