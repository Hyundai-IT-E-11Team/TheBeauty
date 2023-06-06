<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reservation/reservation.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/reservation/calendar.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/reservation/reservation.js"></script>
<title>reservePage</title>
</head>
<body>
	<div id=totalContatiner">
		<div id="header">
			<div id="mainLogo">
				<a href="/theBeauty/main/mainPage"><img
					src="${pageContext.request.contextPath}/resources/images/mainlogo.png"></a>
			</div>
			<div id="reservement">
				<h2>예약하기</h2>
			</div>
		</div>
		<div id="middle">
			<div id="reservemain">
				<div id="innerheader">
					<h1>일정선택</h1>
					<hr>
				</div>
				<div id="innermain">
					<div id="brand">
						<div id="brandlogo">
							<img src="${brandInfo.brandImgurl}">
						</div>
						<div id="brandproductimg">
							<img src="${brandInfo.brandImg1}">
						</div>
					</div>
						<div id="schedule">
							 <input type="hidden" id="brandSeq" name="brandSeq" value="${brandInfo.brandSeq}" />
							<div id="dateContainer">
								<div id="choiceDate">
									<div>날 짜 :</div>
									<div id="inputDate"></div>
								</div>
								<div id="calendar">
									<table class="Calendar">
										<thead>
											<tr id="ymd">
												<td onClick="prevCalendar();" id="changeMonth">&#60;이전달</td>
												<td colspan="5"><span id="calYear"></span>년 <span
													id="calMonth"></span>월</td>
												<td onClick="nextCalendar();" id="changeMonth">다음달 &#62;</td>
											</tr>
											<tr id="day">
												<td>일</td>
												<td>월</td>
												<td>화</td>
												<td>수</td>
												<td>목</td>
												<td>금</td>
												<td>토</td>
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
								
							</div>
							<div id="timeContainer">
								<div id="choiceTime">
									<div>시 간 :</div>
									<div id="inputTime"></div>
								</div>
								<div id="timeTable"></div>
							</div>
							<div id="submitschedule">
								<input type="button" id="submitbutton" name="submitbutton" onclick="submitReserveController()" value="예약하기"/>
							</div>
						</div>
				</div>
			</div>
		</div>
	</div>
	<div id="endLine">
		<hr>
	</div>
</body>
</html>