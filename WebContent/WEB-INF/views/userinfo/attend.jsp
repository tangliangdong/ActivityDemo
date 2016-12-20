<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已参与活动页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
</head>
<body>
	<div class="container">
		<h2>已参与活动</h2>
		<a class="btn btn-primary" href="<c:url value='/activity' />">返回首页</a>
		<a class="btn btn-info" href="<c:url value='/userinfo' />">返回个人主页</a>
		<table class="table table-hover">
			<tr>
				<th>活动名称</th>
				<th>发起人</th>
				<th>发起时间</th>
				<th>结束时间</th>
				<th>活动地点</th>
				<th>可参与人数</th>
				<th>操作</th>
				<th>状态</th>
			</tr>
			<c:forEach items="${activitys}" var="activity">
				<tr>
					<td>${activity.name}</td>
					<td><span class="text-info">${activity.getuList().get(0).getShowname()}</span></td>
					<td>${activity.getDateStartTime()}</td>
					<td>${activity.getDateEndTime()}</td>
					<td>${activity.place}</td>
					<td>${activity.peopleCount}</td>
					<td>
						<button data="${activity.id}" class="btn btn-danger attend-btn">退出活动</button>
					</td>
					<td class="status">
						<c:choose>
							<c:when test="${activity.pass == 1}"><span class="text-success">正常状态</span></c:when>
							<c:when test="${activity.pass == -1}"><span class="text-warning">已被删除</span></c:when>
							<c:when test="${activity.pass == 2}"><span class="text-danger">审核未通过</span></c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>

		</table>
	</div>
	<script type="text/javascript">
		(function(){
			$('.attend-btn').each(function(index, el) {
				var $this = $(this);
				$this.click(function(event) {
					$.ajax({
						url: '<c:url value="/userinfo/cancelAttend" />?activityId=' + $(this).attr('data'),
						type: 'post',
						dataType: 'json',
						success:function(data){
							console.log(data);
							if(data.id === '1'){
								$this.parent().parent().remove();
								alert("成功退出该活动");
							}else{
								alert("无法退出活动");
							}
						}
					});
				});	
			});
		})();

	</script>
</body>
</html>