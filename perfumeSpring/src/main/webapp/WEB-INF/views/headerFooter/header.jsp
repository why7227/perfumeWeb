<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="header">
	<!-- 제목위 빈여백 div -->
	<div class="row" id="blank_top">
		<div class="col-12"></div>
	</div>
	<div class="row" id="header_title">
		<!--로고-->
		<div class="col-4" id="logo">
			<a href="/index">
				<h1>Sentir L'odeur</h1>
			</a>
		</div>
		<!-- 네비메뉴 3가지 -->
		<div class="col-4" id="header_nav">
			<ul class="nav justify-content-center">
				<li class="nav-item" id="nav1"><a class="nav-link" href="#">Perfume</a>
					<ul class="nav_hide">
						<li><a href="/goods/man" id="man_c">Man</a></li>
						<li><a href="/goods/woman" id="woman_c">Woman</a></li>
					</ul>
				</li>
				<li class="nav-item"><a class="nav-link" href="/goods/defuser">Defuser</a></li>
				<li class="nav-item"><a class="nav-link" href="/goods/candle">Candel</a></li>
				<li class="nav-item"><a class="nav-link" href="/board/list">Review</a></li>
			</ul>
		</div>
		<!-- 아이콘 -->
		<div class="col-4" id="header_icon">
			<ul>
				<c:choose>
					<c:when test="${empty loginUser}">
						<li class="icon1">
						<a href="/login.do" class="icon_margin">
								<img src="/resources/img/icon/header_login_icon.png" alt="로그인이미지"></a>
						<h5>login</h5></li>
					</c:when>
					<c:otherwise>
						<li class="icon1">
						<a href="/logout.do" class="icon_margin">
								<img src="/resources/img/icon/header_login_icon.png" alt="로그인이미지"></a>
						<h5>logout</h5></li>
					</c:otherwise>
				</c:choose>
				<li class="icon1">
					<a href="/mypage" class="icon_margin">
					<img src="/resources/img/icon/header_mypage_icon.png" alt="마이페이지 이미지"></a>
					<h5>mypage</h5>
				</li>
				<li class="icon1">
					<a href="/cart" class="icon_margin">
					<img src="/resources/img/icon/header_cart_icon.png" alt="장바구니 이미지"></a>
					<h5>cart</h5>
				</li>
			</ul>
		</div>
	</div>
</div>