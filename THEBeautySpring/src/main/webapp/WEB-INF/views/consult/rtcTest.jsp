<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>openvidu-hello-world</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<link rel="styleSheet"
	href="${pageContext.request.contextPath}/resources/consult/style.css"
	type="text/css" media="screen">
<script
	src="${pageContext.request.contextPath}/resources/consult/openvidu-browser-2.27.0.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/consult/app.js"></script>
</head>
<body>
	<div id="join">
		<h1>Join a video session</h1>
		<form onsubmit="joinSession(); return false">
			<p>
				<label>Session:</label> <input type="text" id="sessionId"
					value="SessionA" required>
			</p>
			<p>
				<input type="submit" value="JOIN">
			</p>
		</form>
	</div>

	<div id="session" style="display: none;">
		<h1 id="session-header"></h1>
		<input type="button" onclick="leaveSession()" value="LEAVE">
		<div>
			<div id="publisher">
				<h3>YOU</h3>
			</div>
			<div id="subscriber">
				<h3>OTHERS</h3>
			</div>
		</div>
	</div>
</body>

</html>