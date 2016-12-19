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
	.deleteAct:before{
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
		<c:forEach items="${activitys}" var="activity">
			<div class="activity-box">
				<h3>${activity.name}</h3>
				<p>发起人：${showname}</p>
				<p>发起时间：${activity.getDateStartTime()}</p>
				<p>结束时间：${activity.getDateEndTime()}</p>
				<p>活动地点:${activity.place}</p>
				<p>可参与人数：${activity.peopleCount}</p>
				<button id="delete-btn" data="${activity.id}" class="btn btn-danger">删除活动</button>
			</div>
		</c:forEach>
	</div>
	<script type="text/javascript">
	(function(){
		$('#delete-btn').click(function(event) {
			var $this = $(this);
			$.ajax({
				url: '<c:url value="/userinfo/checkedno" />',
				type: 'POST',
				dataType: 'json',
				data: {activityId: $this.attr('data')},
				success:function(data){
					if(data.isUpdate){
						$this.prop('disabled', true);
						$this.parent().find('h3').addClass('deleteAct');
						console.log($this.parent());
					}else{

					}
					console.log(data);
				}
			})
		});
	})();
		


	</script>
</body>
</html>