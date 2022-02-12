<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
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
$(".chat")
		.on(
				"click",
				"li",
				function(e) {
					var rno = $(this).data("rno");
					replyService
							.get(
									rno,
									function(reply) {
										modalInputReply
												.val(reply.reply);
										modalInputReplyer
												.val(reply.replyer);
										modalInputReplyDate
												.val(
														replyService
																.displayTime(reply.replyDate))
												.attr(
														"readonly",
														"readonly");
										modal
												.data(
														"rno",
														reply.rno);

										modal
												.find(
														"button[id != 'modalCloseBtn']")
												.hide();
										modalModBtn
												.show();
										modalRemoveBtn
												.show();

										$(".modal")
												.modal(
														"show");
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
modalRemoveBtn.on("click", function(e) {var rno = modal.data("rno");
	replyService.remove(rno, function(result) {

		alert(result);
		modal.modal("hide");
		showList(1);
	});
});
});

</script>
</body>
</html>