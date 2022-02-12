<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="/resources/css/header.css">
<link type="text/css" rel="stylesheet" href="/resources/css/footer.css">
<link type="text/css" rel="stylesheet" href="/resources/css/review.css">
<link type="text/css" rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<script type="text/javascript" src="/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<script type="text/javascript" src="/resources/js/review.js"></script>
<title>Insert title here</title>
</head>
<body>
	<form action="/board/modify" method="post">
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
		<!-- Header Area End -->
		<!-- Modify Area-->
		<div class="row">
			<div class="col-8 offset-2">
				<div class="row my-5 py-5">
					<div class="col-8 offset-2 align-middle">
						<h1 class="text-center">Review</h1>
					</div>
				</div>
				<div class="row">
					<div class="col-12">
						<input type="hidden" name="bno" value='<c:out value="${board.bno}"/>'>
						<table class="table">
							<tbody>
								<tr>
									<td>
										<div class="form-floating">
											<input type="text" name="writer" class="form-control"
												id="floatingInput" placeholder="이름을 입력해주세요" value='<c:out value="${board.writer}"/>'> <label
												for="floatingInput">작성자명</label>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-floating">
											<input type="text" name="title" class="form-control"
												id="floatingInput" placeholder="제목을 입력해주세요"> <label
												for="floatingInput"><c:out value="${board.title}"/></label>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-floating">
											<textarea class="form-control" name="content"
												placeholder="내용을 입력해주세요" id="floatingTextarea"
												style="height: 500px;"></textarea>
											<label for="floatingTextarea"><c:out value="${board.content}"/></label>
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-floating">
											<input type="text" name="regdate" class="form-control"
												id="floatingInput" readonly="readonly" value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.regdate}"/>'> 
												<label for="floatingInput">등록일자</label>
										</div>
									</td>
								</tr>
<tr>
									<td>
										<div class="form-floating">
											<input type="text" name="updateDate" class="form-control"
												id="floatingInput" readonly="readonly" value='<fmt:formatDate pattern = "yyyy/MM/dd" value="${board.updateDate}"/>'>
												<label for="floatingInput">수정일자</label>
										</div>
									</td>
								</tr>

							</tbody>
						</table>
						<div class="col d-flex justify-content-end">
							<div class="btn-group" role="group">
								<button class ="btn btn-outline-secondary" data-oper="modify" type="submit">수정</button>
								<button class ="btn btn-outline-secondary" data-oper="list" type="submit">목록</button>
							</div>
							<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
							<input type='hidden' name='amount' value='<c:out value="${cri.amount }"/>'>
							<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
							<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
						</div>
					</div>
				</div>
			</div>
			<!-- Modify Write Area End-->
			<!-- Header Area -->
			<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
			<!-- Header Area End -->
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form");
			$('button').on("click",function(e){
				e.preventDefault();
				
				var operation = $(this).data("oper");
				console.log(operation);
				
				if(operation === 'list') {
					formObj.attr("action","/board/list").attr("method","get");
					var pageNumTag = $("input[name='pageNum']").clone();
					var amountTag = $("input[name='amount']").clone();
					var keywordTag = $("input[name='keyword']").clone();
					var typeTag = $("input[name='type']").clone();
					
					formObj.empty();
					formObj.append(pageNumTag);
					formObj.append(amountTag);
					formObj.append(keywordTag);
					formObj.append(typeTag);

				}
				formObj.submit();
			});
		});
	</script>
</body>
</html>