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
	        	// moveCartpage();
	        	window.location.href = "/theBeauty/main/mainPage";
	        },
	        error: function() {
	            alert("예약에 실패하였습니다. 다시 시도해주세요");
	        }
	    });
}

function moveCartpage(){
	
}