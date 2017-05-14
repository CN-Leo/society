<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/bookstore/js/angular.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="/bookstore/js/jquery-3.1.1.min.js"></script>

<title>Insert title here</title>
</head>
<body ng-app>
<c:forEach items="${requestScope.cuss}" var="cus">
	<div>${cus.username}</div>
	<div>${cus.type}</div>
</c:forEach>
	<script>
		
	</script>
</body>
</html>