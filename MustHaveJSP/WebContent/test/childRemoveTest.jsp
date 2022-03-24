<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul id="testUL" onclick='del();'>
		<li> test 1</li>
		<li> test 2</li>
		<li> test 3</li>
	</ul>
	
	<script>
		function del() {
			var parent = document.getElementById("testUL");
			parent.removeChild(parent.childNodes[0]);
			
		}
	</script>
</body>
</html>