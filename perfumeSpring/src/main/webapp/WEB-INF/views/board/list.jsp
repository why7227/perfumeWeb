<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link type="text/css" rel="stylesheet"
	href="/resources/bootstrap/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="/resources/css/header.css">
<link type="text/css" rel="stylesheet" href="/resources/css/footer.css">
<link type="text/css" rel="stylesheet"
	href="/resources/css/review.css">
<script type="text/javascript" src="/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/jquery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<script type="text/javascript" src="/resources/js/review.js"></script>

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<body>

	<div class="contaner-fluid">
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
		<!-- Header Area End -->
		<!-- ListPage Area -->
		<div class="row" id="listpage">
			<div class="col-8 offset-2">
				<div class="row my-5 py-5">
					<div class="col-8 offset-2 align-middle">
						<h1 class="text-center">Review</h1>
					</div>
				</div>
				<div class="row" id="listPage">
					<div class="col-12">
						<div class="row">
							<!-- 게시글 왼쪽 위 총게시물 수 -->
							<div class="col-3">
								<h5 class="align-middle">
									총 게시글 수 : <span>${pageMaker.total}</span>개
								</h5>
							</div>
							<!-- 검색창 -->
							<div class="col-5 offset-4">
								<form id='searchForm' action="/board/list" method="get">
									<div class="input-group">
										<select name="type" class="form-select" aria-label="Default select example">
											<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>전체</option>
											<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
											<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
											<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
										</select>
										<input type="text" name="keyword" class="form-control" placeholder="입력하세요."
										aria-label="Example text with two button addons" style="width:50%;"
										 value='<c:out value="${pageMaker.cri.keyword}"/>'/>
										<input type="hidden" name='pageNum'
										value='<c:out value="${pageMaker.cri.pageNum}"/>'/>
										<input type="hidden" name='amount'
										value='<c:out value="${pageMaker.cri.amount}"/>'/>
			                            <button class="btn btn-outline-secondary" type="button">검색</button>
			                        </div>
		                        </form>
	                        </div>
							<!-- 테이블 -->
							<div class="col-12">
								<table class="table table-hover">
									<thead>
										<tr>
											<th scope="col">No.</th>
											<th scope="col">Title.</th>
											<th scope="col">Author.</th>
											<th scope="col">Date.</th>
										</tr>
									<tbody id="review_list">
										<c:forEach items="${list}" var="board">
											<tr>
												<td scope="row"><c:out value="${board.bno}" /></td>
												<td><a class="move"
													href='<c:out value="${board.bno}"/>'> <c:out
															value="${board.title}" />
															<b>[ <c:out value="${board.replyCnt}"/> ]</b>
												</a></td>
												<td>${board.writer}</td>
												<td><fmt:formatDate value="${board.regdate}" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<!-- modal -->
								<div id="myModal" class="modal" tabindex="-1">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title">Modal title</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">
												<p>완료!</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">success</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- paging -->
							<div class="row" style="margin-left: 23%">
								<nav aria-label="Page navigation example">
									<ul class="pagination">
										<c:if test="${pageMaker.prev}">
											<li class="page-item"><a class="page-link"
												href="${pageMaker.startPage-1}">Previous</a></li>
										</c:if>
										<c:forEach var="num" begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}">
											<li
												class='page-item ${pageMaker.cri.pageNum ==  num ? "active":""} '>
												<a class="page-link" href="${num}">${num}</a>
											</li>
										</c:forEach>
										<c:if test="${pageMaker.next}">
											<li class="page-item"><a class="page-link"
												href="${pageMaker.endPage+1}">Next</a></li>
										</c:if>
										<li class="col-4 d-flex justify-content-end align-items-start">
											<a href="/board/register">
												<button type="button" class="btn btn-outline-secondary"
													id="btn_write">글작성</button>
										</a>
										</li>
									</ul>
								</nav>
							</div>
							<form id="actionForm" action="/board/list" method='get'>
								<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
								<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
								<input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
								<input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
							</form>
						</div>
					</div>
				</div>
				<!-- List Area End -->
			</div>
		</div>
		<!-- Footer Area -->
		<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
		<!-- Footer Area End -->
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var result = '<c:out value="${result}"/>';
			checkModal(result);
			history.replaceState({}, null, null);

		function checkModal(result) {
			if (result === '' || history.state) {
				return;
			}
			
			if (parseInt(result) > 0) {
				$(".modal-body").html("게시글 " + parseInt(result)
									  + " 번이 등록되었습니다.");
								}
				$("#myModal").modal("show");
							}
				$("#btn_write").on("click", function() {
						self.location = "/board/register";
					});

				var actionForm = $("#actionForm");
					$(".page-item a").on("click",function(e) {
						e.preventDefault();
						console.log('click');
						actionForm.find("input[name='pageNum']").val($(this).attr("href"));
						actionForm.submit();
						});
					
				$(".move").on("click",function(e) {
					e.preventDefault();
					actionForm.append("<input type='hidden' name='bno' value='"
										+ $(this).attr("href")+ "'>");
					actionForm.attr("action","/board/content");
					actionForm.submit();
					});
				});
		
		var searchForm = $("#searchForm");
		$("#searchForm button").on("click",function(e) {
			if(!searchForm.find("option:selected").val()) {
				alert("검색종류를 선택하세요");
				return false;
			}
			
			if(!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력해주세요.");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			e.prevenDefault();
			
			searchForm.submit();
		});
	
	</script>
</body>
</html>