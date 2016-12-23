<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/bootstrap/css/bootstrap.css '/>">
<script src="<c:url value='/resources/js/jquery-2.2.4.min.js' />"></script>
<title>注册用户</title>
<style type="text/css">
	.hasUser:after{
		content: "该账号已存在";
		display: block;
		font-size: 12px;
		font-weight: bold;
		color: #FF372D;
		height: 20px;
		width: 70px;
	}

	.passwordError:after{
		content: "两次密码不相同";
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
		<h2>注册</h2>
		<form class="form-horizontal" action="register" method="post">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">昵称</label>
		    <div class="col-sm-10">
		      <input type="text" class="input-small" name="showname" placeholder="showname"/>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">账号</label>
		    <div class="col-sm-10">
		      <input type="text" id="account" class="input-small" name="username" placeholder="username" />
		      <span id="remind-span" style="color:red"></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
		    <div class="col-sm-10">
		       <input type="password" class="input-small" name="password" id="password" placeholder="Password"/>
		    </div>
		  </div>
		  <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">重复密码</label>
		    <div class="col-sm-10">
		       <input type="password" class="input-small" id="repepassword" name="password2" placeholder="Password"/>
		       <span ></span>
		    </div>
		  </div>
		  <div class="form-group">
		    <div class="col-sm-offset-2 col-sm-10">
		      <button type="submit" class="btn btn-default">注册</button>
		      <a href="<c:url value="/login" />" class="btn btn-default">去登录页面</a>
		    </div>
		  </div>
		</form>
	</div>
	
	

	<script type="text/javascript">
		(function(){

			$('#account').change(function(event) {
				var $this = $(this);
				$.post('<c:url value="/login/checkUser" />', {username: $this.val()}, function(data, textStatus, xhr) {
					console.log(data);
					console.log(textStatus);
					console.log(xhr);
					if(data.hasUser){
						$('#remind-span').text('此账号已被注册');
						$('#remind-span').fadeIn('100', function() {
							setTimeout(function(){
								$('#remind-span').fadeOut('100');
							},1000);
						});
					}else{
						$('#remind-span').text('');
					}
				},'json');
				/*$.ajax({
					url: '<c:url value="/login/checkUser" />',
					type: 'POST',
					dataType: 'json',
					data: {username: $this.val()},
					success:function(data){
						console.log(data);
						if(data.hasUser){
							$this.addClass('hasUser');
						}
					}
				});*/
			});

			$('#repepassword').change(function(event) {
				var password = $('#password'),
					$this = $(this);

				if(password.val() !== $this.val()){
					$this.next().addClass('passwordError');
					console.log(123);
				}else{
					$this.next().removeClass('passwordError');
				}
			});
		})();
		
			

	</script>
</body>
</html>