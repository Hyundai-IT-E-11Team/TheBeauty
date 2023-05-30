<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome The Beauty</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/main/userMain.css" />
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<body>
   <!-- header추가 -->
   <%@ include file="/WEB-INF/views/header/header.jsp"%>
   <!-- 이미지 슬라이드 파트-->
   <div id="mainImg">
      <div class="wrapper">
         <div class="title">
            <img
               src="${pageContext.request.contextPath}/resources/images/premiumconsulting_logo.png"
               alt="img">
         </div>
         <i id="left" class="fa-solid fa-angle-left"></i>
         <div class="carousel">
            <a href="#"><img
               src="${pageContext.request.contextPath}/resources/images/img01.jpg"
               alt="img"></a> <a href="#"><img
               src="${pageContext.request.contextPath}/resources/images/img02.jpg"
               alt="img"></a> <a href="#"><img
               src="${pageContext.request.contextPath}/resources/images/img03.jpg"
               alt="img"></a> <a href="#"><img
               src="${pageContext.request.contextPath}/resources/images/img04.jpg"
               alt="img"></a> <a href="#"><img
               src="${pageContext.request.contextPath}/resources/images/img08.jpg"
               alt="img"></a> <a href="#"><img
               src="${pageContext.request.contextPath}/resources/images/img09.jpg"
               alt="img"></a> <a href="#"><img
               src="${pageContext.request.contextPath}/resources/images/img10.jpg"
               alt="img"></a>
         </div>
         <i id="right" class="fa-solid fa-angle-right"></i>
      </div>
   </div>
   </div>
   <script
      src="${pageContext.request.contextPath}/resources/js/main/userMain.js"></script>
	<!-- header추가 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>
	<!-- 이미지 슬라이드 파트-->
	<div id="mainImg">
		<div class="wrapper">
			<div class="title">
				<img
					src="${pageContext.request.contextPath}/resources/images/premiumconsulting_logo.png"
					alt="img">
			</div>
			<i id="left" class="fa-solid fa-angle-left"></i>
			<div class="carousel">
				<a href="#"><img
					src="${pageContext.request.contextPath}/resources/images/img01.jpg"
					alt="img"></a> <a href="#"><img
					src="${pageContext.request.contextPath}/resources/images/img02.jpg"
					alt="img"></a> <a href="#"><img
					src="${pageContext.request.contextPath}/resources/images/img03.jpg"
					alt="img"></a> <a href="#"><img
					src="${pageContext.request.contextPath}/resources/images/img04.jpg"
					alt="img"></a> <a href="#"><img
					src="${pageContext.request.contextPath}/resources/images/img08.jpg"
					alt="img"></a> <a href="#"><img
					src="${pageContext.request.contextPath}/resources/images/img09.jpg"
					alt="img"></a> <a href="#"><img
					src="${pageContext.request.contextPath}/resources/images/img10.jpg"
					alt="img"></a>
			</div>
			<i id="right" class="fa-solid fa-angle-right"></i>
		</div>
	</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/main/userMain.js"></script>
</body>
</html>