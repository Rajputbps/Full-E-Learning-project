<!DOCTYPE html>
        <%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>E-Learn</title>
<link rel="stylesheet" type="text/css" href="resources/css/header.css"> 
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!--boostrap_js--->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!--boostrap_font--->
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript">
$(document).ready(function() { 
	  /* --------------------------- Signup ----------------------------- */ 
 	   $('#registrationForm').submit(function() {  
		   $.post({
			   url:'registerUser', 
			   data : $('form[name=contentForm]').serialize(),
			   success:function(data) {  
				   window.location.reload(); 
				   //alert("success");
				   $("#loginModalCenter").append("<div><u>Message</u>:<br /><br />" +  msg + "</div>");
			   }
		   })
	}); 
	  
	   
	  
	  
	});
</script>
 
</head> 
<body>
 <section id="nav-bar">
  
<nav class="navbar navbar-expand-lg navbar-light" style="background-color: lightgray;
    margin-bottom: 1px;">
    <a class="navbar-brand" href="#"><img src="resources/images/logo.png" style="width: 140px; padding-left: 15px; height: 40px;"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>
    
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
    <ul class="navbar-nav ml-auto" style="float: right;">
    <c:if test="${adminDetails != null}">
    <li class="nav-item" style="padding-right: 5px">
        <a class="nav-link" href="#">Hi. <b>${adminDetails.f_name}</b></a>
      </li>
    </c:if>
      <li class="nav-item" style="padding-right: 5px">
        <a class="nav-link" href="perform_logout"><i class="fa fa-fw fa-sign-out"></i><b class="text-danger">Logout</b></a>
      </li>

    </ul>
    </div>
</nav>

</section>
</body>
</html>