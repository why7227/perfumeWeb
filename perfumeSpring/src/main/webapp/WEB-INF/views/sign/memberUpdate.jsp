<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sentir L'odeur 회원가입</title>
<link type="text/css" rel="stylesheet" href="/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="/resources/css/header.css">
<link type="text/css" rel="stylesheet" href="/resources/css/footer.css">
<link type="text/css" rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/resources/css/join.css">
<script type="text/javascript" src="/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<script type="text/javascript" src="/resources/js/member.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
	<div class="container-fluid">
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
		<!-- Header Area End -->
		<!-- Join Area -->
		<form action="/update" method="post" name="frm">
			<div class="row">
				<div class="col-8 offset-2">
					<h2>회원정보수정</h2>
					<hr>
					<p>'*'표시항목은 필수 입력 항목입니다.</p>
				</div>
				<!-- 로그인 테이블 -->
				<div class="col-8 offset-2">
					<table>
						<tr>
							<th>*이름</th>
							<td><input class="form-control" type="text" name="name" readonly="readonly"
								size="20" aria-label="default input example" value="${member.name}">
							</td>
						</tr>
						<tr>
							<th>*생년월일</th>
							<td><input class="form-control" type="date" name="birth"  readonly="readonly"
								size="20" aria-label="default input example" value="${member.birth}">
							</td>
						</tr>

						<tr>
							<th>*아이디</th>
							<td><input class="form-control" type="text" name="userid"  readonly="readonly"
								size="20" id="idCheck" aria-label="default input example" value="${member.userid}">
							</td>
						</tr>
						<tr>
							<th>*비밀번호</th>
							<td><input class="form-control" type="password" name="pwd" id="password"  value="${member.pwd}"
								size="20" aria-label="default input example">
								<p>8~20자리의 영문,숫자,특수문자의 입력이 가능합니다.</p>
							<td>
						</tr>
						<tr>
							<th>*비밀번호 확인</th>
							<td><input class="form-control" type="password" name="pwd_check"
								size="20" aria-label="default input example">
							</td>
						</tr>

						<tr>
							<th>*이메일</th>
							<td><input class="form-control" type="email" name="email"  value="${member.email}"
								size="20" id="exampleFormControlInput1" placeholder="name@example.com">
							</td>
						</tr>
						<tr>
							<th>*전화번호</th>
							<td><input class="form-control" type="text" name="phone"  value="${member.phone}"
								size="20" aria-label="default input example">
							</td>
						</tr>
						<tr>
							<th>*주소</th>
							<td><div class="input-group mb-3 address_input">
									<input type="text" class="form-control" name="postcode"  value="${member.postcode}"
										id="postcode" aria-label="Recipient's username"
										aria-describedby="button-addon2">
									<button class="btn btn-outline-secondary" type="button"
										id="button-addon2" onclick="execPostCode();">우편검색</button>
								</div>
							</td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" class="form-control" name="address"  value="${member.address}"
								id="address" placeholder="도로명주소">
							</td>
						</tr>
						<tr>
							<th></th>
							<td><input type="text" class="form-control"  value="${member.addressDetail}"
								name="addressDetail" id="addressDetail" placeholder="상세주소"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							</td>
						</tr>
						<tr>
							<td colspan="2">${message}</td>
						</tr>
					</table>
				</div>
				<!-- 회원가입, 다시작성 버튼 -->
				<div style="margin-top: -50px; margin-left: 25%;">
					<input type="submit" value="수정완료" onclick="return updateCheck()"
						class="btn btn-outline-secondary click_btn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="취소" href="/login" class="btn btn-outline-secondary click_btn">
				</div>
			</div>
		</form>
		<!-- Join Area End -->
		<!-- Footer Area -->
		<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
		<!-- Footer Area End -->
	</div>
	
	<script>
		// API 이용한 주소검색
		function execPostCode() {
			new daum.Postcode({
				oncomplete : function(data) {
					var fullRoadAddr = data.roadAddress; //도로명 주소 변수
					var extraRoadAddr = ''; // 도로명 조합형 주소변수

					// 법정동명이 있을 경우 추가(법정리제외),법정동의 경우 마지막 문자가 "동/로/가"로끝난다
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraRoadAddr += data.bname;
					}
					// 건물명 있고 공동주택일 경우 추가
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraRoadAddr += (extraRoadAddr !== '' ? ','
								+ data.buildingName : data.buildingName);
					}
					// 도로명,지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraRoadAddr !== '') {
						extraRoadAddr = ' (' + extraRoadAddr + ')';
					}
					// 도로명,지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
					if (fullRoadAddr !== '') {
						fullRoadAddr += extraRoadAddr;
					}
					
					console.log(data.zonecode);
					console.log(fullRoadAddr);

					$("[name=postcode]").val(data.zonecode);
					$("[name=address]").val(fullRoadAddr);
				}
			}).open();
		}
	</script>
</body>
</html>