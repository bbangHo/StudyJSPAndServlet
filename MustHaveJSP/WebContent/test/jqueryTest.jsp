<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test</title>
<style>
#display {
	visibility: hidden;
	align-items: center;
	width: 100%;
	height: 50px;
	border: 1px solid red;
	display: flex;
	justify-content: space-around;
}

#main {
	align-items: center;
	width: 100%;
	height: 100px;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

#manu {
	width: 400px;
	border: 1px solid black;
}

.menu {
	float: left;
	width: auto;
	border: 1px solid black;
}
</style>
</head>
<body>
	<h2 align="center">메뉴바 테스트 페이지</h2>

	<div id="main">
		<div id="display">
			<h2 class="menu">메뉴1</h2>
			<h2 class="menu">메뉴22</h2>
			<h2 class="menu">메뉴333</h2>
			<h2 class="menu">메뉴4444</h2>
			<h2 class="menu">메뉴55555</h2>
			<h2 class="menu">메뉴6666666666666</h2>
		</div>
		<div id="menu">
			<img src="img/btn.png" id="menuBtn"></img>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		$(function() {
			$("#menu").mouseenter(function() {
					$("#display").css("visibility", "visible");
					$("#display").mouseenter(function() {
						$("#display").css("visibility", "visible");
					});
					
			});
			
			$("#menu").mouseleave(function() {
				$("#display").css("visibility", "hidden");
				$("#display").mouseleave(function() {
					$("#display").css("visibility", "hidden");
				});
			});
		});
	</script>
</body>
</html>