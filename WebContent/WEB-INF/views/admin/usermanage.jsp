<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
</head>
<body>
	<div class="container">
		<h3>用户管理界面</h3>
		<a class="btn btn-info" href="<c:url value='/login/admin' />">返回管理界面</a>
		<table class="table table-hover">
			<c:forEach var="item" items="${items}">
				<tr>
					<td>用户昵称：${item.showname }</td>
					<td>账号：${item.username }</td>
					<td><a class="btn btn-info" href="<c:url value="/admin/detail"/>">发布的活动</a></td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
</body>
</html>