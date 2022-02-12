<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="/resources/css/header.css">
<link type="text/css" rel="stylesheet" href="/resources/css/footer.css">
<link type="text/css" rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/resources/css/cart.css">
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
		<!-- Cart Area -->
		<div id="cart">
			<div class="row">
				<div class="offset-2 col-8">
					<!-- 제목 -->
					<h1 id="cart_title" class="py-5 my-5">Cart</h1>
				</div>
			</div>
			<div class="row offset-2" id="cart_count">
			<h2>총2개의 상품</h2>
			</div>
			<div class="row">
				<div class="col-8 offset-2" id="product">
					<hr>
					<table id="cart_table">
						<colgroup>
							<col width="2%">
							<col width="30%">
							<col width="14%">
							<col width="15%">
							<col width="15%">
							<col width="15%">
						</colgroup>
						<tr>
							<th><input type="checkbox" checked class="neHeros cbox" onChange="allCheckedBox(this);" /></th>
							<th>상품정보</th>
							<th>수량</th>
							<th>상품금액</th>
							<th>할인/적립</th>
							<th>합계</th>
							<th>배송비</th>
						</tr>
						<c:forEach items="${products }" var="product">
						<tr>
							<td><input type="checkbox" checked class="neHeros cbox" onChange="eachCheckedBox(this);" /></td>
							<td><img src="${product.purl}" class="img_size"></td>
							<td>1개</td>
							<td>{product.price}</td>
							<td>적립300p</td>
							<td>38,880</td>
							<td>배송비무료</td>
						</tr>
						</c:forEach>
					</table>
					<div>
					<button type="button" class="btn btn-secondary">선택상품  삭제</button>
					</div>		
				</div>
			</div>
			<div class="row offset-2">
				<div class="col-9" id="order">
					<div class="order_product">
						총 상품금액<br>
					</div>
					<div class="order_product">
						배송비
					</div>
					<div class="order_product">
						할인금액
					</div>
					<div class="order_product">
						총 주문금액
					</div>
				</div>
			</div>
			<div class="row  offset-5">
					<div>
					<button type="button" class="btn btn-secondary" class="btn">쇼핑 계속하기</button>
					<button type="button" class="btn btn-secondary" class="btn">선택상품 주문</button>
					</div>
			</div>
		</div>
		<!-- Cart Area End-->
		 <!-- Footer Area -->
		<%@ include file="/WEB-INF/views/headerFooter/footer.jsp" %> 
		<!-- Footer Area End -->
	</div>
</body>
</html>