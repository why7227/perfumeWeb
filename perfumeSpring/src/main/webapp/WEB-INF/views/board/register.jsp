<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/shopping.css">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="/resources/css/header.css">
<link type="text/css" rel="stylesheet" href="/resources/css/footer.css">
<link type="text/css" rel="stylesheet" href="/resources/css/review.css">
<link type="text/css" rel="stylesheet"href="/resources/bootstrap/bootstrap.min.css">

<script type="text/javascript" src="/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<script type="text/javascript" src="/resources/js/review.js"></script>
</head>
<body>
	<div class="container-fluid">
		<!-- Header Area -->
	  	<%@ include file="/WEB-INF/views/headerFooter/header.jsp" %> 
		<!-- Header Area End -->
		<!-- Write Area-->
		<div class="row">
			<div class="col-8 offset-2">
				<div class="row my-5 py-5">
					<div class="col-8 offset-2 align-middle">
						<h1 class="text-center">Review</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<form action="/board/register" method="post">
							<table class="table">
								<tbody>
									<tr>
										<td>
											<div class="form-floating">
												<input type="text" name="writer" class="form-control" id="floatingInput"
													placeholder="이름을 입력해주세요" value='<c:out value="${member.name}"/>'><label
													for="floatingInput" >이름</label>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-floating">
												<input type="text" name="title" class="form-control" id="floatingInput"
													placeholder="제목을 입력해주세요"> <label
													for="floatingInput">제목</label>
											</div>
										</td>
									</tr>
									<tr>
										<td>
											<div class="form-floating">
												<textarea class="form-control" name="content" placeholder="내용을 입력해주세요"
													id="floatingTextarea" style="height: 500px;"></textarea>
												<label for="floatingTextarea">내용</label>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="col d-flex justify-content-end">
								<div class="btn-group" role="group">
									<button type="submit" class="btn btn-outline-secondary"
										id="btn_write">작성</button>
									<a class="btn btn-outline-secondary" href="/board/list"
										role="button">목록</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Write Area End-->
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/footer.jsp" %> 
		<!-- Header Area End -->
	</div>
</body>
</html>














