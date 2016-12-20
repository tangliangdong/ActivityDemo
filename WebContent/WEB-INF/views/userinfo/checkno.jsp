<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核未通过的活动</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
<style type="text/css">
	.deleteAct:after{
		content: "此活动已删除";
		display: block;
		font-size: 12px;
		font-weight: bold;
		color: #FF372D;
		height: 20px;
		width: 100px;
	}

</style>
</head>
<body>
	<div class="container">
		<h2>审核未通过的活动</h2>
		<a class="btn btn-primary" href="<c:url value='/activity' />">返回首页</a>
		<a class="btn btn-info" href="<c:url value='/userinfo' />">返回个人主页</a>
		<table class="table table-hover">
			<tr>
				<th>活动名称</th>
				<th>发起人</th>
				<th>开始时间</th>
				<th>结束时间</th>
				<th>活动地点</th>
				<th>可参与人数</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${activitys}" var="activity">
				<tr>
					<td class="name">${activity.name}</td>
					<td><span class="text-info">${showname}</span></td>
					<td>${activity.getDateStartTime()}</td>
					<td>${activity.getDateEndTime()}</td>
					<td>${activity.place}</td>
					<td>${activity.peopleCount}</td>
					<td>
						<button data="${activity.id}" class="btn btn-danger delete-btn">删除活动</button>
					</td>
				</tr>
			</c:forEach>
		</table>
		
	</div>
	<script type="text/javascript">
	(function(){
		$('.delete-btn').each(function(index, el) {
			var $this = $(this);
			$this.click(function(event) {
				$.ajax({
					url: '<c:url value="/userinfo/checkedno" />',
					type: 'POST',
					dataType: 'json',
					data: {activityId: $this.attr('data')},
					success:function(data){
						if(data.isUpdate){
							$this.prop('disabled', true);
							$this.parent().parent().find('.name').addClass('deleteAct');
						}else{
							alert("取消活动失败");
						}
						console.log(data);
					}
				});
			});
		});
	})();
		


	</script>
</body>
</html>