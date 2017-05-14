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
<title>Insert title here</title>
<style>
*{
box-sizing:border-box;
margin: 0;
padding: 0;
}
html,body{
width: 100%;
	height:100%;
}
	#panel{
	dispaly:inline-block;
	width: 100%;
	height:100%;
    background: linear-gradient(to bottom right, skyblue , lightgreen); /* 标准的语法（必须放在最后） */
	}
	#caidan{
	
		}
</style>
</head>
<body ng-app="myapp">
	<table border="1" id="panel" ng-controller="mycon">
	<tr>
		<td colspan="2" style="height:130px;background-color: red" id="header">

		</td>
	</tr>
	<tr>
		<td style="width:10%;">
		<div  id="caidan">
			<ul class="nav nav-pills nav-stacked">
			  <li class="active"><a href="#">菜單</a></li>
			  <li id="svn" ng-click="show1()"><a href="#">用戶管理</a>
			  		<ul class="nav nav-pills nav-stacked" id="innersvn" ng-if="isShow">
					  <li><a href="#">查看用戶列表</a></li>
					  <li><a href="#">iOS</a></li>
					  <li><a href="#">VB.Net</a></li>
					  <li><a href="#">Java</a></li>
					  <li><a href="#">PHP</a></li>
					  
					</ul>
			  </li>
			  <li><a href="#">iOS</a></li>
			  <li><a href="#">VB.Net</a></li>
			  <li><a href="#">Java</a></li>
			   <li><a href="#">VB.Net</a></li>
			  <li><a href="#">PHP</a></li>
			    <li></li>
			      <li></li>
			        <li></li>
			          <li></li>
			</ul>
			</div>
		</td>
		<td>2</td>
	</tr>
	<tr>
		<td colspan="2" style="height:100px;">1</td>
	</tr>
	</table>
	<script>
		angular.module("myapp",[])
		.controller("mycon",function($scope){
			$scope.isShow=false;
			$scope.show1=function(){
				if($scope.isShow==true){
					$scope.isShow=false;
				}else{
					$scope.isShow=true;
				}
			}
		})
	</script>
</body>
</html>