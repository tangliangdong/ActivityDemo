<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<style type="text/css">
	.checkNo:after{
		content: "审核不通过";
		display: block;
		font-size: 12px;
		font-weight: bold;
		color: #FF372D;
		height: 20px;
		width: 70px;
	}
	.checkPass:after{
		content: "审核通过";
		display: block;
		font-size: 12px;
		font-weight: bold;
		color: #FF372D;
		height: 20px;
		width: 70px;
	}

</style>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
</head>
<body>
	<div class="container hhh">
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
					<tr>
						<th>用户昵称</th>
						<th>账号</th>
						<th>操作</th>
						<th>用户状态</th>
					</tr>
					<c:forEach var="item" items="${items}">
						<tr>
							<td>${item.showname }</td>
							<td>${item.username }</td>
							<td>
								<a class="btn btn-info public-activity" href="<c:url value="/admin/detail"/>">发布的活动</a>
								<button class="btn btn-danger freeze-btn" ${item.power != 1?"disabled":""} data="${item.id}">冻结该用户</button>
								<button class="btn btn-danger deblocking-btn" ${item.power == 1?"disabled":""} data="${item.id}">解封该用户</button>
								
							</td>
							<td class="status">
								<c:choose>
									<c:when test="${item.power == 1 }">
										<p class="text-success">正常状态</p>
									</c:when>
									<c:when test="${item.power == -1 }">
										<p class="text-danger">冻结状态</p>
									</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			
				<c:when test="${type == 2 }">
					<tr>
						<th>活动名称</th>
						<th>发起时间</th>
						<th>结束时间</th>
						<th>活动地点</th>
						<th>可参与人数</th>
						<th>审核活动</th>
						<th>活动状态</th>
					</tr>
					<c:forEach items="${items}" var="activity">
						<tr>
							<td>${activity.name}</td>
							<%-- <p>发起人：${showname}</p> --%>
							<td>${activity.getDateStartTime()}</td>
							<td>${activity.getDateEndTime()}</td>
							<td>${activity.place}</td>
							<td>${activity.peopleCount}</td>
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
					<tr>
						<th>活动名称</th>
						<th>发起时间</th>
						<th>结束时间</th>
						<th>活动地点</th>
						<th>可参与人数</th>
						<th>审核活动</th>
					</tr>
					<c:forEach items="${items}" var="activity">
						<tr>
							<td>${activity.name}</td>
							<%-- <p>发起人：${showname}</p> --%>
							<td>发起时间：${activity.getDateStartTime()}</td>
							<td>结束时间：${activity.getDateEndTime()}</td>
							<td>活动地点:${activity.place}</td>
							<td>可参与人数：${activity.peopleCount}</td>
							<td>
								<button data="${activity.id}" class="btn btn-danger noCheckPass-btn">通过审核</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:when test="${type == 4 }">
					<tr>
						<th>活动名称</th>
						<th>发起时间</th>
						<th>结束时间</th>
						<th>活动地点</th>
						<th>可参与人数</th>
						<th>审核活动</th>
					</tr>
					<c:forEach items="${items}" var="activity">
						<tr>
							<td><span>${activity.name}</span></td>
							<%-- <p>发起人：${showname}</p> --%>
							<td>发起时间：${activity.getDateStartTime()}</td>
							<td>结束时间：${activity.getDateEndTime()}</td>
							<td>活动地点:${activity.place}</td>
							<td>可参与人数：${activity.peopleCount}</td>
							<td>
								<button data="${activity.id}" class="btn btn-danger passedCheckNo-btn">审核不通过</button>
							</td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</table>
		<!-- <table class="table table-hover">
			<tr>
				<td></td>
				<td>发起时间：</td>
				<td>结束时间：</td>
				<td>活动地点:</td>
				<td>可参与人数:</td>
				<td>
					<button data="${activity.id}" class="btn btn-danger forbid-btn">禁止该活动</button>
				</td>
			</tr>
		</table> -->
	</div>
	<script type="text/javascript">
		(function(){
			$('.freeze-btn').each(function(index, el) {
				var $this = $(this);
				$this.click(function(event) {
					$.ajax({
						url: '<c:url value="/admin/user" />',
						type: 'POST',
						dataType: 'json',
						data: {userId: $this.attr('data'),doType:1},
						success: function(data){
							console.log(data);
							if(data.isUpdate){
								$this.parent().next('.status').text('已被冻结');
								$this.prop('disabled', true);
								$this.next().prop('disabled', false);
								console.log($this.next());
								/*$this.parent().parent().parent().after(
									'<table class="table table-hover">' +
									'<tr>' +
									    '<td></td>' +
										'<td>发起时间：</td>'+
										'<td>结束时间：</td>'+
										'<td>活动地点:</td>'+
										'<td>可参与人数:</td>'+
										'<td>'+
											'<button data="${activity.id}" class="btn btn-danger forbid-btn">禁止该活动</button>'+ 
										'</td>'+
									'</tr>' +
								'</table>');*/
							}
							
						}
					});
				});
			});

			$('.deblocking-btn').each(function(index, el) {
				var $this = $(this);
				$this.click(function(event) {
					$.ajax({
						url: '<c:url value="/admin/user" />',
						type: 'POST',
						dataType: 'json',
						data: {userId: $this.attr('data'), doType : 2},
						success: function(data){
							console.log(data);
							if(data.isUpdate){
								$this.parent().next('.status').text('已被解封');
								$this.prop('disabled', true);
								$this.prev().prop('disabled', false);
							}
							
						}
					});
					
				});
			});

			$('.checkPass-btn').each(function(index, el) {
				var $this = $(this);
				$this.click(function(event) {
					console.log("hhhh");
					$.ajax({
						url: '<c:url value="/admin/activity" />',
						type: 'POST',
						dataType: 'json',
						data: {doType: 'pass',activityId: $this.attr('data')},
						success: function(data){
							$this.parent().next('.warn').text('已审核通过');
							$this.next().prop('disabled', false);
							$this.prop('disabled', true);
						}
					});
				});
			});
			$('.checkNoPass-btn').each(function(index, el) {
				var $this = $(this);
				$this.click(function(event) {
					console.log("hhhh");
					$.ajax({
						url: '<c:url value="/admin/activity" />',
						type: 'POST',
						dataType: 'json',
						data: {doType: 'nopass',activityId: $this.attr('data')},
						success: function(data){
							console.log(data);
							$this.parent().next('.warn').text('审核不通过');
							$this.prev().prop('disabled', false);
							$this.prop('disabled', true);
						}
					});
				});
			});

			$('.noCheckPass-btn').each(function(index, el) {
				var $this = $(this);
				$this.click(function(event) {
					$.ajax({
						url: '<c:url value="/admin/nochecked" />',
						type: 'POST',
						dataType: 'json',
						data: {activityId: $this.attr('data')},
						success: function(data){
							console.log(data);
							if(data.isUpdate){
								$this.prop('disabled', true);
								$this.parent().parent().find('td').first().addClass('checkPass');
							}
							alert(data.word);
						}
					});
				});
			});

			$('.passedCheckNo-btn').each(function(index, el) {
				var $this = $(this);
				$this.click(function(event) {
					$.ajax({
						url: '<c:url value="/admin/checked" />',
						type: 'POST',
						dataType: 'json',
						data: {activityId: $this.attr('data')},
						success: function(data){
							console.log(data);
							if(data.isUpdate){
								$this.prop('disabled', true);
								$this.parent().parent().find('td').first().children('span').addClass('checkNo');
								console.log($this.parent().parent().find('td').first().children('span'));
							}
							alert(data.word);
						}
					});
				});
			});


			
			
		})();

	</script>
</body>
</html>