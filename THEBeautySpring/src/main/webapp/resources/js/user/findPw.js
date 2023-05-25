$(document).ready(function() {
    $("#passwordFindForm").submit(function(event) {
        event.preventDefault();

        let userMail = $("#email").val();
        let userRegistration = $("#registration").val();

        $.post("/passwordChange", {
            'userMail': userMail,
            'userRegistration': userRegistration
        },
        function(data, status) {
            if (status === 'success') {
                if(data) {
                    window.location.href = "/passwordChange";  // 비밀번호 변경 페이지로 이동
                } else {
                    alert("잘못된 요청입니다. 다시 입력해주세요.");
                }
            }
        });
    });
});
