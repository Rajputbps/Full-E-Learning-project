<!doctype html>
        <%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"  ></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
 	<script type="text/javascript" src="resources/javaScript/formValidation.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
    <link rel="stylesheet" type="text/css" href="resources/css/forgetPassword.css">
    <title>Forget Password</title>
    
    <script type="text/javascript">
    $(document).ready(function() {
		$("#unlock").hide();
		$("#newPasswordField").keyup(function() { 
			$("#lock").hide();
			$("#unlock").show();
			$("#unlock").css({"color": "#57ff84"});
		});
		
	}); 
    </script>
    
  </head>
  <body> 
     <div class="container">
     <div  id="rrrrmessageBox" class="text-center meggae"></div>
     <div class="formDiv text-center">
         <div> 
      <span id="unlock"><i class="fas fa-unlock" style="font-size: 150px;"></i></span>
      <span id="lock"><i class="fas fa-lock" style="font-size: 150px;"></i></span>
      </div>  
      <div style="margin-top: 1%;"> <h4>Waoooo! You Unlock Your Account!!</h4>  
      <p>Enter your new password :)</p></div>
         <form action="newPaswsword" method="POST"  name="newPasswordForm" role="form" data-toggle="validator"  style="padding: 3% 30% 5% 30%;">
         <input type="hidden" name="token" value="${token}">
         <div class="form-group mb-3">  
  			<input name="newPasswordField"  id="newPasswordField" placeholder="Enter Password" type="password" class="form-control"  aria-describedby="basic-addon1" required>
			</div> 
			 <div class="form-group mb-3"> 
  			<input name="cnewPasswordField" id="cnewPasswordField" placeholder="Enter Confirm Password" type="password" class="form-control" onkeyup="matchResetPassword()" aria-describedby="basic-addon1" required><br>
  			 <div class="help-block with-errors"><p id="cnewPasswordFielderror" style="color: rgb(255, 0, 0);"></p></div>
			</div> 
		<div class="form-group text-center"> 
			<input   class="submit center-block btn btn-lg btn-primary" value="Submit" type="submit"> 
		</div>
         </form>
     </div>
     </div>
    </body>
</html>