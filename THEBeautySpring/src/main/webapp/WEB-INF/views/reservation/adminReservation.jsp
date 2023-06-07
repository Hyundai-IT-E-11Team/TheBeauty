<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reservation/adminReservation.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/reservation/adminPageCalendar.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/reservation/reservation.js"></script>
<title>ManageReservation</title>
</head>
<body>
	<div id=totalContatiner">
		<div id="header">
			<div id="mainLogo">
				<a href="/theBeauty/main/mainPage"><img
					src="${pageContext.request.contextPath}/resources/images/mainlogo.png"></a>
			</div>
			<div id="reservement">
				<h2>상담진행하기</h2>
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
					</div>
					<div id="content">
						<div id="dateContainer">
								<div id="choiceDate">
									<div id="calImg"><img src="https://smithstonewalters.com/wp-content/uploads/2015/08/icon-calendar-green.png"></div>
									<div id="inputDate"></div>
								</div>
								<div id="calendar">
									<table class="Calendar">
										<thead>
											<tr id="ymd">
												<td onClick="prevCalendar();" style="cursor: pointer;">&#60;
													이전달</td>
												<td colspan="5"><span id="calYear"></span>년 <span
													id="calMonth"></span>월</td>
												<td onClick="nextCalendar();" style="cursor: pointer;"
													class="">다음달 &#62;</td>
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
						<div id="schedule">
							<input type="hidden" id="brandSeq" name="brandSeq" value="${brandInfo.brandSeq}" />
							<div id="timeContainer">
								<div id="choiceTime">
									<div id="calImg"><img src="https://previews.123rf.com/images/imagevectors/imagevectors1601/imagevectors160100846/50600441-%ED%8F%89%EB%A9%B4-%EB%85%B9%EC%83%89-%EC%8B%9C%EA%B3%84-%EC%95%84%EC%9D%B4%EC%BD%98%EA%B3%BC-%EB%85%B9%EC%83%89-%EC%9B%90.jpg"></div>
									<div id="inputTime"></div>
								</div>
								<div id="timeTable"></div>
							</div>
					   </div>
					 </div> 
					 <div id="detail">
					 	<div id="reserveInfo">
					 		 <span id="userName" class="getInfo"></span>
					 		 <span id="consultDate" class="getInfo"></span>
					 		 <span id="consultTime" class="getInfo"></span>
					 		 <span id="consultContent" class="getInfo"></span>
					 		 <span id="consultStatus" class="getInfo"></span>
					 	</div>
					 	<div id="submitschedule">
							<a id="consultLink" href="">상담시작하기</a>
						</div>
					</div>
				</div>
		   </div>
		</div>
	</div>
	<div id="endLine">
		<hr>
	</div>
	<!-- footer추가 -->
	<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
</body>
</html>