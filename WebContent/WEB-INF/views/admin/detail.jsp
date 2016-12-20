<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户发布的活动</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
</head>
<body>
	<div class="container">
		<h3>${aShowname}的活动</h3>
		<a class="btn btn-info" href="<c:url value='/admin' />">返回管理界面</a>
		<a class="btn btn-info" href="<c:url value='/admin/user' />">返回用户管理界面</a>
		<table class="table table-hover">
			<tr>
				<th>活动名称</th>
				<th>发起人</th>
				<th>发起时间</th>
				<th>结束时间</th>
				<th>活动地点</th>
				<th>可参与人数</th>
				<!-- <th>审核活动</th> -->
				<th>活动状态</th>
			</tr>
			<c:forEach items="${items}" var="activity">
				<tr>
					<td>${activity.name}</td>
					<td>${activity.getuList().get(0).getShowname()}</td>
					<td>${activity.getDateStartTime()}</td>
					<td>${activity.getDateEndTime()}</td>
					<td>${activity.place}</td>
					<td>${activity.peopleCount}</td>
					<!-- <td>
						<button data="${activity.id}" class="btn btn-danger checkPass-btn">审核通过</button>
						<button data="${activity.id}" class="btn btn-danger checkNoPass-btn">审核不通过</button>
					</td> -->
					<td class="warn">
						<c:choose>
							<c:when test="${activity.pass == 0 }">
								<span class="text-primary">等待审核</span>
							</c:when>
							<c:when test="${activity.pass == 1 }">
								<span class="text-success">已审核通过</span>
							</c:when>
							<c:when test="${activity.pass == 2 }">
								<span class="text-danger">审核不通过</span>
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>