<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="/resources/css/header.css">
<link type="text/css" rel="stylesheet" href="/resources/css/footer.css">
<link type="text/css" rel="stylesheet" href="/resources/css/goods/product.css">
<script type="text/javascript" src="/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<title>d</title>
</head>
<body>
	<div class="container-fluid">
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
		<!-- Header Area End -->
		<!-- Woman_perfume_Area -->
		<div class="row" id="woman_page">
			<div class="row my-5 py-5">
				<div class="col-8 offset-2 align-middle">
					<!-- 제목 -->
					<h1 class="text-center">${cateName}</h1>
				</div>
			</div>
			<div class="col-8 offset-2">
				<div class="row" id="here">
					<c:forEach items="${products}" var="product">
						<div class='col-3'>
							<div class='row' id='img'>
								<div class='head'>
									<a href="/goods/detail?pcode=${product.pcode}"> <img
										class='img' src="${product.purl}">
									</a>
								</div>
								<div class='col' id="namePrice">
									<a href="/goods/detail?pcode=${product.pcode}"> <span>${product.pname}</span>
										<br> <span>${product.price}원</span>
									</a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div
				class="col-4 offset-4 d-flex justify-content-center align-items-start">
				<nav aria-label="Page navigation">
					<ul class="pagination">
						<li class="page-item disabled"><span class="page-link"
							id="prev">이전</span></li>
						<li class="page-item active" aria-current="page"><span
							class="page-link">1</span></li>
						<li class="page-item"><a class="page-link" href="#" id="next">다음</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- Woman_perfume_detail Area End-->
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
		<!-- Header Area End -->
	</div>
</body>
</html>