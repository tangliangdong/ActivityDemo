<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>已发布活动页面</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-2.2.4.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.js'/>"></script>
</head>
<body>
	<div class="container">
		<h2>已发布活动</h2>
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
			</tr>
			
			<c:forEach items="${activitys}" var="activity">
				<tr>
					<td>${activity.name}</td>
					<td>${activity.getuList().get(0).getShowname()}</td>
					<td>${activity.getDateStartTime()}</td>
					<td>${activity.getDateEndTime()}</td>
					<td>${activity.place}</td>
					<td>${activity.peopleCount}</td>
					<td>
						<button data="${activity.id}" class="btn btn-danger public-btn">取消活动</button>
						<button data="${activity.id}" class="btn btn-danger public-detail">活动详情</button>
					</td>
				</tr>
			</c:forEach>
		</table>

		<h4 style="display: none" id="activity-name">活动名称</h4>
		<h4 style="display: none" id="activity-count">活动人数</h4>
		<table id="userList" class="table table-hover">
		</table>
	</div>
	<script type="text/javascript">
		(function(){
			$('.public-btn').each(function(index, el) {
				var $this = $(this);
				$this.click(function(event) {
					$.ajax({
						url: '<c:url value="/userinfo/public" />?type=1&activityId=' + $(this).attr('data'),
						type: 'post',
						dataType: 'json',
						success:function(data){
							console.log(data);
							if(data.id === '1'){
								$this.parent().parent().remove();
								alert("成功取消活动");
							}else{
								alert("无法取消活动");
							}
						}
					});
				});
			});
			$('.public-detail').each(function(index, el) {
				var $this = $(this);
				$this.click(function(event) {
					$.post('<c:url value="/userinfo/public" />?type=2',{activityId: $(this).attr('data')}, function(data, textStatus, xhr) {
						var obj = JSON.parse(data);
						console.log(obj);
						var $userList = $('#userList'),
							$name = $('#activity-name'),
							$count = $('#activity-count');

						$name.css('display', 'block');
						$count.css('display', 'block');
						$name.text('活动名称: '+obj[0].name);
						$count.text('活动人数: '+obj[0].peopleCount);
						
						console.log($userList.find('tr'));
						$userList.empty();
						$userList.append(
							'<tr>'+
								'<th>用户昵称</th>'+
							'</tr>'
						)
						for (var i = 0; i < obj[0].uList.length; i++) {
							$userList.append(
							'<tr>'+
								'<td>'+ obj[0].uList[i].showname +'</th>'+
							'</tr>'
							)
						}
					});
				});
			});
		})();

	</script>
</body>
</html>