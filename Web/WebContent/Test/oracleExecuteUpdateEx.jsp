<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		// 1. 드라이버 로드
		Class.forName("oracle.jdbc.OracleDriver");
		
		// 2. DB 연결
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "musthave", "1234");
	
		// 3. 쿼리문 작성
		String sql = "INSERT INTO member VALUES (?, ?, ?, sysdate)"; 
		
		// 4. 쿼리문 객체 생성
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, "test22423");
		psmt.setString(2, "22");
		psmt.setString(3, "테스트22423");
		
		// 5. 쿼리 실행
		int tmp = psmt.executeUpdate();
		out.println(tmp + "행 입력");
		
		// 6. 실행결과 처리		
		//ResultSet rs = psmt.executeQuery("select * from member");
		
		// 7. 연결 해제
		conn.close();
		psmt.close();
		//rs.close();
	 
	%>
</body>
</html>