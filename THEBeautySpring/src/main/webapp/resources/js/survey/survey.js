function validateForm() {
    var radioGroups = document.getElementsByClassName('survey-items');
    var checked = false;

    // 모든 라디오 버튼 그룹에 대해 체크 여부 확인
    for (var i = 0; i < radioGroups.length; i++) {
        var radioButtons = radioGroups[i].getElementsByTagName('input');

        // 라디오 버튼 그룹 내에서 하나라도 체크되었는지 확인
        for (var j = 0; j < radioButtons.length; j++) {
            if (radioButtons[j].checked) {
                checked = true;
                break;
            }
        }

        // 라디오 버튼이 하나도 체크되지 않았으면 제출 방지
        if (!checked) {
            alert("모든 항목에 답변해주세요.");
            return false;
        }
        
        checked = false; // 다음 라디오 버튼 그룹을 위해 checked 변수 초기화
    }
}

function saveAndGoToDetailPage(userSeq) {
	   console.log(userSeq);
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
            window.location.href = "/theBeauty/reserve/reservationDetailPage";
         },
         error: function(response) {
        	 console.log(response);
             alert("설문저장에 실패하였습니다. 메인페이지로 이동합니다.");
             window.location.href = "/theBeauty/main/mainPage";
         }
     });
 
}
