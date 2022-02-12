<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"href="/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="/resources/css/header.css">
<link type="text/css" rel="stylesheet" href="/resources/css/footer.css">
<link type="text/css" rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/resources/css/mypage.css">
<script type="text/javascript" src="/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/member.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<script type="text/javascript" src="/resources/js/cart.js"></script>
</head>

<body>
	<div class="container-fluid">
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/header.jsp" %> 
		<!-- Header Area End -->
		<!-- MyPage Area -->
		<div id="mypage">
			<!--고객환영,적립금,쿠폰-->
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10">
					<!--마이페이지 제목-->
					<div id="mypage_title" class="py-5 my-5">
						<h1>My page</h1>
					</div>
					<button type="button" class="btn btn-outline-secondary" onclick="location.href='/update?userid=${member.userid}'" style="font-size:18px;">회원정보 변경하기</button>
					<div id="hello">
						<div id="hello_left">${member.name}님 ,환영합니다^^
						</div>
						<div id="hello_right">
							<ul>
								<li>쿠폰<strong>0</strong></li>
								<li>적립금<strong>0</strong></li>
							</ul>
						</div>
					</div>
					<!--주문상황-->
					<div id="order">
						<p>주문현황</p>
						<hr>
						<div class="order_menu">
							입금전<br> <strong>0</strong>
						</div>
						<div class="order_menu">
							배송준비중<br> <strong>0</strong>
						</div>
						<div class="order_menu">
							배송중<br> <strong>0</strong>
						</div>
						<div class="order_menu">
							배송완료<br> <strong>0</strong>
						</div>
						<div class="order_menu2">
							<ul>
								<li>취소:<strong>0</strong>
								</li>
								<li>교환:<strong>0</strong>
								</li>
								<li>반품:<strong>0</strong>
								</li>
							</ul>
						</div>
					</div>
					<!--최근 주문 정보-->
					<div id="order_info">
						<p>최근 주문 정보</p>
						<hr style="margin: 10px">
						<div class="order_box_or">
							<table>
								<colgroup>
									<col width="2%">
									<col width="20%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<td><input type="checkbox" checked class="neHeros cbox" 
										value="" onChange="allCheckedBox(this);" /></td>
										<td class="order_box_or_img">상품정보</td>
										<td>수량</td>
										<td>상품금액</td>
										<td>할인/적립</td>
										<td>배송비</td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="checkbox" checked class="neHeros cbox" 
										value="W" onChange="eachCheckedBox(this);"></td>
										<td class="order_box_or_img">
											<a href="../goods/woman_perfume_detail.html"> 
												<img src="/resources/img/perfume/woman_perfume_1.jpeg"><br>
													킬리안 엔젤스 셰어 50ml</a>
										</td>
										<td>1개</td>
										<td>256,500</td>
										<td>적립 2500p</td>
										<td>배송비무료</td>
									<tr>
								</tbody>
							</table>
						</div>
						<!--최근 본 상품-->
						<div id="order_new">
							<p>최근 본 상품</p>
							<hr>
							<c:forEach items="${recent }" var="product">
								<div>
									<a href="/goods/detail?pcode=${product.pcode }">
										<img src="${product.purl }">
									</a> <span>${product.pname }<br>${product.price }원</span>
								</div>

							</c:forEach>
						</div>
					</div>
				</div>
				<div class="col-1"></div>
			</div>
			<!-- MyPage Area End -->
		</div>
		<!-- Footer Area -->
		<%@ include file="/WEB-INF/views/headerFooter/footer.jsp" %> 
		<!-- Footer Area End -->
	</div>
</body>
</html>