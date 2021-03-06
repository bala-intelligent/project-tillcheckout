<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BK FOODCART</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="<c:url value="/resources/image/favicon.ico"/>" />
<link href="<c:url value="/resources/css/bootstrap.min.css"/>"rel="stylesheet">
<link href="<c:url value="/resources/css/custom.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/respond.js"/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

<style>
body  {
background: linear-gradient(to bottom, black 0%,black 50%,#000000 50%,white 50%,white 100%); /* W3C */
}
</style>

<style>
hr {
	width: 100%;
	height: 8px;
	margin-left: auto;
	margin-right: auto; 
	background-color: #FF0066;
	color: #FF0066;
	border: 0 none;
}
</style>

<style>
#the-slider img {
	width: 100%;
}

/* .navbar { */
/* 	background-color: #282828; */
/* } */

/* .navbar li a { */
/* 	color: white !important; */
/* } */

/* .navbar li a:hover { */
/* 	color: red !important; */
/* } */

/* .navbar-default .navbar-nav>.active>a { */
/* 	background-color: blue !important; */
/* } */

/* .navbar { */
/* 	padding: 10px; */
/* } */
</style>
				
		

</head>
<body>
 
    <hr/>
  
	<h1 align="center" style="background-color:white;">BK FOODCART</h1>
<h4 align="right"><!-- display the userId just entered -->
				<c:if test="${pageContext.request.userPrincipal.name != null}">
                            <li class="active"><a>Current User: ${pageContext.request.userPrincipal.name}</a></li>
                            </c:if></h4>

	
	<hr/>
	
	
	
	
<div class="container">
  
  <!-- Navigation -->
  <div class="row">
  
   <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <div class="cols-md-2">
      <a class="navbar-brand" href="#"><img src="<c:url value="/resources/image/logofoodcart.png"/>"  alt="" width="200px"></a>
       </div>
    </div>
    <div class="cols-md-10">
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      
        <li class="active"><a href="<c:url value="/home" />">Home</a></li>
				<li class="active"><a href="<c:url value="/about" />">About</a></li>
				<li class="active"><a href="http://balakannansachin5@gmail.com">Contact</a></li>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
				<li class="active"><a href="<c:url value="/frontcrud" />">Add Products</a></li>
				</sec:authorize>
				<c:if test="${pageContext.request.userPrincipal.name != null}">
                            <li class="active"><a>Welcome: ${pageContext.request.userPrincipal.name}</a></li>
                            <li class="active"><a href="<c:url value="/logout" />">Logout</a></li>
                            <c:if test="${pageContext.request.userPrincipal.name == 'admin'}">
                                <li class="active"><a href="<c:url value="admin/" />">Admin</a></li>
                            </c:if>
                            
                        </c:if>

                            <c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
				<li><a href="<c:url value="user/cart" />"> <span
						class="glyphicon glyphicon-shopping-cart"></span> View Cart
				</a></li>
				</c:if>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Availables <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li class="active"><a href="veg">VEGETARIAN</a></li>
            <li class="active"><a href="nonveg">NONVEGETARIAN</a></li>
            <li class="active"><a href="snacks">SNACKS</a></li>
            <li class="active"><a href="beverages">BEVERAGES</a></li>
            
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <c:if test="${pageContext.request.userPrincipal.name == null}">
        <li class="active"><a href="<c:url value="memberShip.obj" />"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
       <li class="active"><a href="<c:url value="loginpages" />"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
       </c:if>
       <sec:authorize access="hasRole('ROLE_USER')">
				<li class="active"><a href="<c:url value="registers" />"><span class="glyphicon glyphicon-user"></span>Cart Registry</a></li>
				</sec:authorize>
      </ul>
      </div>
    </div>
  </div>
</nav>
  </div>
</div>
           



	
	<!-- end of navigation bar -->
	
	<div class="container-fluid" style="background-color:white;color:black;height:50px;">
	   <p class="text-center danger">
		<Strong>
		
		If a person cares for his health,it is difficult to find a doctor who would know what's better for him.<mark>-Socrates</mark>
		
		</Strong>
	</p>
	</div>
	<div class="container">
	<div class="row" style="margin-top:25px">
	 <div class="col-md-3">
                <p class="lead"><a href="<c:url value="/category"/>">FOOD CATEGORIES</a></p>
                 <div class="list-group">
                <c:forEach items="${foodproductsList}" var="foodproducts"> 
                <ul class="nav nav-pills nav-stacked">
                <li>
                <a href="<c:url value='/category/${foodproducts}' />">${foodproducts.category}</a>
                </li>
                </ul>
                </c:forEach>
<!--                     <a href="veg" class="list-group-item active">VEGETARIAN</a> -->
<!--                     <a href="nonveg" class="list-group-item">NON-VEGETARIAN</a> -->
<!--                     <a href="snacks" class="list-group-item">SNACKS</a> -->
<!--                     <a href="beverages" class="list-group-item">BEVERAGES</a> -->
                </div>
                
            </div>
	
	 <div class="col-md-9"><img src="<c:url value="/resources/image/staticimage1.png"/>" class="img-responsive" width="1500px" height="500px"> 
      </div> 
      </div><div class="clearfix"></div>
      </div>
   
	

	<!---row2--->

	<div class="container">
	
	<div class="row">
	<div id="myCarousel" class="carousel  slide" style="margin-top:20px">
  <!-- Dot Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>
  <!-- Items -->
  <div class="carousel-inner">
    <div class="active item">  <img src="<c:url value="/resources/image/slider1.jpg"/>" alt="..."> </div>
    <div class="item">  <img src="<c:url value="/resources/image/slider2.jpg"/>" alt="..."> </div>
    <div class="item">  <img src="<c:url value="/resources/image/slider3.jpg"/>" alt="..."></div>
  </div>
  <!-- Navigation -->
   <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
</div>
	</div>
</div>
      
	<!---row3--->
	<div class="container">
		<div class="col-md-3 column productbox">
			<a href="veg"><img
				src="<c:url value="/resources/image/thumbnail1.jpg"/>"
				class="img-responsive"></a>
			<div class="producttitle">VEGETARIAN</div>
			<div class="productprice">
				<div class="pull-right">
					<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
				</div>
			</div>
		</div>
		<div class="col-md-3 column productbox">
			<a href="nonveg"><img
				src="<c:url value="/resources/image/thumbnail2.jpg"/>"
				class="img-responsive"></a>
			<div class="producttitle">NON VEGETARIAN</div>
			<div class="productprice">
				<div class="pull-right">
					<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
				</div>
			</div>
		</div>
		<div class="col-md-3 column productbox">
			<a href="snack"> <img
				src="<c:url value="/resources/image/thumbnail3.jpg"/>"
				class="img-responsive"></a>
			<div class="producttitle">SNACKS</div>
			<div class="productprice">
				<div class="pull-right">
					<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
				</div>
			</div>
		</div>
		<div class="col-md-3 column productbox">
			<a href="bev"> <img
				src="<c:url value="/resources/image/thumbnail4.png"/>"
				class="img-responsive"></a>
			<div class="producttitle">BEVERAGES</div>
			<div class="productprice">
				<div class="pull-right">
					<a href="#" class="btn btn-danger btn-sm" role="button">BUY</a>
				</div>
			</div>
		</div>
	</div>
	<style>
.productbox {
	background-color: #ffffff;
	padding: 10px;
	margin-bottom: 10px;
	-webkit-box-shadow: 0 8px 6px -6px #999;
	-moz-box-shadow: 0 8px 6px -6px #999;
	box-shadow: 0 8px 6px -6px #999;
}

.producttitle {
	font-weight: bold;
	padding: 5px 0 5px 0;
}

.productprice {
	border-top: 1px solid #dadada;
	padding-top: 5px;
}

.pricetext {
	font-weight: bold;
	font-size: 1.4em;
}
</style>
	<%@include file="footer.jsp"%>

</body>
</html>