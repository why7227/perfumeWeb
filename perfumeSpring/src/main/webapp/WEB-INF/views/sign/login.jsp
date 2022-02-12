<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sentir L'odeur 로그인</title>
<link type="text/css" rel="stylesheet" href="/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="/resources/css/header.css">
<link type="text/css" rel="stylesheet" href="/resources/css/footer.css">
<link type="text/css" rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/resources/css/login.css">
<script type="text/javascript" src="/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<script type="text/javascript" src="/resources/js/member.js"></script>
</head>
<body>
	<div class="container-fluid">
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
		<!-- Header Area End -->
		<!-- Login Area  -->
		<form action="/login.do" method="post" name="frm">
			<div class="row" id="wrap">
				<div class="col-2"></div>
				<div class="col-4">
					<h2>회원 로그인</h2>
					<p>
						가입하신 아이디와 비밀번호를 입력해주세요
					</p>
					<div>
					<input type="text" name="userid" placeholder="ID"
						value="${userid}" class="form-control login_input"><br>
						<input type="password" name="pwd" placeholder="PASSWORD" class="form-control login_input"><br>
						<input type="submit" value="LOG-IN" onclick="return loginCheck()" class="btn">
					<p class="login_message">${message}</p>
					</div>
				</div>
				<div class="col-4">
					<h2>회원가입</h2>
					<p>
						아직 회원이 아니신가요?<br> 화원가입을 하시면 다양한 혜택을 편리하게 이용하실 수 있습니다.
					</p>
					<input type="button" value="JOIN-US"
						onclick="location.href='/join.do'" class="btn"><br> <br>
					<p>아이디, 비밀번호를 잊으셨나요?</p>
					<input type="button" value="ID/PASSWORD" class="btn" onclick="idFind()">
				</div>
			</div>
			<div class="col-2"></div>
		</form>
		<!-- Login Area End -->
		<!-- Footer Area -->
		<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
		<!-- Footer Area End -->
	</div>
</body>
</html>