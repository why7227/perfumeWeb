<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="Context-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="/resources/css/header.css">
<link type="text/css" rel="stylesheet" href="/resources/css/footer.css">
<link type="text/css" rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/resources/css/main.css">
<link type="text/css" rel="stylesheet" href="/resources/jquery/jquery.bxslider.min.css">
<script type="text/javascript" src="/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/member.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<script type="text/javascript" src="/resources/jquery/jquery.bxslider.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container-fluid">
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
		<!-- Header Area End -->
		<!-- Index Main Area -->
		<!-- 메인 이미지(부트스트랩 이용) -->
		<div>
			<div id="carouselExampleIndicators" class="carousel slide"
				data-bs-ride="carousel">
				<div class="carousel-indicators">
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="0" class="active" aria-current="true"
						aria-label="Slide 1"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="1" aria-label="Slide 2"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="2" aria-label="Slide 3"></button>
					<button type="button" data-bs-target="#carouselExampleIndicators"
						data-bs-slide-to="3" aria-label="Slide 4"></button>
				</div>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<a href="/goods/woman"> <img
							src="/resources/img/slide/slide_woman_01.jpg" class="d-block w-100"
							alt="슬라이드 1번이미지">
						</a>
					</div>
					<div class="carousel-item">
						<a href="/goods/man"> <img
							src="/resources/img/slide/main2.png" class="d-block w-100"
							alt="슬라이드 2번이미지">
						</a>
					</div>
					<div class="carousel-item">
						<a href="/goods/candle"> <img
							src="/resources/img/slide/main3.jpg" class="d-block w-100"
							alt="슬라이드 3번이미지">
						</a>
					</div>
					<div class="carousel-item">
						<a href="/goods/defuser"> <img
							src="/resources/img/slide/main4.jpg" class="d-block w-100"
							alt="슬라이드 4번이미지">
						</a>
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<!-- 메인 향수 글귀 -->
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8" id="main_phrase">
				<p>
					"향수는 새 드레스와 같아서 당신을 아주 멋지게 만듭니다." - 에스티 로더<br> "Perfume is
					like a new dress, it makes you quite simply marvelous." - Estee
					Lauder
				</p>
				<br>
				<p>
					"향수는 냄새의 이야기이며, 때로는 기억의 시이기도 합니다." - 장 끌로드 엘레나<br> "Perfume is
					a story in odor, sometimes poetry in memory." - Jean Claude Ellena
				</p>
				<div class="col-2"></div>
			</div>
		</div>
		<!-- 신제품 -->
		<c:forEach items="${nProduct }" var="products" varStatus="status">
            <div class="row" id="bestitem">
                <div class="col-1"></div>
                <div class="col-10" id="man_best">
                	<div>
	                    <h2><c:choose>
	                    <c:when test="${status.index eq 0}">Man New Product</c:when>
	                    <c:when test="${status.index eq 1}">Woman New Product</c:when>
	                    <c:when test="${status.index eq 2}">Defuser New Product</c:when>
	                    <c:when test="${status.index eq 3}">Candle New Product</c:when>
	                    </c:choose></h2>
                    </div>
                    <!-- <div>
	                    <a src=""style="text-align:right;">more</a>
	                    <img src="/resources/img/icon/right-arrow.png" style="width:20px; height:20px;">
                    </div> -->
                    <hr>
                    <c:forEach items="${products }" var="product">
                    <div>
                        <a href="/goods/detail?pcode=${product.pcode }">
                            <img src="${product.purl }">
                        </a>
                        <span>${product.pname }</span><br><span class = "main_price">${product.price }</span><span>원</span>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-1"></div>
        </c:forEach>
		<!-- Index Main Area End -->
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
		<!-- Header Area End -->
	</div>
</body>
</html>