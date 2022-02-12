// 게시판 수정,삭제시 비밀번호 확인하는 스크립트
function open_win(url, name) {
	window.open(url, name, "width=500, height=230");
}
function passCheck() {
	if (document.frm.bPass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}