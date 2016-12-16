<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>待审核活动页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
</head>
<body>
	<div class="container">
		<h2>等待审核的活动</h2>
		<h3>耐心等待管理员审核</h3>
		<a class="btn btn-primary" href="<c:url value='/activity' />">返回首页</a>
		<a class="btn btn-info" href="<c:url value='/userinfo' />">返回个人主页</a>
		<c:forEach items="${activitys}" var="activity">
			<div class="activity-box">
				<h3>${activity.name}</h3>
				<p>发起人：${showname}</p>
				<p>发起时间：${activity.getDateStartTime()}</p>
				<p>结束时间：${activity.getDateEndTime()}</p>
				<p>活动地点:${activity.place}</p>
				<p>可参与人数：${activity.peopleCount}</p>
				<button id="public-btn" data="${activity.id}" class="btn btn-danger">取消活动</button>
			</div>
		</c:forEach>
	</div>
</body>
</html>