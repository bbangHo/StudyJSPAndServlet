<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
<%@ page import="test.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Object> param = new HashMap<String, Object>();
	BoardDAO dao = new BoardDAO(application);
	int totalCount = 0;
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord != null) {
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
	totalCount = dao.selectCount(param);
	List<BoardDTO> list = dao.selectList(param);	
	dao.close();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
</head>
<body> 
	<jsp:include page="../Common/Link.jsp"/>
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
    </table>
    
    <%
    	if(list.isEmpty()){
    %>
    	<tr>
    		<td>게시물이 없습니다.</td>
    	</tr>
    <%	
    	} else {
    		for(BoardDTO t : list){
    %>
    		<table border="1" width="90%">
        		<tr>
		            <th width="10%"> <%= t.getNum() %></th>
		            <th width="50%"> 
		            	<a href="View.jsp?num=<%= t.getNum() %>"><%= t.getTitle() %>
		            </th>
		            <th width="15%"> <%= t.getId() %></th>
		            <th width="10%"> <%= t.getVisitcount() %></th>
		            <th width="15%"> <%= t.getPostdate() %></th>
	      		</tr>
   			</table>	
    <%
    		}
    	}
    %>
    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <table border="1" width="90%">
        <tr align="right">
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
</body>
</html>
