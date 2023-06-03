<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reservation/reservationDetail.css" />
<script
	src="${pageContext.request.contextPath}/resources/js/reservation/reservation.js"></script>
<title>myBeauty</title>
</head>
<body>
	<!-- header추가 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<div class="container">
		<!-- 예약header -->
		<div class="title-head">
			<h2>마이뷰티</h2>
			<div class="stepwrap">
				<div class="step-box 01">
					<span class="mark"><img
						src="${pageContext.request.contextPath}/resources/images/step01.png"
						alt="img"></span>
					<div class="pcontainer">
						<p>STEP 01</p>
						<p>상담신청</p>
					</div>
				</div>

				<span class="step-mark"><img
					src="${pageContext.request.contextPath}/resources/images/nextstep.png"
					alt="img"></span>
				<div class="step-box 02">
					<span class="mark"><img
						src="${pageContext.request.contextPath}/resources/images/step02.png"
						alt="img"></span>
					<div class="pcontainer">
						<p>STEP 02</p>
						<p>사전정보작성</p>
					</div>
				</div>

				<span class="step-mark"><img
					src="${pageContext.request.contextPath}/resources/images/nextstep.png"
					alt="img"></span>
				<div class="step-box 03 current">
					<span class="mark"><img
						src="${pageContext.request.contextPath}/resources/images/step03.png"
						alt="img"></span>
					<div class="pcontainer current">
						<p>STEP 03</p>
						<p>예약완료</p>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div id="middle">
		<c:forEach var="reservationInfo" items="${reservationList}">
           <div id="reservationContent">
		   		<div id="consultingName">
					<h3> 1 : 1 Premium Consulting </h3>
				</div>
				<div id="contsultingContent">
					<div id="contentDetail">
						<div id="reservationName"> 예약자이름 : ${reservationInfo.userName}</div>
						<div id="reservationDate"> 예약일자 : ${reservationInfo.reserveDate}</div>
						<div id="reservationTime"> 예약시간 : ${reservationInfo.reserveTime}</div>
						<div id="reservationBrand"> 예약브랜드 : ${reservationInfo.brandSeq}</div>					
					</div>
					<div id="contentButton">
						<input type="button" onclick="window.location.href='/theBeauty/consult/${reservationInfo.reservationSeq}'" value="상담시작"/>
						<input type="button" onclick="cancelReservation('${reservationInfo.userName}','${reservationInfo.reserveDate}','${reservationInfo.reserveTime}','${reservationInfo.brandSeq}')" value="예약취소"/>
					</div>
				</div>
			</div>
        </c:forEach>
        </div>
</body>
</html>