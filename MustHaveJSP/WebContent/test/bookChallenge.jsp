<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>book Challenge</title>
<style>
	#result {
		color: red;
		font-size: 2.8em;
		font-weight: bold;
	}
	
	#circleDiv {
		border: 2px double #222;
		width: 300px;
		height: 300px;
		border-radius: 50%;
		background-color: #d8f0fc;
		text-align: center;
	} 
</style>
</head>
<body>
	<div id="circleDiv">
		<h2 class="word">책 읽기</h2>
		<p><span class="word" id="result"></span> 일 연속으로</p>
		<p>책 읽기를 달성했군요. <br> 축하드립니다.</p>
	</div>
	
	<script>
		/* var circleDiv = document.getElementById("circleDiv");	// div 요소 얻기
		circleDiv.style.textAlign = "center";
		circleDiv.style.width = "500px";
		circleDiv.style.border = "1px solid black"; */
		
		//날짜 변수 선언
		var now = new Date();		// 기준일 ~ 현 날짜 까지의 시간
		var startDate = new Date("2020-10-01");		//시작일
		var turm = Math.round((now.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24));
		
		/* var result = document.getElementById("result");		
		var spanEm = document.createElement("span");
		var turmToText = document.createTextNode(turm);
		
		spanEm.appendChild(turmToText);
		result.appendChild(spanEm); */
		
		document.getElementById("result").innerText = turm;
	</script>
</body>
</html>