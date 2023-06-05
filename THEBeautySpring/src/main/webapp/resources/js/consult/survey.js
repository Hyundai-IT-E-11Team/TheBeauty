const drawStar = (target) => {
  $('.star span').css({ width: `${target.value * 10}%` });
}

function upload() {
	let score = $("#score").val();
	let comment = $('#comment').val();

	$.ajax({
        url: "/theBeauty/consult/survey",
        type: "POST",
        data: {
        	score: score,
        	comment: comment
        },
        success: function (response) {
            window.location.href = "/theBeauty/main/mainPage";
        },
        error: function (response) {
        }
    });
}