<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已发布活动页面</title>
</head>
<body>
	<div class="container">
		<h2>已发布活动</h2>
		<div class="content container" style="margin: 20px 0 0 40px;">
			<c:forEach items="${activitys}" var="activity">
				<div class="activity-box">
					<h3>${activity.name}</h3>
					<p>发起人：${activity.userId}</p>
					<p><span>发起时间：${activity.startTime}</span><span>结束时间：${activity.endTime}</span></p>
					<p>活动地点:${activity.place}</p>
					<p>可参与人数：${activity.peopleCount}</p>
					<button id="collect-btn" class="btn btn-danger">取消收藏</button>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>