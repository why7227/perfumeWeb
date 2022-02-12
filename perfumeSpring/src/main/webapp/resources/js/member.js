function loginCheck() {
	if(document.frm.userid.value.length == 0) {
		alert('아이디를 입력해주세요:D');
		frm.userid.focus();
		return false;
	}
	
	if(document.frm.pwd.value.length == 0) {
		alert('비밀번호를  입력해주세요:D');
		frm.pwd.focus();
		return false;
	}
	return true;
}

function idFind() {
	var url = "/idFind";
	window.open(url, "_blank_1",
	"toolbar=yes, menubar=no, scrollbar=yes, resizable=yes, width=450, height=200");
}

function joinCheck() {
	 var pw = $("#password").val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(document.frm.name.value.length == 0) {
		alert('이름을  입력해주세요:D');
		frm.name.focus();
		return false;
	}
	
	if(document.frm.birth.value.length == "") {
		alert('생년월일을 입력해주세요:D');
		frm.birth.focus();
		return false;
	}
	
	if(document.frm.userid.value.length < 6) {
		alert('아이디는 6글자 이상 작성해야 합니다.')
		frm.userid.focus();
		return false;
	}

	if(document.frm.pwd.value == "") {
		alert("비밀번호는 반드시 입력해야 합니다.");
		frm.pwd.focus();
		return false;
	}
	
	if(document.frm.pwd.value != document.frm.pwd_check.value) {
		alert('비밀번호가 일치하지 않습니다.')
		frm.pwd.focus();
		return false;
	}
	
	if(pw.length < 8 || pw.length > 20){
	  alert("8자리 ~ 20자리 이내로 입력해주세요:D");
	  return false;
	 }else if(pw.search(/\s/) != -1){
	  alert("비밀번호는 공백 없이  입력해주세요:D");
	  return false;
	 }else if(num < 0 || eng < 0 || spe < 0 ){
	  alert("영문,숫자, 특수문자를 혼합하여  입력해주세요:D");
	  return false;
	 }

	if(document.frm.email.value.length == 0) {
		alert('이메일   입력해주세요:D');
		frm.email.focus();
		return false;
	}
		
	if(document.frm.address.value.length == 0) {
		alert('주소를   입력해주세요:D');
		frm.address.focus();
		return false;
	}
		
	if(document.frm.addressDetail.value.length == 0) {
		alert('상세주소를   입력해주세요:D');
		frm.address.focus();
		return false;
	}
	
	if(document.frm.phone.value.length == 0) {
		alert('핸드폰 번호를  입력해주세요:D');
		frm.phone.focus();
		return false;
	}
	  if(confirm("회원가입을 하시겠습니까?")){
        alert("회원가입을 축하합니다");
	return true;
	}
}



function updateCheck() {
	 var pw = $("#password").val();
	 var num = pw.search(/[0-9]/g);
	 var eng = pw.search(/[a-z]/ig);
	 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
	
	if(document.frm.name.value.length == 0) {
		alert('이름을  입력해주세요:D');
		frm.name.focus();
		return false;
	}
	
	if(document.frm.birth.value.length == "") {
		alert('생년월일을 입력해주세요:D');
		frm.birth.focus();
		return false;
	}
	
	if(document.frm.userid.value.length < 6) {
		alert('아이디는 6글자 이상 작성해야 합니다.')
		frm.userid.focus();
		return false;
	}

	if(document.frm.pwd.value == "") {
		alert("비밀번호는 반드시 입력해야 합니다.");
		frm.pwd.focus();
		return false;
	}
	
	if(document.frm.pwd.value != document.frm.pwd_check.value) {
		alert('비밀번호가 일치하지 않습니다.')
		frm.pwd.focus();
		return false;
	}
	
	if(pw.length < 8 || pw.length > 20){
	  alert("8자리 ~ 20자리 이내로 입력해주세요:D");
	  return false;
	 }else if(pw.search(/\s/) != -1){
	  alert("비밀번호는 공백 없이  입력해주세요:D");
	  return false;
	 }else if(num < 0 || eng < 0 || spe < 0 ){
	  alert("영문,숫자, 특수문자를 혼합하여  입력해주세요:D");
	  return false;
	 }

	if(document.frm.email.value.length == 0) {
		alert('이메일   입력해주세요:D');
		frm.email.focus();
		return false;
	}
		
	if(document.frm.address.value.length == 0) {
		alert('주소를   입력해주세요:D');
		frm.address.focus();
		return false;
	}
		
	if(document.frm.addressDetail.value.length == 0) {
		alert('상세주소를   입력해주세요:D');
		frm.address.focus();
		return false;
	}
	
	if(document.frm.phone.value.length == 0) {
		alert('핸드폰 번호를  입력해주세요:D');
		frm.phone.focus();
		return false;
	}
	  if(confirm("회원정보를 수정 하시겠습니까?")){
        alert("수정이 완료되었습니다.");
	return true;
	}
}