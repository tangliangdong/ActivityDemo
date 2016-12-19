<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap-datetimepicker.min.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap-datetimepicker.js'/>"></script>
<title>发起活动</title>
</head>
<body>
	<div class="content container" style="margin: 20px 0 0 40px;">
		<form class="form-horizontal" action="start" method="post">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">活动名称</label>
		    <div class="col-sm-10">
		      <input type="text" name="name">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">发起人</label>
		    <div class="col-sm-10">
		      <input type="text" readonly value="${showname}" name="username">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">开始时间</label>
		    <div class="input-append date" id="datetimepicker" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
			    <input class="span2" size="16" type="text" value="12-02-2012">
			    <span class="add-on"><i class="icon-remove"></i></span>
			    <span class="add-on"><i class="icon-th"></i></span>
				</div> 
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">结束时间</label>
		    <div class="col-sm-10">
		      <input type="time" name="endTime">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">活动地点</label>
		    <div class="col-sm-10">
		      <input type="text" name="place">
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">可参与人数</label>
		    <div class="col-sm-10">
		     <input type="number" name="count">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">发起活动</button>
		      <a href="<c:url value='/activity'/>" class="btn btn-info">返回活动页</a>
		    </div>
		  </div>
		</form>
	</div>
</body>
</html>