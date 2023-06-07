window.onload = function() {
	buildCalendar();
} // 웹 페이지가 로드되면 buildCalendar 실행

let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화

// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {

	let firstDay = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번달 1일
	let lastDay = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0); // 이번달 말일

	let calendar = document.querySelector(".Calendar > tbody");
	document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도
	document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1); // 월
	
	while (calendar.rows.length > 0) { // 달력 초기화
		calendar.deleteRow(calendar.rows.length - 1);
	}

	let nowRow = calendar.insertRow(); // 첫번째 행 추가

	for (let j = 0; j < firstDay.getDay(); j++) { // 이번달 1일의 요일까지
		let nowColumn = nowRow.insertCell(); // 열 추가
	}
	
	let nowDay = 0;
	
	for (nowDay = firstDay; nowDay <= lastDay; nowDay.setDate(nowDay
			.getDate() + 1)) { // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복
		
		let nowColumn = nowRow.insertCell(); // 새 열을 추가하고

		let newDIV = document.createElement("p");
		newDIV.innerHTML = leftPad(nowDay.getDate());  // 추가한 열에 날짜 입력

		let currDay = new Date();
		let checkDay = new Date(document.getElementById("calYear").innerText + "-" + document.getElementById("calMonth").innerText + "-" + newDIV.innerHTML);
		if(checkDay <= currDay) {//오늘날짜와 비교
			newDIV.onclick = function() {
				alert("예약은 내일 이후만 가능합니다.");
			};
		} else {
			newDIV.onclick = function() {
			selectDate(this);
			showTimeTable(this);
			};
			newDIV.classList.add("add-hover");
		}
		
		nowColumn.appendChild(newDIV);

		if (nowDay.getDay() == 6) { // 토요일인 경우
			nowRow = calendar.insertRow(); // 새로운 행 추가
		}
	}
	
	let nd = nowDay.getDay()
	while(true){
		let nowColumn = nowRow.insertCell();
		if(nd == 6) {
			break;
		}
		nd++;
	}
}

// value가 한자리이면 '0'붙여서 두자리로 만듦
function leftPad(value) {
    if (value < 10) {
        value = "0" + value;
    }
    return value;
}

// 이전달 버튼 클릭
function prevCalendar() {
	nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1,
			nowMonth.getDate());
	document.getElementById("inputDate").innerHTML = "";
	document.getElementById("inputTime").innerHTML = "";
	document.getElementById("timeTable").innerHTML = "";
	buildCalendar(); // 달력재로딩
}

// 다음달 버튼 클릭
function nextCalendar() {
	nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1,
			nowMonth.getDate()); 
	document.getElementById("inputDate").innerHTML = "";
	document.getElementById("inputTime").innerHTML = "";
	document.getElementById("timeTable").innerHTML = "";
	buildCalendar(); // 달력재로딩
}
// 날짜선택 >> inputTime에 입력
function selectDate(pTag) {
	document.getElementById("inputTime").innerHTML = "";
	document.getElementById("inputDate").innerHTML = "";
	document.getElementById("inputDate").value = pTag.innerHTML;

	let year = document.getElementById("calYear").innerText;
	let month = document.getElementById("calMonth").innerText;
	let date = pTag.innerHTML;

	let result = year + '-' + month + '-' + date;

	inputDate.innerHTML = result;
}


// 날짜 click시 >> 하위 timeTable출력
function showTimeTable() {
	document.getElementById("timeTable").innerHTML = "";
	let timeTable = document.getElementById('timeTable');
	let inputDate = document.getElementById("inputDate").innerHTML;
	let brandSeq = document.getElementById("brandSeq").value;
	
	for (Hour = 10; Hour <= 19; Hour++) {
	    timeItem = document.createElement('div');
	    timeItem.className = "time";
	    timeString = String(Hour)+':'+'00';
	    $.ajax({
	    	url: "/theBeauty/reserve/checkSchedule",
	    	async : false,
	        type: "POST",
	        data: {
	        	brandSeq : brandSeq,
	        	reserveDate : inputDate,
	        	reserveTime : timeString
	        },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        success: function(response) {
	        	if(response === 'notEmpty') {
	        		timeItem.textContent = "예약완료";
	        		timeTable.appendChild(timeItem);
	        	} else {
	        		timeItem.textContent = response;
	        		timeItem.classList.add("add-hover");
		        	timeItem.addEventListener("click", function() {
		        	let selectedTime = this.textContent;
		        	document.getElementById("inputTime").textContent = selectedTime;
		        	});
		        	timeTable.appendChild(timeItem);
	        	}
	        	
	        },
	        error: function() {
	        	console.log("시간로딩실패");
	        }
	    });
	    
	    timeItem = document.createElement('div');
	    timeItem.className = "time";
	    timeString = String(Hour)+':'+'30';
	    $.ajax({
	    	url: "/theBeauty/reserve/checkSchedule",
	    	async : false,
	        type: "POST",
	        data: {
	        	brandSeq : brandSeq,
	        	reserveDate : inputDate,
	        	reserveTime : timeString
	        },
	        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
	        success: function(response) {
	        	if(response === 'notEmpty') {
	        		timeItem.textContent = "예약완료";
	        		timeTable.appendChild(timeItem);
	        	} else {
	        		timeItem.textContent = response;
	        		timeItem.classList.add("add-hover");
		        	timeItem.addEventListener("click", function() {
		        	let selectedTime = this.textContent;
		        	document.getElementById("inputTime").textContent = selectedTime;
		        	});
		        	timeTable.appendChild(timeItem);
	        	}
	        },
	        error: function() {
	        	console.log("시간로딩실패");
	        }
	    });
	    
	}
}
