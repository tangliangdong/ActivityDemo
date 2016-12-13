<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
</head>
<body>
	<div class="container">
		<h3>你好，${showname}</h3>
		<ul class="nav nav-tabs nav-stacked">
		  <li><a href="<c:url value='/userinfo/collected'/>">已收藏的活动</a></li>
		  <li><a href="<c:url value='/userinfo/attended'/>">已参与的活动</a></li>
		  <li><a href="<c:url value='/userinfo/checking'/>">正在审核的活动</a></li>
		  <li><a href="<c:url value='/userinfo/public'/>">已发布的活动</a></li>
		  <li><a href="<c:url value='/userinfo/past'/>">过期的活动</a></li>
		  <li><a href="<c:url value='/userinfo/${userId}'/>"></a></li>
		  <%-- <li><a href="<c:url value=''/>"</a></li> --%>
		</ul>
	</div>
	
</body>
</html>