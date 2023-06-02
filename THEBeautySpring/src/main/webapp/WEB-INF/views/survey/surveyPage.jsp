<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey/survey.css" />
	<script
	src="${pageContext.request.contextPath}/resources/js/survey/survey.js"></script>
<title>사전설문작성</title>
</head>
<body>
	<!-- header추가 -->
	<%@ include file="/WEB-INF/views/header/header.jsp"%>

	<div class="container">

		<div class="title-head">
			<h2>사전정보작성</h2>
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
				<div class="step-box 02 current">
					<span class="mark"><img
						src="${pageContext.request.contextPath}/resources/images/step02.png"
						alt="img"></span>
					<div class="pcontainer current">
						<p>STEP 02</p>
						<p>사전정보작성</p>
					</div>
				</div>

				<span class="step-mark"><img
					src="${pageContext.request.contextPath}/resources/images/nextstep.png"
					alt="img"></span>
				<div class="step-box 03">
					<span class="mark"><img
						src="${pageContext.request.contextPath}/resources/images/step03.png"
						alt="img"></span>
					<div class="pcontainer">
						<p>STEP 03</p>
						<p>예약완료</p>
					</div>
				</div>
			</div>
		</div>

			<input type="hidden" name="userSeq" value="${currUser.userSeq }">
			<div class="surveywrap">
				<div class="survey">

					<div class="survey-question">
						<h3>1. 피부타입</h3>
					</div>

					<div class="survey-items">
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveySkintype" value="건성" />건성
						</label> 
						<label class="radio-label-wrapper">
							<input type="radio" name="surveySkintype" value="복합성" />복합성
						</label>
						<label class="radio-label-wrapper">
							<input type="radio" name="surveySkintype" value="지성" />지성
						</label>
						<label class="radio-label-wrapper">
							<input type="radio" name="surveySkintype" value="민감성" />민감성
						</label>
					</div>
				</div>

				<div class="survey">
					<div class="survey-question">
						<h3>2. 퍼스널컬러</h3>
					</div>
					<div class="survey-items">
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveyPersonalColor" value="봄 웜톤" />봄 웜톤
						</label>
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveyPersonalColor" value="여름 쿨톤" />여름 쿨톤
						</label>
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveyPersonalColor" value="가을 웜톤" />가을 웜톤
						</label>
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveyPersonalColor" value="겨울 쿨톤" />겨울 쿨톤
						</label>
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveyPersonalColor" value="모름" />모름
						</label>
					</div>
				</div>

				<div class="survey">
					<div class="survey-question">
						<h3>3. 선호하는 악세서리 컬러</h3>
					</div>
					<div class="survey-items">
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveyJewelryColor" value="실버" />실버
						</label>
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveyJewelryColor" value="골드" />골드
						</label>
					</div>
				</div>

				<div class="survey">
					<div class="survey-question">
						<h3>4. 피부톤</h3>
					</div>
					<div class="survey-items">
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveySkintone" value="17호" />17호
						</label>
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveySkintone" value="21호" />21호
						</label>
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveySkintone" value="23호" />23호
						</label>
						<label class="radio-label-wrapper"> 
							<input type="radio" name="surveySkintone" value="모름" />모름
						</label>
					</div>
				</div>

				<div class="survey-submit">
					<input class="submit" type="button" onclick="safeANDmove('${currUser.userSeq}')" value="제출하기"/>
				</div>
			</div>

	</div>
	<script	src="${pageContext.request.contextPath}/resources/js/survey/survey.js"></script>
</body>
</html>