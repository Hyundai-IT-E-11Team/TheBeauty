$(document).ready(function() {
    checkPassword();
});

function checkPassword() {
    $("#passwordChangeForm").submit(function(event) {
        var newPassword = $("#newPassword").val();
        var confirmPassword = $("#confirmPassword").val();

        if (newPassword !== confirmPassword) {
            alert("비밀번호와 비밀번호 확인란이 일치하지 않습니다.");
            event.preventDefault(); // 양식 제출 중지
        }
    });
}
