function handleSkintoneInput(input) {
    var radioValue = document.querySelector('input[name="surveySkintone"]:checked').value;
    if (radioValue === "기타") {
        input.value = radioValue + ',' + input.value;
    }
}

function safeANDmove(userSeq) {
	
	var userSeq = userSeq; // JSP 변수의 값을 JavaScript 변수에 할당
    var surveySkintype = document.querySelector('input[name="surveySkintype"]:checked').value;
    var surveyPersonalColor = document.querySelector('input[name="surveyPersonalColor"]:checked').value;
    var surveyJewelryColor = document.querySelector('input[name="surveyJewelryColor"]:checked').value;
    var surveySkintone = document.querySelector('input[name="surveySkintone"]:checked').value;

			
	 $.ajax({
	        url: "/theBeauty/survey/surveyResult",
	        type: "POST",
	        data: {
	        	userSeq :userSeq,
	        	surveySkintype : surveySkintype,
	        	surveyPersonalColor : surveyPersonalColor,
	        	surveyJewelryColor : surveyJewelryColor,
	        	surveySkintone : surveySkintone
	        },
	        success: function(response) {
	        	console.log(response);
	        	alert("설문이 완료되었습니다.");
	        	window.location.href = response;
	        },
	        error: function(response) {
	        	console.log(response);
	            alert("설문저장에 실패하였습니다. 메인페이지로 이동합니다.");
	            window.location.href = response;
	        }
	    });
	
}

