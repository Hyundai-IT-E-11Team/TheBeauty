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
	        	window.location.href = response;
	        },
	        error: function(e) {
	            alert(e.responseText.split("\n")[0])
	        }
	    });
}

function moveCartpage(){
	
}