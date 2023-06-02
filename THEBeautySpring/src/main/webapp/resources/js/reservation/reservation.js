function submitReserveController() {
	
	    var inputDate = $("#inputDate").text();
	    var inputTime = $("#inputTime").text();
	    var brandSeq = $('input[name="brandSeq"]').val();

	    $.ajax({
	        url: "/theBeauty/reserve/myReservation",
	        type: "POST",
	        data: {
	        	reserveDate : inputDate,
	        	reserveTime : inputTime,
	        	brandSeq: brandSeq
	        },
	        success: function(response) {
	        	alert("예약이 완료되었습니다.");
	        	window.location.href = "/theBeauty/survey/surveyPage" ;
	        },
	        error: function() {
	            alert("예약에 실패하였습니다. 다시 시도해주세요");
	        }
	    });
}

function cancelReservation(name,date,time,brand) {
    let userName = name;
    let brandSeq = brand;
    let inputDate = date;
    let inputTime = time;
    $.ajax({
        url: "/theBeauty/reserve/cancelReservation",
        type: "POST",
        data: {
        	userName: userName,
            reserveDate: inputDate,
            reserveTime: inputTime,
            brandSeq: brandSeq
        },
        success: function (response) {
            alert("예약을 취소하였습니다.");
            window.location.href = "/theBeauty/reserve/reservationDetailPage";
        },
        error: function (response) {
            alert("예약취소를 실패하였습니다. 다시 시도해주세요.");
            window.location.href = "/theBeauty/reserve/reservationDetailPage";
        }
    });
}
