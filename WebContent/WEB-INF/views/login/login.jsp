<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css' />">
<script type="text/javascript" href="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
<title>登录页面</title>
</head>
<body>
	<div class="container">
		<h2>用户登录</h2>
		<c:if test="${loginRemind != null}">
			<span style="color:red;">${loginRemind }</span>
		</c:if>
		<form class="form-horizontal" action="login" method="post">
		  <div class="control-group">
		    <label class="control-label" for="inputEmail">Username</label>
		    <div class="controls">
		      <input type="text" id="inputEmail" name="username" placeholder="username">
		    </div>
		  </div>
		  <div class="control-group">
		    <label class="control-label" for="inputPassword">Password</label>
		    <div class="controls">
		      <input type="password" id="inputPassword" name="password" placeholder="Password">
		    </div>
		  </div>
		  <div class="control-group">
		    <div class="controls">
		      <button type="submit" class="btn">Login</button>
		      <a class="btn btn-primary" href="login/register">注册</a>
		    </div>
		  </div>
		</form>
	</div>
	
</body>
</html>