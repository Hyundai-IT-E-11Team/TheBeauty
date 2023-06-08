function findEmail() {
	
	var nameStatus = $("#userName").val();
	var registrationStatus = $("#userRegistration").val();
//	alert("실행");
	if (nameStatus==="") {
		alert("이름을 입력하세요.");
		event.preventDefault();
		return;
	}
	if (registrationStatus === "") {
		alert("주민등록번호를 입력하세요.");
		event.preventDefault();
		return;
	}
}


