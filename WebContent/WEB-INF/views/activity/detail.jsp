<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="/resources/bootstrap/js/bootstrap.js"></script>
<title>活动详情</title>
</head>
<body>

	<div class="container">
		<a href="" class="btn btn-primary">返回活动页</a>
		<h3>${activity.name}</h3>
		<p>${activity.place }</p>
		<p>${activity.startTime }</p>
		<p>${activity.endTime }</p>
		<p>${activity.peopleCount }</p>
		<a href="activity/collect" class="btn btn-info">收藏活动</a>
		<a href="activity/attend?id=${activity.id}" class="btn btn-primary">参与活动</a>
	</div>


	<script type="text/javascript">
		

	</script>
</body>
</html>