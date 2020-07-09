<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/new.css">
<link rel="stylesheet" type="text/css" href="resources/css/home.css">
<script type="text/javascript" src="resources/javaScript/message.js"></script>
</head>
<body style="padding-top: 5%;">
<div class="container-fluid">
<!------slider----->
<div id="slider">
	<div id="headerslider" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner ">
    <div class="carousel-item active" data-interval="10000">
      <img src="resources/images/1.jpg" class="d-block img-fluid" >
      
    </div>
    <div class="carousel-item" data-interval="2000">
      <img src="resources/images/2.jpg" class="d-block img-fluid" >
    </div>
    <div class="carousel-item">
      <img src="resources/images/1e.jpg" class="d-block img-fluid" >
    </div>
  </div>
  <a class="carousel-control-prev" href="#headerslider" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#headerslider" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
<!-----About Us----->
<section id="about">
	<div class="container">
		

<div class="about-section" style=" padding: 50px;
  text-align: center;
  background-color: #474e5d;
  color: white;">
  <h1>About Us</h1>
 This website has been developed by the students of Thakur College of Science and Commerce for students of BscIT.
 E-Learn Website is been created by keeping the things in mind that people nowadays prefer to study online. 
We tried are best to make this website more easy and convenient to navigate for the users.
</div>

	</div>
</section>  

<section>  
<div class="popularcourse text-center">
<span class="headerText">Popular Courses</span> <br>
<span>Your All Favorite courses Available Here</span>
</div>
<div class="courseLIst">
<div class="row">
<c:forEach var="pcourse" items="${courseName}" varStatus="number">
<c:if test="${number.count<=4}">
<div class="col-lg-3 col-md-3">
<div class="card"  >
  <img class="card-img-top courseImage img-thumbnail" src="resources/courseImages/${pcourse.course_image}" alt="${pcourse.course_image}">
  <div class="card-body">
    <a href="courceDetail${pcourse.course_Id}" class="card-title" style="font-size: 20px; font-weight: bold;">${pcourse.course_Name}</a> 
  </div>
</div> 
</div>
</c:if> 
</c:forEach>
</div>
</div>
</section>
</div>
<!-- Message -->

 <div id="overlay" onclick="off()">
  <div   class="userDetails">
   <h3 id="userName">Name: </h3>
  </div> 
</div>
    <%@include file="footer.jsp"%>
</body>
</html>
