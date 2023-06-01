<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/survey/survey.css" />
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
	
	<form action="surveyPage" method="post">
	<input type="hidden" name="userSeq" value="${currUser.userSeq }">
	
	<div class="surveywrap">
		<div class="survey">
		
			<div class="survey-question">
				<h3>1. 피부타입</h3>
			</div>
			
			<div class="survey-items">
				<input type="radio" name="surveySkintype" value="건성"/><label>건성</label>
				<input type="radio" name="surveySkintype" value="복합성"/><label>복합성</label>
				<input type="radio" name="surveySkintype" value="지성"/><label>지성</label>
				<input type="radio" name="surveySkintype" value="민감성"/><label>민감성</label>
			</div>
		</div>
		
		<div class="survey">
			<div class="survey-question">
				<h3>2. 퍼스널컬러</h3>
			</div>
			<div class="survey-items">
				<input type="radio" name="surveyPersonalColor" value="봄 웜톤"/>봄 웜톤
				<input type="radio" name="surveyPersonalColor" value="여름 쿨톤"/>여름 쿨톤
				<input type="radio" name="surveyPersonalColor" value="가을 웜톤"/>가을 웜톤
				<input type="radio" name="surveyPersonalColor" value="겨울 쿨톤"/>겨울 쿨톤
				<input type="radio" name="surveyPersonalColor" value="모름"/>모름
			</div>
		</div>
		
		<div class="survey">
			<div class="survey-question">
				<h3>3. 선호하는 악세서리 컬러</h3>
			</div>
			<div class="survey-items">
				<input type="radio" name="surveyJewelryColor" value="실버"/>실버
				<input type="radio" name="surveyJewelryColor" value="골드"/>골드
			</div>
		</div>
		
		<div class="survey">
			<div class="survey-question">
				<h3>4. 피부톤</h3>
			</div>
			<div class="survey-items">
				<input type="radio" name="surveySkintone" value="17호"/>17호
				<input type="radio" name="surveySkintone" value="21호"/>21호
				<input type="radio" name="surveySkintone" value="23호"/>23호
				<input type="radio" name="surveySkintone" value="기타"/>기타<input type="text" name="surveySkintone"/> 
			</div>
		</div>
		
		<div class="survey-submit">
			<input type="submit" />
		</div>
	</div>
	</form>
	
</div>
</body>
</html>