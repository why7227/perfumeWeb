function boardCheck() {
	if (document.frm.bName.value.length == 0) {
		alert("작성자를 입력하세요.");
		return false;
	}
	if (document.frm.bPass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if (document.frm.bTitle.value.length == 0) {
		alert("제목을 입력하세요.");
		return false;
	}
	if (document.frm.bDto.getbPass === bPass) {
		alert("비밀번호맞다");
		return false;
	}
	return true;
}

function open_win(url, bname) {
	window.open(url, bname, "width=500, height=230");
}

function passCheck() {
	if (document.frm.bPass.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	return true;
}

