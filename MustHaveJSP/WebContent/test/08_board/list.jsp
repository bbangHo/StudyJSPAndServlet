<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@ page import="board.BoardDAO"%>
<%@ page import="board.BoardDTO"%>
<%@ page import="board.boardPaging"%>
<%@ page import="test.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Object> param = new HashMap<String, Object>();
	BoardDAO dao = new BoardDAO(application);
	int tmp = dao.selectCount(param);	//게시물 개수 가져오기
	int pageSize = 10;
	int totalCount = (int)Math.ceil((double) tmp / pageSize);
	int pageBlock = 5;
	int pageNum = 0;
	int tStart = 0, tEnd = 0;
	
	try {
		pageNum = Integer.parseInt(request.getParameter("pageNum"));
	} catch (Exception e){
		pageNum = 1;
	} 
	
	if(pageNum == 1){
		param.put("start", "1");
		param.put("end", "10");
	} else {
		tStart = (pageNum - 1) * pageSize + 1;
		tEnd = pageNum * pageSize;
		if(totalCount == tEnd) {
			tEnd = tmp % pageSize;
		}
	}
	
	System.out.println(pageNum + " " + tStart + " " + tEnd);
	
	String searchField = request.getParameter("searchField");
	String searchWord = request.getParameter("searchWord");
	
	if(searchWord != null) {
		param.put("searchField", searchField);
		param.put("searchWord", searchWord);
	}
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
        	<td>
        		<%= boardPaging.pageStr(totalCount, pageNum, pageSize, pageBlock, request.getRequestURI()) %>
        	</td>
            <td><button type="button" onclick="location.href='Write.jsp';">글쓰기
                </button>
            </td>
        </tr>
    </table>
</body>
</html>
