function checkMail() {
	let status = $('#userMail').attr('status');
	let userMail = $('#userMail').val(); // 입력한 이메일값

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
			alert("사용불가능");
		}
	});
}

function register() {
	let status = $('#userMail').attr('status');
	let userPw = $("#userPw");
	let checkPassword = $("#checkPassword");
	let userMail = $("#userMail");
	let userName = $("#userName");
	let userRegistration = $("#userRegistration");
	let userMobile = $("#userMobile");
	
	if (userMail.val() == "") {
		alert("이메일을 입력하세요.");
		userMail.focus();
		return;
	}

	else if (userPw.val() == "") {
		alert("비밀번호를 입력하세요.");
		userPw.focus();
		return;
	}

	else if (checkPassword.val() == "") {
		alert("비밀번호 확인을 입력하세요.");
		checkPassword.focus();
	}
	
	else if(userName.val() == "") {
		alert("이름을 입력하세요.");
		userName.focus();
		return;
	}

	else if (userRegistration.val() == "") {
		alert("주민등록번호를 입력하세요.");
		userRegistration.focus();
		return;
	}

	else if (userMobile.val() == "") {
		alert("전화번호를 입력하세요.");
		userMobile.focus();
		return;
	}

	else if (status !== "yes") {
		alert("이메일 중복확인을 하십시오.");
		return;
	}
	else if (userPw.val() !== checkPassword.val()) {
		alert("비밀번호와 확인 비밀번호가 일치하지 않습니다.");
		return;
	}
	
	login();
	
}
function login(){
	
	let status = $('#userMail').attr('status');
	let userPw = $("#userPw");
	let checkPassword = $("#checkPassword");
	let userMail = $("#userMail");
	let userName = $("#userName");
	let userRegistration = $("#userRegistration");
	let userMobile = $("#userMobile");
	
	$.ajax({
		url: '/theBeauty/user/register',
		type: 'POST',
		data: {
			userName: userName.val(),
			userMail: userMail.val(),
			userPw: userPw.val(),
			userRegistration: userRegistration.val(),
			userMobile: userMobile.val(),
		},
		success: function(response) {
			window.location.href = "/theBeauty/user/login";
		}
	})
}
