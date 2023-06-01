<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/reservation/reservationDetail.css" />
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
</body>
</html>