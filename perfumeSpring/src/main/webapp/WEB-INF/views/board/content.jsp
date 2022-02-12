<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resources/css/common.css">
<link type="text/css" rel="stylesheet" href="/resources/css/header.css">
<link type="text/css" rel="stylesheet" href="/resources/css/footer.css">
<link type="text/css" rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
<link type="text/css" rel="stylesheet" href="/resources/css/review.css">
<script type="text/javascript" src="/resources/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/jquery/jquery-3.6.0.js"></script>
<script type="text/javascript" src="/resources/js/member.js"></script>
<script type="text/javascript" src="/resources/js/header.js"></script>
<script type="text/javascript" src="/resources/js/review.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid">
		<!-- Header Area -->
		<%@ include file="/WEB-INF/views/headerFooter/header.jsp"%>
		<!-- Header Area End -->
		<!-- Content Area -->
		<div class="row">
			<div class="col-8 offset-2">
				<div class="row my-5 py-5">
					<div class="col-8 offset-2 align-middle">
						<h1 class="text-center">Review</h1>
					</div>
				</div>
				<div class="row bot_line">
					<div class="col-6 d-flex">
						<h6>제목 : ${board.title }</h6>
					</div>
					<div class="col-4 offset-2 d-flex justify-content-end">
						<h6>${board.writer }|
							<fmt:formatDate value="${board.regdate}" />
						</h6>
					</div>
				</div>
				<div class="row bot_line">
					<div class="col-12" style="margin-bottom:200px">
						<p>
							<br> ${board.content } <br>
						</p>
					</div>
				</div>
				<!-- 목록,수정,삭제버튼 -->
				<div class="row mt-3">
					<div class="col-6 offset-6 d-flex justify-content-end">
						<div class="btn-group" role="group">
							<input type="button" class="btn btn-outline-secondary"
								data-oper='list' value="목록">
							<input type="button" id="contentRemove" class="btn btn-outline-secondary"
								data-oper='remove' value="삭제">
							<input type="button" class="btn btn-outline-secondary"
								data-oper='modify' value="수정">

							<form id='operForm' action="/board/modify" method="get">
								<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'> 
								<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
								<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'> 
								<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
								<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 댓글 -->
		<div class='row'">
			<div class="col-lg-8 offset-2">
				<div class="panel panel-default">
					<div class="panel-heading">
						<img src="/resources/img/icon/reply.png" style="width: 20px;height: 20px"/>
						<i class="fa fa-comments fa-fw"></i>reply
						<button id='addReplyBtn' class="btn btn-outline-secondary">댓글</button>
					</div>
					<hr>
					<div class="panel-body">
						<ul class="chat">
							<!-- start reply -->
							<li class="left clearfix" data-rno='12'>
								<div>
									<div class="header">
										<strong class="primary-font">user00</strong>
										<small class="pull-right text-muted">2018-01-01 13:13</small>
									</div>
									<p>Good job!</p>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>댓글</label> <input class="form-control" name='reply'
								value='New Reply!!!!'>
						</div>
						<div class="form-group">
							<label>작성자</label> <input class="form-control" name='replyer'
								value='replyer'>
						</div>
						<div class="form-group">
							<label>Reply Date</label> <input class="form-control"
								name='replyDate' value=''>
						</div>
					</div>
					<div class="modal-footer">
						<button id='modalModBtn' type="button" class="btn btn-outline-secondary">Modify</button>
						<button id='modalRemoveBtn' type="button" class="btn btn-outline-secondary">Remove</button>
						<button id='modalRegisterBtn' type="button" class="btn btn-outline-secondary">Register</button>
					</div>
				</div>
			</div>
		</div>
		<!-- Content Detail Area End-->
		<!-- Footer Area -->
		<%@ include file="/WEB-INF/views/headerFooter/footer.jsp"%>
		<!-- Footer Area End -->
	</div>
	
	<script type="text/javascript">
		$(document).ready(function() {
			var operForm = $("#operForm");

			$("input[data-oper='remove']").on("click", function(e) {
				operForm.attr("action", "/board/remove").submit();
			});

			$("input[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "/board/modify").submit();
			});

			$("input[data-oper='list']").on("click", function(e) {
				operForm.find("#bno").remove();
				operForm.attr("action", "/board/list")
				operForm.submit();
			});
		});
		
		// 페이지열릴때 자동으로 댓글목록 가져오기
		$(document).ready(function() {
			var bnoValue = '<c:out value="${board.bno}"/>';
			var replyUL = $(".chat");

			showList(1); // 파라미터가 없다면 자동1페이지

		function showList(page) {replyService.getList({
				bno : bnoValue,
				page : page || 1 },
				
		function(list) {
			var str = "";
			
			if (list == null || list.length == 0) {
			replyUL.html("");
			return;
			}
			
		for (var i = 0, len = list.length || 0; i < len; i++) {
			str += "<li class='left clearfix' data-rno='"+list[i].rno+"'>";
			str += "    <div><div class='header'><strong class='primary-font'>"
			+ list[i].replyer + "</strong>";
			str += "        <small class='pull-right text-muted'>"
			+replyService.displayTime(list[i].replyDate) + "</small></div>";
															
			str += "            <p>"
			+ list[i].reply
			+ "</p></div></li>"
			+ "<hr>";
			}
			replyUL.html(str);
		});
	}

		//댓글 버튼 이벤트처리
		var modal = $(".modal");
		var modalInputReply = modal
			.find("input[name='reply']");
		var modalInputReplyer = modal
			.find("input[name='replyer']");
		var modalInputReplyDate = modal
			.find("input[name='replyDate']");
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");
	
		$("#addReplyBtn").on("click",function(e) {
		modal.find("input").val("");
		modalInputReplyDate.closest("div")
			.hide();
		modal.find("button[id!='modalCloseBtn']")
			.hide();
		modalRegisterBtn
			.show();
		
		$(".modal").modal("show");
		});

		//댓글 등록버튼 
		modalRegisterBtn.on("click", function(e) {
			var reply = {
				reply : modalInputReply.val(),
				replyer : modalInputReplyer.val(),
				bno : bnoValue
				};
			replyService.add(reply, function(result) {
				alert(result);
				modal.find("input").val("");
				modal.modal("hide");
				showList(1);
					});
				});

		// li 클릭시 수정,삭제 버튼 보이게!
		$(".chat").on("click","li",function(e) {
			var rno = $(this).data("rno");
		replyService.get(rno,function(reply) {
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
				.attr("readonly","readonly");
			modal.data("rno",reply.rno);

			modal.find("button[id != 'modalCloseBtn']").hide();
			modalModBtn.show();
			modalRemoveBtn.show();

			$(".modal").modal("show");
				});
			});

		// 댓글 수정 버튼
		modalModBtn.on("click", function(e) {
			var reply = {
				rno : modal.data("rno"),
				reply : modalInputReply.val()
				};
			
			replyService.update(reply, function(result) {

				alert(result);
				modal.modal("hide");
				showList(1);
					});
				});

		// 댓글 삭제 버튼
		modalRemoveBtn.on("click", function(e) {
		var rno = modal.data("rno");
		replyService.remove(rno, function(result) {

		alert(result);
		modal.modal("hide");
		showList(1);
				});
			});
		});

		
/* 	 테스트
	$("#contentRemove").click(function() {
			var count = "${replyCnt}";
			if(count > 0) {
				alert("댓글이 있는 게시물은 삭제할 수 없습니다.")
				return;
			}
		});
 
		<!--console.log("-----------------------------------------------------");
		console.log("JS TEST");
		
		var bnoValue = '<c:out value = "${board.bno}"/>';
		
		replyService.add(
		{reply:"JS TEST", replyer:"tester", bno:bnoValue},
		function(result) {
			alert("RESULT: " + result);
		}
		);
		
		 	//댓글 전체 목록보기
		console.log("-----------------------------------------------------");
		console.log("JS TEST");
		
		var bnoValue = '<c:out value = "${board.bno}"/>';
		replyService.getList({bno:bnoValue, page:1},function(list) {
			for(var i = 0, len = list.length||0; i<len; i++) {
				console.log(list[i]);
			}
		});
		
		// 삭제
		console.log("-----------------------------------------------------");
		console.log("JS TEST");
		
		var bnoValue = '<c:out value = "${board.bno}"/>';
		replyService.remove(21,function(count) {
			console.log(count);
			if(count === "success") {
				alert("removed");
			}
			},function(err) {
				alert('ERROR....');
		});
		
		// 수정
		console.log("-----------------------------------------------------");
		console.log("JS TEST");
		var bnoValue = '<c:out value = "${board.bno}"/>';
		replyService.update({
			rno:2,
			bno:bnoValue,
			reply:"js Modifide Reply..."
		}, function(result) {
			alert("수정완료.....");
		
		});
		
		//댓글조회처리
		console.log("=================");
		console.log("JS TEST");
		
		var bnoValue='<c:out value="${board.bno}"/>';
		replyService.get(2, function(data) {
			console.log(data);
		});   */
	</script>
</body>
</html>