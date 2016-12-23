<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>删除的活动</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
</head>
<body>
	<div class="container">
		<h2>已删除的活动</h2>
		<a class="btn btn-primary" href="<c:url value='/admin' />">返回管理页面</a>
		<table class="table table-hover">
			<tr>
				<th>活动名称</th>
				<th>发起人</th>
				<th>发起时间</th>
				<th>结束时间</th>
				<th>活动地点</th>
				<th>可参与人数</th>
			</tr>
			<c:forEach items="${activitys}" var="activity">
				<tr>
					<td>${activity.name}</td>
					<td>${activity.getuList().get(0).getShowname()}</td>
					<td>${activity.getDateStartTime()}</td>
					<td>${activity.getDateEndTime()}</td>
					<td>${activity.place}</td>
					<td>${activity.peopleCount}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	

	<script type="text/javascript">
		(function(){
			
		})();
	</script>

</body>
</html>