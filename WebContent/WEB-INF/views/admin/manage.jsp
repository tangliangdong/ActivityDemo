<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
<title>管理界面</title>
</head>
<body>
	<div class="container">
		<h3>用户管理界面</h3>
		<a href="<c:url value='/admin/cancel'/>" class="btn btn-danger">注销</a>
		<a href="<c:url value='/login'/>" class="btn btn-info">普通用户登录入口</a>
		<ul class="nav nav-tabs nav-stacked">
		  <li><a href="<c:url value='/admin/user'/>">用户管理</a></li>
		  <li><a href="<c:url value='/admin/activity'/>">审核活动</a></li>
		  <li><a href="<c:url value='/admin/nochecked'/>">未通过审核的活动</a></li>
		  <li><a href="<c:url value='/admin/checked'/>">已通过审核的活动</a></li>
		  <li><a href="<c:url value='/admin/deleted'/>">已被删除的活动</a></li>
		</ul>

	</div>
</body>
</html>