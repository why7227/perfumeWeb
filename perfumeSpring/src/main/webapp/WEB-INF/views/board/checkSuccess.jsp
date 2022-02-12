<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/board.js"></script>
</head>
<body>
<!-- 게시글 수정과 삭제를 위한 페이지 --> 
<script type="text/javascript">
	if(window.name == "modify") {
		window.opener.parent.location.href="/board/modify?bno=${board.bno }";
	} else if(window.name=='remove') {
		alert('삭제되었습니다.');
		window.opener.parent.location.href = "/board/remove?bno=${board.bno }";
	}
window.close();

</script>
</body>
</html>