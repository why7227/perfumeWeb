<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/resources/css/login.css">
<script type="text/javascript" src="/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/member.js"></script>
</head>
<body>
<div style="margin-top:10px">
	<form action="idFind" method="post" name="frm" style = "text-align : center;">
		<p style="text-align:center;">아이디/비번찾기</p>
		<input class="form-control idFindInput" type="text" name="name" id="nameF"
		 	placeholder="이름" size="20" aria-label="default input example">
		<input class="form-control idFindInput" type="text" name="phone" id="phoneF" 
			placeholder="010-0000-0000" size="20" aria-label="default input example">
		<input type="button" value="확인" onclick="ajaxIdFind()" class="btn btn-outline-secondary click_btn">
	</form>
	<div id="print"></div>
</div>
<script>
function ajaxIdFind() {
	
	if($('#nameF').val() == '' || $('#phoneF').val()  == '' ) {
		$("#print").text("전화번호,이름 둘다 입력해주세요:D") 
		} else {
			
	$.ajax({
		type:"POST",
		url:"idFind.do",
		data: {
			name:$('#nameF').val(),
			phone:$('#phoneF').val()
		},
		dataType:"html",
		success:function(data) {
			if(data != "") {
				let arr = data.split("/");
				$("#print").text("아이디는 " + arr[0] + ", 비밀번호는 " + arr[1]);
			} else {
				$("#print").text("일치하는 정보가 없습니다.");
				}
			}
		});
	}
}
</script>
</body>
</html>