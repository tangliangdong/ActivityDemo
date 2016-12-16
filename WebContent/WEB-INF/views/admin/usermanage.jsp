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
		<c:choose>
			<c:when test="${type == 1 }">
				<h3>用户管理界面</h3>
			</c:when>
			<c:when test="${type == 2 }">
				<h3>等待审核的活动</h3>
			</c:when>
			<c:when test="${type == 3 }">
				<h3>审核未通过的活动</h3>
			</c:when>
			<c:when test="${type == 4 }">
				<h3>已通过审核的活动</h3>
			</c:when>
		</c:choose>
		<a class="btn btn-info" href="<c:url value='/admin' />">返回管理界面</a>
		
		<table class="table table-hover">
			<c:choose>
				<c:when test="${type == 1}">
					<c:forEach var="item" items="${items}">
						<tr>
							<td>用户昵称：${item.showname }</td>
							<td>账号：${item.username }</td>
							<td><a class="btn btn-info" href="<c:url value="/admin/detail"/>">发布的活动</a></td>
						</tr>
					</c:forEach>
				</c:when>
			
				<c:when test="${type == 2 }">
					<c:forEach items="${items}" var="activity">
						<tr>
							<td>${activity.name}</td>
							<%-- <p>发起人：${showname}</p> --%>
							<td>发起时间：${activity.getDateStartTime()}</td>
							<td>结束时间：${activity.getDateEndTime()}</td>
							<td>活动地点:${activity.place}</td>
							<td>可参与人数：${activity.peopleCount}</td>
							<td>
								<button data="${activity.id}" class="btn btn-danger checkPass-btn">审核通过</button>
								<button data="${activity.id}" class="btn btn-danger checkNoPass-btn">审核不通过</button>
							</td>
							<td class="warn">
								<c:choose>
									<c:when test="${activity.pass == 0 }">
										等待审核
									</c:when>
									<c:when test="${activity.pass == 1 }">
										已审核通过
									</c:when>
									<c:when test="${activity.pass == 2 }">
										审核不通过
									</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:when test="${type == 3 }">
				
				</c:when>
				<c:when test="${type == 4 }">
					<c:forEach items="${items}" var="activity">
						<tr>
							<td>${activity.name}</td>
							<%-- <p>发起人：${showname}</p> --%>
							<td>发起时间：${activity.getDateStartTime()}</td>
							<td>结束时间：${activity.getDateEndTime()}</td>
							<td>活动地点:${activity.place}</td>
							<td>可参与人数：${activity.peopleCount}</td>
							<td>
								<button data="${activity.id}" class="btn btn-danger checkNoPass-btn">审核不通过</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
	</div>
	<script type="text/javascript">
		(function(){
			$('.checkPass-btn').each(function(index, el) {
				var $this = $(this);
				$this.click(function(event) {
					console.log("hhhh");
					$.ajax({
						url: '<c:url value="/admin/nochecked" />',
						type: 'POST',
						dataType: 'json',
						data: {doType: 'pass',activityId: $this.attr('data')},
						success: function(data){
							console.log(data);
							$this.parent('.warn').text('已审核通过');
							console.log($this.parent('.warn'));
							// $this.prop('disabled', true);
							// $('#checkNoPass-btn').prop('disabled', false);
						}
					})
				});
			});
			/*$('.checkPass-btn').on('click', '.checkPass-btn', function(event) {
				event.preventDefault();
				console.log(123);
				var $this = $(this);
				console.log("hhhh");
				$.ajax({
					url: '<c:url value="/admin/nochecked" />',
					type: 'POST',
					dataType: 'json',
					data: {doType: 'pass',activityId: $this.attr('data')},
					success: function(data){
						console.log(data);
						$this.parent('td').children('.warn').text('已审核通过');
						// $this.prop('disabled', true);
						// $('#checkNoPass-btn').prop('disabled', false);
					}
				})
			});
			$('.checkNoPass-btn').on('click', '.checkNoPass-btn', function(event) {
				event.preventDefault();
				var $this = $(this);
				$.ajax({
					url: '<c:url value="/admin/nochecked" />',
					type: 'POST',
					dataType: 'json',
					data: {doType: 'nopass',activityId: $this.attr('data')},
					success: function(data){
						console.log(data);
						$this.parent('td').children('.warn').text('审核不通过');
						// $this.prop('disabled', true);
						// $('#checkPass-btn').prop('disabled', false);
					}
				})
			});*/
			/*$('#checkPass-btn').click(function(event) {
				var $this = $(this);
				console.log("hhhh");
				$.ajax({
					url: '<c:url value="/admin/nochecked" />',
					type: 'POST',
					dataType: 'json',
					data: {doType: 'pass',activityId: $this.attr('data')},
					success: function(data){
						console.log(data);
						$('#warn').text('已审核通过');
						$this.prop('disabled', true);
						$('#checkNoPass-btn').prop('disabled', false);
					}
				})
			});
			$('#checkNoPass-btn').click(function(event) {
				var $this = $(this);
				$.ajax({
					url: '<c:url value="/admin/nochecked" />',
					type: 'POST',
					dataType: 'json',
					data: {doType: 'nopass',activityId: $this.attr('data')},
					success: function(data){
						console.log(data);
						$('#warn').text('审核不通过');
						$this.prop('disabled', true);
						$('#checkPass-btn').prop('disabled', false);
					}
				})
			});*/
		})();

	</script>
</body>
</html>