<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=path%>/resources/bootstrap/css/bootstrap.css">
<script type="text/javascript" src="<%=path%>/resources/js/jquery-2.2.4.min.js"></script>
<!-- <script type="text/javascript" src="../resources/bootstrap/js/bootstrap.js"></script> -->

<title>活动详情</title>
</head>
<body>
	<div class="container">
		<a href="../activity" class="btn btn-primary">返回活动页</a>
		<h3>${activity.name}</h3>
		<p>${activity.place }</p>
		<p>${activity.startTime }</p>
		<p>${activity.endTime }</p>
		<p>${activity.peopleCount }</p>
		<button id="collect-btn" class="btn btn-info">收藏活动</button>
		<c:choose>
			<c:when test="${isAttended == null || isAttended == false }">
				<button id="attend-btn" class="btn btn-primary">参与活动</button>
			</c:when>
			<c:when test="${isAttended == true }">
				<button id="attend-btn" class="btn btn-primary" disabled>已参与活动</button>
			</c:when>
		</c:choose>
	</div>

	<script type="text/javascript">
		(function(){
			$('#collect-btn').click(function(event) {
				var $this = $(this);
				$.post('collect?id=${activity.id}', function(data, textStatus, xhr) {
					console.log(data);
					$this.text(data.remind).prop('disabled', true);
				});
			});
			$('#attend-btn').click(function(event) {
				var $this = $(this);
				console.log($this);
				// $.ajax({
				// 	url: 'attend?id=${activity.id}',
				// 	type: 'POST',
				// 	dataType: 'json',
				// 	success:function(data){
				// 		console.log(data);
				// 		$this.text(data.remind).prop('disabled', true);
				// 	}
				// });

				$.post('attend?id=${activity.id}', function(data, textStatus, xhr) {
					console.log(data);
					$this.text(data.remind).prop('disabled', true);
				});
			});
		})();
		

	</script>
</body>
</html>