<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>

<title>活动详情</title>
</head>
<body>
	<div class="container">
		<!-- <div class="alert alert-error">
		  <button type="button" class="close" data-dismiss="alert">&times;</button>
		  <strong>Warning!</strong> Best check yo self, you're not looking too good.
		</div> -->
		<a href="<c:url value='/activity'/>" class="btn btn-primary">返回活动页</a>
		<h3>${activity.name}</h3>
		<p>${activity.place }</p>
		<p>${activity.startTime }</p>
		<p>${activity.endTime }</p>
		<p>${activity.peopleCount }</p>
		
		<c:choose>
			<c:when test="${isCollected == null || isCollected == false }">
				<button id="collect-btn" class="btn btn-info">收藏活动</button>
			</c:when>
			<c:when test="${isCollected == true }">
				<button id="collect-btn" class="btn btn-info">取消收藏</button>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${isAttended == null || isAttended == false }">
				<button id="attend-btn" class="btn btn-primary">参与活动</button>
			</c:when>
			<c:when test="${isAttended == true }">
				<button id="attend-btn" class="btn btn-primary" disabled>已参与活动</button>
				<span id="cancelWord" style="display: none;">若要退出活动，请去用户参与活动界面取消</span>
			</c:when>
		</c:choose>
		
	</div>

	<script type="text/javascript">
		(function(){
			// $('.alert').alert();
			$('#collect-btn').click(function(event) {
				var $this = $(this);
				if($this.text() === '收藏活动'){
					$.post('collect?id=${activity.id}', function(data, textStatus, xhr) {
						console.log(data);
						if(data.remind){
							alert("成功收藏活动");
							$this.text(data.btnWord);
						}else{
							alert("收藏活动失败");
						}
						
					});
				}else{
					$.post('cancelCollect?id=${activity.id}', function(data, textStatus, xhr) {
						console.log(data);
						if(data.remind){
							alert("成功取消收藏活动");
							$this.text(data.btnWord);
						}else{
							alert("收藏活动失败");
						}
						
					});
				}
				
			});
			$('#attend-btn').click(function(event) {
				var $this = $(this);
				$.post('attend?id=${activity.id}', function(data, textStatus, xhr) {
					console.log(data);
					alert("成功加入活动");
					$this.text(data.remind).prop('disabled', true);
				});
			});
		})();
		

	</script>
</body>
</html>