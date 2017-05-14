<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8"> 
	<title>网上书城</title>
	<link rel="stylesheet" href="/bookstore/css/bootstrap.min.css">
	<script src="/bookstore/js/jquery-3.1.1.min.js"></script>
	<script src="/bookstore/js/bootstrap.min.js"></script>
	<script src="/bookstore/js/angular.js"></script>
	<style type="text/css">
*{
box-sizing:border-box;
margin:0;
padding:0;
}
#grad1 {
	height:1300px;
    background: -webkit-linear-gradient(left top, red , blue); /* Safari 5.1 - 6.0 */
    background: -o-linear-gradient(bottom right, red, blue); /* Opera 11.1 - 12.0 */
    background: -moz-linear-gradient(bottom right, red, blue); /* Firefox 3.6 - 15 */
    background: linear-gradient(to bottom right, white , white); /* 标准的语法（必须放在最后） */
}
		img{
			display:inline-block;
			position:relative;
			left:0;
			right:0;
			margin:auto;
		}
	#daohang{
	width:1168px;
	height: 30px;
	position:relative;
			left:0;
			right:0;
			margin:auto;
	font-weight: bold;
	}
	#list{
	width:1024px;
	display:inline-block;
	position:relative;
	
			left:0;

	}
	#welcome{
	position:relative;
	width: 100%;
	height:20px;
	}
	#welcome span{
		display:inline-block;
	}
.left{
	float:left;
}
.right{
	float:right;
}
#search{
width:1168px;
height:45px;
left:0;
right:0;
margin:auto;

}
#searchinput{
border:2px solid red;
}
.carousel-control:focus, .carousel-control:hover {opacity: 0;}
			.carousel-control.left {background-image:inherit;background-color:transparent}
			.carousel-control.right {background-image:none;}
	</style>
</head>
<body ng-app="myapp">
<div id="grad1" ng-controller="mycon">
<div id="myCarousel" class="carousel slide"  data-ride="carousel" data-interval="3000">
	<!-- 轮播（Carousel）指标 -->
	<ol class="carousel-indicators">
		<li data-target="#myCarousel" data-slide-to="0" 
			class="active"></li>
		<li data-target="#myCarousel" data-slide-to="1"></li>
		<li data-target="#myCarousel" data-slide-to="2"></li>
		<li data-target="#myCarousel" data-slide-to="3"></li>
	</ol>   
	<!-- 轮播（Carousel）项目 -->
	<div class="carousel-inner">
		<div class="item active" >
			<img src="/bookstore/img/lunbo4.jpg" alt="First slide" style="width:1168px;height:300px;">
		</div>
		<div class="item" >
			<img src="/bookstore/img/lunbo1.jpg" alt="Second slide" style="width:1168px;height:300px;">
		</div>
		<div class="item" >
			<img src="/bookstore/img/lunbo2.jpg" alt="Third slide" style="width:1168px;height:300px;">
		</div>
		<div class="item">
			<img src="/bookstore/img/lunbo3.jpg" alt="Fourth slide" style="width:1168px;height:300px;">
		</div>
	</div>
	<!-- 轮播（Carousel）导航 -->
	<a class="carousel-control left" href="#myCarousel" 
	   data-slide="prev">&lsaquo;</a>
	<a class="carousel-control right" href="#myCarousel" 
	   data-slide="next">&rsaquo;</a>	
</div> 
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span12">
			

</div>
</div>
<div id="daohang">
<div id="welcome" style="background-color: pink">
<c:choose>
	<c:when test="${empty(requestScope.user)}">
	<span class="left">欢迎访问,请<a href="login.jsp">登陆</a></span>
	</c:when>
	<c:otherwise>
	<span class="left">欢迎登陆,${user.username}</span>
	<a href="/bookstore/login/exit4Hello">退出</a>
	</c:otherwise>
</c:choose>
<span  id="timer" class="right"></span>
</div>
    <form class="bs-example bs-example-form" role="form">
        <div class="row">
          
            <div class="" id="search">
                <div class="input-group" style="margin-top: 10px;">
                    <input type="text" class="form-control"  id="searchtext"style="margin-left: 200px;">
                    <span class="input-group-btn">
                      <img src="/bookstore/images/search.png" style="width:34px;height:34px;background-color: red;margin-left: 200px;" ng-click="click();" >
                    </span>
                    <span style="display:inline-block;width:70px;height:34px;background-color: white;float:right;position:relative;line-height: 34px;text-align: center;font-weight: bold;border: 1px solid gray;cursor:pointer">我的订单</span>
                         <span ng-click="getmycart()" style="display:inline-block;width:70px;height:34px;background-color: red;float:right;position:relative;line-height: 34px;cursor:pointer"><img src="/bookstore/images/shoppingcart.png" style="left:0;width:33px;height:32px;background-color: red;"  data-toggle="modal" data-target="#myModal">
                         <span style="text-align: center;font-weight: bold;margin-left: 6px;color:white" >{{cartcount}}</span></span>
                </div><!-- /input-group -->
                
            </div><!-- /.col-lg-6 -->
        </div><!-- /.row -->
    </form>
<ul class="nav nav-pills nav-justified" id="menu">
  <li class="active"><a href="#">首页</a></li>
  <li value="1" ng-click="changeType(1)"><a href="#wenyi">文艺</a></li>
  <li value="2" ng-click="changeType(2)"><a href="#">童书</a></li>
  <li value="3" ng-click="changeType(3)"><a href="#">科技</a></li>
  <li value="4" ng-click="changeType(4)"><a href="#">教育</a></li>
  <li value="5" ng-click="changeType(5)"><a href="#">生活</a></li>

</ul>
<hr style="border:solid 2px red;"/>
<div id="list" style="position:relative;margin-top: -10px;">

<ul class="list-group" style="float:left;display:inline-block">
    <li class="list-group-item"  ng-repeat="x in records" style="width:120px;" ><a href="#">{{x}}</a></li>
</ul>
<div style="width:500px;height:350px;float:left;display:inline-block;margin-left: 165px;">
<img src="/bookstore/images/268685.jpg" style="width:600px;height:350px;float:left;display:inline-block" id="searchresult">
</div>
</div>
<div class="row" id="picShow" style="margin-top: 20px;">
    <div class="col-sm-6 col-md-2" ng-repeat="book in imges" style="margin-bottom: 10px;">
        <a href="#" class="thumbnail">
            <img src="{{book.img}}"
                 alt="通用的占位符缩略图">
       </a>
      <span style="text-align: center;display: inline-block;width: 169px;height: 17;margin-top: -10px;margin-bottom: 10px;"> {{book.bookname}}</span>
       <input type ="number" style="width:85px !important;height: 34px; display:inline-block" min="1"  class="form-control"  ><button type="button" style="width: 84px !important;" class="btn btn-success" ng-click="cartadd(book)" name="{{book.id}}">加入购物车</button></input>
    </div>
</div>
</div>
</div>
<!-- {{cart.proname}}<span style="display:inline-block;float:right;">￥{{cart.price}}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;X&nbsp;&nbsp;{{cart.quantity}}</span><hr> -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">我的购物车</h4>
            </div>
            <div class="modal-body table-responsive" >
            <table class="table" style="text-align: center;">
            <tr class="warning">
            <td>书名</td>
             <td>单价</td>
              <td>数量</td>
               <td>总价</td>
            </tr>
            <tr ng-repeat ="cart in carts" class="success">
            <td>{{cart.proname}}</td>
             <td>￥{{cart.price}}</td>
              <td>{{cart.quantity}}</td>
             <td></td>
            </tr>
            <tr class="danger">
              <td colspan="3""></td>
            <td  style="text-align: center;">￥{{total}}</td>
            </tr>
            </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">提交订单</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<hr style="border:solid 2px red">
<span><a href="/bookstore/login.jsp">后台登陆</span>
<span><a href="#">我的二手书</span>
<span><a href="#">二手书专栏</span>
<script>
setInterval("timeStr=new Date().toLocaleString();timer.innerText=timeStr;",1000)
 

var app = angular.module("myapp", []);
app.controller("mycon", function($scope) {
	  var user= "${requestScope.user.username}";
	$scope.imges = ['/bookstore/img/book1.jpg','/bookstore/img/book2.jpg']
   $scope.init=function(){
		var results = new Array();
    	$.ajax({ 
    		url: "/bookstore/book/getBooks", 
    		type:"post",
    		context: document.body,
    		async:false,
    		success: function(obj){
    			for(var i =0;i<obj.books.length;i++){
    				results[i]=obj.books[i];
    				}
    			$scope.imges = results;
    	  }}
    	  );
    	}
	  $scope.init();
	   $scope.init2=function(){
		
	    	$.ajax({ 
	    		url: "/bookstore/shoppingcart/getCount", 
	    		type:"post",
	    		data:{
	    			"user":user
	    		},
	    		context: document.body,
	    		async:false,
	    		success: function(obj){
	    			 $scope.cartcount=obj.count;    		
	    	  }}
	    	  );
	    	}
		  $scope.init2();
    $scope.click=function(){
    
        var name = $("#searchtext").val();
    	$.ajax({ 
    		url: "/bookstore/book/getBook", 
    		data:{
    			"name":name
    		},
    		type:"post",
    		context: document.body,
    		success: function(obj){
    	    $("#searchresult").attr("src",obj.img);
    	  }}
    	  );
    }
   $scope.getmycart=function(){
	   var mycarts = new Array();
	   var tol = 0;
	   $.ajax({
		   url:"/bookstore/shoppingcart/getMyCart",
		   type:"post",
		   data:{
			   "user":user
		   },
		   context:document.body,
		   async:false,
		   success:function(obj){
			   for(var i =0;i<obj.carts.length;i++){
				   mycarts[i]=obj.carts[i];
				   tol+=(obj.carts[i].price*obj.carts[i].quantity)
				   
   				}
   			$scope.carts = mycarts;
   			$scope.total = tol;
   			
		   }
		   
	   });
   }
 $scope.cartadd=function(obj){	

	var count =$("button[name='"+obj.id+"']").prev()[0].value;
	var productid=obj.id;
	var proname = obj.bookname;
	var price = obj.price;
	$.ajax({ 
		url: "/bookstore/shoppingcart/addShoppingcart", 
		type:"post",
		data:{
			"user":user,
			"count":count,
			"productid":productid,
			"proname":proname,
			"price":price
			},
		context: document.body,
		async:false,
		success: function(obj){			
			 $scope.cartcount=parseInt(count)+parseInt($scope.cartcount);
	  }}
	  );
	
	
 }
    $scope.changeType=function(obj){
    	   var imgresults = new Array();
    	var lis = $("#menu li");
        var type = lis[obj].innerText;
    	$.ajax({ 
    		url: "/bookstore/booktype/getBookTypes", 
    		type:"post",
    		data:{
    			"type":type
    			},
    		context: document.body,
    		async:false,
    		success: function(obj){
    			for(var i =0;i<obj.booktypes.length;i++){
    				imgresults[i]=obj.booktypes[i].booktype;
    				}
    			$scope.records = imgresults;
    	  }}
    	  );
    }
});


</script>
</body>
</html>