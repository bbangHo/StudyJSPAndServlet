<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
	<form action="test1.jsp" method="post">
		<input type="text" id="testID" name="testID"/>
		<input type="submit" value="전송 제발"/>
	</form>
	
	<br><br>
	
	<form action="test1.jsp" method="post">  
        <input type="text" name="testID"/>
        <input type="submit" value="POST 방식 전송" />
    </form>
</body>
</html>