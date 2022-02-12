<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="/resources/js/board.js"></script>
</head>
<style>
#Check_pw {
	margin-top: 40px;
	width: 50%;
}
</style>
<body>
	<div align="center">
		<form action="checkPass" name="frm" method="get">
			<input type="hidden" name="com" value="board_check_pass">
			<input type="hidden" name="bno" value="${board.bno }">
			<div class="input-group input-group-sm mb-3" id="Check_pw">
				<span class="input-group-text" id="inputGroup-sizing-sm">비밀번호</span>
				<input type="password" class="form-control" name="bPass" size="20"
					aria-label="Sizing example input"
					aria-describedby="inputGroup-sizing-sm">
			</div>
			<button type="submit" onclick="return passCheck()"
				class="btn btn-outline-secondary">확인</button>
			<br> ${message }
		</form>
	</div>
</body>
</html>