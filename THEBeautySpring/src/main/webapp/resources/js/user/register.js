function checkMail() {
	let status = $('#userMail').attr('status');
	let userMail = $('#userMail').val(); // 입력한 이메일값

	// if(userMail == ""){
	// $('#userMail').after("<span class='checkMailSpan'
	// style='color:lightgray'>이메일을 입력해주세요.</span>");
	// $('#userMail').focus();
	// }
	$.ajax({
		url : 'checkMailDuplicate',
		type : 'POST',
		data : {
			userMail : userMail
		},
		success : function(response) {
			alert("사용가능");
			$('#userMail').attr('status', 'yes');
		},
		error : function(err) {
			console.log(err);
			alert("사용불가능");
		}
	});
}

$("#register").submit(function(event) {
	let status = $('#userMail').attr('status');
    var userPw = $("#userPw").val();
    var checkPassword = $("#checkPassword").val();
    
    if(status !== "yes"){
    	alert("이메일 중복확인을 하십시오.");
        event.preventDefault();
        return;
	}
    if (userPw !== checkPassword) {
        alert("비밀번호와 확인 비밀번호가 일치하지 않습니다.");
        event.preventDefault();
        return;
    }
    
});
