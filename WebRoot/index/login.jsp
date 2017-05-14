<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="/bookstore/js/angular.js"></script>
	<link rel="stylesheet" href="/bookstore/css/bootstrap.min.css">
	<script src="/bookstore/js/jquery-3.1.1.min.js"></script>
	<script src="/bookstore/js/bootstrap.min.js"></script>
<title>登陆</title>
<style>
html,body{height:100%; width:100%; overflow:hidden; margin:0;
padding:0;}
#grad1 {
	height:100%;
    background: -webkit-linear-gradient(left top, red , blue); /* Safari 5.1 - 6.0 */
    background: -o-linear-gradient(bottom right, red, blue); /* Opera 11.1 - 12.0 */
    background: -moz-linear-gradient(bottom right, red, blue); /* Firefox 3.6 - 15 */
    background: linear-gradient(to bottom right, skyblue , lightgreen); /* 标准的语法（必须放在最后） */
}
	#login{
	
		width:500px;
		height:300px;
		position:absolute;
		right: 0;
		left:0;
		top:0;
		bottom: 0;
		margin: auto;
		
	}
	.control-label{
	width:80px;
	}
.form-group{

	position: relative;
	top:60px;
}
.button{

	left:0;
	right:0;
	margin-left:auto;
	margin-right:auto;
}

</style>
</head>
<body ng-app="myapp">
<div id="grad1">
<div id="login" ng-controller="mycon">
<h1>欢迎登陆网上书城系统</h1>
<form class="form-horizontal" role="form" name="myform" action="${pageContext.request.contextPath}/login/login" method="post">
  <div class="form-group">
    <label for="firstname" class="col-sm-2 control-label">用户名</label>
    <div class="col-sm-10" >
      <input type="text" class="form-control"  placeholder="请输入用户名" required name="username" ng-click="show()">
  	<span style="color:red" ng-show="isShow">${unlogin}</span>
    </div>
  </div>
  <div class="form-group">
    <label for="lastname" class="col-sm-2 control-label">密码</label>
    <div class="col-sm-10">
      <input type="text" class="form-control"  placeholder="请输入密码"  required name="password" ng-click="show()">
    </div>
  </div>
 
  <div class="form-group button">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-primary btn-lg">登录</button>
        <button type="button" class="btn btn-default btn-lg" onclick="register()">注册</button>
    </div>
  </div>
</form>
</div>
</div>
<script>
angular.module('myapp',[])
.controller('mycon',function($scope){
	$scope.isShow=true;
	$scope.show=function(){
		if($scope.isShow==true){
			$scope.isShow=false;
		}
	}
})
	function register(){
		window.open("/bookstore/index/register.jsp","注册","height=400,width=600,left=200,top=200");
	}
</script>
</body>
</html>