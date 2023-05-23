$(document).ready(function() {
    checkPassword();
});

function checkPassword() {
    $("#passwordChangeForm").submit(function(event) {
        var newPassword = $("#newPassword").val();
        var confirmPassword = $("#confirmPassword").val();

        if (newPassword !== confirmPassword) {
            alert("비밀번호와 확인 비밀번호가 일치하지 않습니다.");
            event.preventDefault(); // stop form submission
            return;
        }
    });
}
