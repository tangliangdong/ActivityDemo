<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">

<title>发起活动</title>
</head>
<body>
	<div class="content container" style="margin: 20px 0 0 40px;">
		<form action="start" method="post">
			<div class="activity-box">
				活动名称：<input type="text" name="name">
				发起人：<input type="text" readonly value="${showname}" name="username">
				开始时间：<input type="month" name="startTime">
				结束时间：<input type="month" name="endTime">
				活动地点：<input type="text" name="place">
				可参与人数：<input type="number" name="count">
			</div>
			<input class="btn" type="submit" value="发起活动" />
		</form>
	</div>
</body>
</html>