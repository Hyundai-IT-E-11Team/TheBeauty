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
		<div id="sidebar">
			<div id="sidebarheader">
				 <h2>예약 조회</h2>
				<hr>
			</div>
			<br>
			<div id="currReserve">
				<a href="/theBeauty/reserve/reservationDetailPage?reserveStatus=0">- 현재 예약 내역</a> 
			</div>
			<br>
			<div id="cancelReserve">
				<a href="/theBeauty/reserve/reservationDetailPage?reserveStatus=3">- 취소한 예약 내역</a>
			</div>
			<br>
			<div id="preReserve">
				<a href="/theBeauty/reserve/reservationDetailPage?reserveStatus=1">- 지난 예약 내역</a>
			</div>
		</div>
		<div id="reserveContent">
		<c:forEach var="reservationInfo" items="${reservationList}">
           <div id="contentBox">
		   		<div id="consultingName">
					<h3> 1 : 1 Premium Consulting </h3>
				</div>
				<div id="contsultingContent">
					<div id="contentDetail">
						<div id="reservationName"> 예약자이름 : ${reservationInfo.userName}</div>
						<div id="reservationDate"> 예 약 일 자 : ${reservationInfo.reserveDate}</div>
						<div id="reservationTime"> 예 약 시 간 : ${reservationInfo.reserveTime}</div>
						<div id="reservationBrand"> 예약브랜드 : ${reservationInfo.brandName}</div>					
					</div>
					
					<div id="contentButton">
						<c:if test="${reservationInfo.reserveStatus==0 }">
							<input id="startButton" type="button" onclick="window.location.href='/theBeauty/consult/${reservationInfo.reservationSeq}'" value="상담시작"/>
							<input id="cancelButton" type="button" onclick="cancelReservation('${reservationInfo.userName}','${reservationInfo.reserveDate}','${reservationInfo.reserveTime}','${reservationInfo.brandSeq}')" value="예약취소"/>
						</c:if>
						<c:if test="${reservationInfo.reserveStatus==1 }">
							<div id="status">상담종료</div>
						</c:if>
						<c:if test="${reservationInfo.reserveStatus==2 }">
							<div id="status">NoShow</div>
						</c:if>
						<c:if test="${reservationInfo.reserveStatus==3 }">
							<div id="status">예약취소</div>
						</c:if>
					</div>
					
					
						
				</div>
			</div>
			<br>
        </c:forEach>
		</div>
        </div>
</body>
</html>