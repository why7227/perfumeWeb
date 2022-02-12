<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">

    <link type="text/css" rel="stylesheet" href="/resources/css/common.css">
    <link type="text/css" rel="stylesheet" href="/resources/css/header.css">
    <link type="text/css" rel="stylesheet" href="/resources/css/footer.css">
    <link type="text/css" rel="stylesheet" href="/resources/css/goods/product_detail.css">

    <!--jquery 구버전 사용-->
    <script type="text/javascript" src="/resources/jquery/jquery.js"></script>

    <script type="text/javascript" src="/resources/js/header.js"></script>
<title>Insert title here</title>
</head>

<body>
	<div class="container-fluid" id="header">
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
		<!-- Header Area End -->
		
		
		<!-- Woman_perfume_detail Area -->
		<div class="row" id="list">
		<input type="hidden" name="pcode" value="${product.pcode }">
			<!--왼쪽 이미지 시작-->
			<div class="col-1"></div>
			<div class="col-5">
				<div id="img_box">
					<img src="${product.purl }">
				</div>
			</div>
			<!--오른쪽 상세목록페이지 시작-->
			<div class="col-5" id="detail_right">
				<div id="perfum_name">
					<p>${product.pname }</p>
				</div>
				<div class="col">
					<ul class="list_box1">
						<li class="li-1">상품명 :<span> ${product.pname }</span></li>
						<li class="li-1">판매가 :<span> ${product.price }원</span></li>
					</ul>
				</div>
				<div class="col-10" id="btn">
						<button onclick="location.href='#'" class="btn_1">바로 구매하기</button>
						<button type="submit" class="btn_2" >장바구니</button>
				</div>
				<!--금액칸-->
				<div class="col">
					<div class="money_box">
                  <select id="amount">
                     <option value="1">1개</option>
                     <option value="2">2개</option>
                     <option value="3">3개</option>
                     <option value="4">4개</option>
                     <option value="4">5개</option>
                     <option value="4">6개</option>
                     <option value="4">7개</option>
                     <option value="4">8개</option>
                     <option value="4">9개</option>
                     <option value="4">10개</option>
                  </select> <span class="t_t">총 상품금액 : <span id="price">${product.price }</span>원</span>
               </div>
            </div>
         </div>
         <div class="col-1"></div>
         <!--상세정보 시작-->
         <div class="row">
            <div class="col">
               <p>상세정보</p>
               <c:if test="${not empty product.des1}">
               <div class="long">
                  <img class="long_img" src="${product.des1 }" onerror="this.style.display='none'">
               </div>
               </c:if>
               <c:if test="${not empty product.des2}">
               <div class="long">
                  <img class="long_img" src="${product.des2 }"onerror="this.style.display='none'">
               </div>
               </c:if>
               <c:if test="${not empty product.des3}">
               <div class="long">
                  <img class="long_img" src="${product.des3 }"onerror="this.style.display='none'">
               </div>
               </c:if>
               <div class="Top_btn">
                  <a href="#"><button class="button">TOP</button></a>
               </div>
            </div>
         </div>
		<!-- Footer Area -->
	  	<%@ include file="/WEB-INF/views/headerFooter/footer.jsp" %> 
		<!-- Footer Area End -->
	</div>
	</div>
</body>
</html>