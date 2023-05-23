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


