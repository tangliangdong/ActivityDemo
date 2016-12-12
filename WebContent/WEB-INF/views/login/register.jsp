<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="resources/bootstrap/css/bootstrap.css">
<title>注册用户</title>
</head>
<body>
	<h2>注册</h2>
	<form class="form-inline" action="register" method="post">
		昵称：<input type="text" class="input-small" name="showname" placeholder="showname">
	  账号：<input type="text" class="input-small" name="username" placeholder="username">
	  密码：<input type="password" class="input-small" name="password" placeholder="Password">
	  重复密码：<input type="password" class="input-small" name="password2" placeholder="Password">
	  <button type="submit" class="btn">Sign in</button>
	</form>
</body>
</html>