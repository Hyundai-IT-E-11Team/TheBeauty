window.onload = function() {
	buildCalendar();
} // 웹 페이지가 로드되면 buildCalendar 실행

let nowMonth = new Date(); // 현재 달을 페이지를 로드한 날의 달로 초기화

// 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
function buildCalendar() {

	let firstDay = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1); // 이번달
	// 1일
	let lastDay = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0); // 이번달
	// 마지막날

	let calendar = document.querySelector(".Calendar > tbody");
	document.getElementById("calYear").innerText = nowMonth.getFullYear(); // 연도
	// 숫자
	// 갱신
	document.getElementById("calMonth").innerText = nowMonth.getMonth() + 1; // 월 숫자
	// 갱신

	while (calendar.rows.length > 0) { // 이전 출력결과가 남아있는 경우 초기화
		calendar.deleteRow(calendar.rows.length - 1);
	}

	let nowRow = calendar.insertRow(); // 첫번째 행 추가

	for (let j = 0; j < firstDay.getDay(); j++) { // 이번달 1일의 요일만큼
		let nowColumn = nowRow.insertCell(); // 열 추가
	}
	
	let nowDay = 0;
	
	for (nowDay = firstDay; nowDay <= lastDay; nowDay.setDate(nowDay
			.getDate() + 1)) { // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복

		let nowColumn = nowRow.insertCell(); // 새 열을 추가하고

		let newDIV = document.createElement("p");
		newDIV.innerHTML = nowDay.getDate(); // 추가한 열에 날짜 입력
		newDIV.onclick = function() {
			selectDate(this);
			showTimeTable(this);
		};

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

// 이전달 버튼 클릭
function prevCalendar() {
	nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1,
			nowMonth.getDate()); // 현재 달을 1 감소
	buildCalendar(); // 달력 다시 생성
}
// 다음달 버튼 클릭
function nextCalendar() {
	nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1,
			nowMonth.getDate()); // 현재 달을 1 증가
	buildCalendar(); // 달력 다시 생성
}

function selectDate(pTag) {
	document.getElementById("inputDate").innerHTML = "";
	document.getElementById("inputDate").value = pTag.innerHTML;

	let year = document.getElementById("calYear").innerText;
	let month = document.getElementById("calMonth").innerText;
	let date = pTag.innerHTML;

	let result = year + '-' + month + '-' + date;

	inputDate.innerHTML = result;
}

function showTimeTable() {
	document.getElementById("timeTable").innerHTML = "";
	var timeTable = document.getElementById('timeTable');

	for (Hour = 10; Hour <= 19; Hour++) {
		
	    var timeItem = document.createElement('div');
	    timeItem.className = "time";
	    timeString = String(Hour)+':'+'00';
	    timeItem.textContent = timeString;
	    timeTable.appendChild(timeItem);
	    timeItem.addEventListener("click", function() {
	        var selectedTime = this.textContent;
	        document.getElementById("inputTime").textContent = selectedTime;
	    });
	    
	    timeItem = document.createElement('div');
	    timeItem.className = "time";
	    timeString = String(Hour)+':'+'30';
	    timeItem.textContent = timeString;
	    timeTable.appendChild(timeItem);
	    timeItem.addEventListener("click", function() {
	        var selectedTime = this.textContent;
	        document.getElementById("inputTime").textContent = selectedTime;
	    });

	}
}
