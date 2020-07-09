<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/bootstrap-form-validation.css" rel="stylesheet"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
function on() {
	  document.getElementById("overlay").style.display = "block";
	}

	function off() {
	  document.getElementById("overlay").style.display = "none";
	}
	
$(document).ready(function() { 
	$('#userRegistrationForm').click(function() {
		//alert("submit");
		$.post({
			url:'registerUser', 
			data: $('form[name=contentForm]').serialize(),
			success:function(response){
				alert(response);
                 $("#messageBox").empty(); 
                 $("#messageBox").append("<br>"+response+"<br><br>"); 
                 on();
			}
		});
	});  
}); 
</script>
<style type="text/css">
.meggae{ 
font-size: 20px;
 color: #ffffff; 
 background-color: #81dc81;
}
</style>
<script src="js/registration.js"></script>
</head>
<body style="background-image: url(resources/images/laptop.png); background-repeat:no-repeat; background-size: cover;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;">
<section class="footer-form padding-top-xl padding-bottom-xl" aria-label="Contact Form">
<div  id="messageBox" class="text-center meggae"></div>



 <form name="contentForm" class="contact-form"  method="post"  role="form" data-toggle="validator" >
          <div class="form schedule-assessment">
            <div class="row margin-top-l">
            <div class="form-group col-md-6">
              <label for="first_name" class="sr-only">First Name: </label>
              <input name="first_name" id="first_name" onkeyup="fisValid()" placeholder="First name" type="text" value="" required="required"  data-error="*Please enter your First name.">
              <div class="help-block with-errors"><p id="fvalidateerror" style="color: rgb(255, 0, 0);"></p></div>
            </div><!-- close col-->  
            <div class="form-group col-md-6">
              <label for="last_name" class="sr-only">Last Name: </label>
              <input name="last_name" id="last_name" placeholder="Last name" type="text" value="" onkeyup="lisValid()" required="required" data-error="*Please enter your Last name.">
              <div class="help-block with-errors"><p id="lvalidateerror" style="color: rgb(255, 0, 0);"></p></div>
            </div><!-- close col-->  
            </div><!-- close row-->

            <div class="row">
            <div class="form-group col-md-6">
              <label for="email" class="sr-only">Email Address: </label>
              <input name="email" id="email" placeholder="Email Address" type="email" value="" required="required" data-error="*Please enter a valid email.">
              <div class="help-block with-errors"></div>
            </div>
            <div class="form-group col-md-6">
              <label for="phone_number" class="sr-only">Phone Number: </label>
              <input name="phone_number" id="phone_number" placeholder="Phone number" type="tel" value="" required="required" data-error="*Please enter your phone number">
              <div class="help-block with-errors"></div>
            </div><!-- close col--> 
            </div><!-- close row-->
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="password" class="sr-only">Password: </label>
                  <input name="password" id="password" placeholder="Enter Password" type="password" value="" required="required" data-error="*Please enter password.">
                  <div class="help-block with-errors"></div>
                </div>
                <div class="form-group col-md-6">
                  <label for="cpassword" class="sr-only">Confirm Password: </label>
                  <input name="cpassword" id="cpassword" placeholder="Enter Confirm Password" type="password" value="" required="required" onkeyup="matchPassword()" data-error="*Please enter confirm password.">
                  <div class="help-block with-errors"><p id="passworderror" style="color: rgb(255, 0, 0);"></p></div>
                </div>
                </div><!-- close row-->
            <div class="form-group text-center">
            <input class="submit center-block btn btn-primary"  id="userRegistrationForm" value="Submit" type="submit">
            </div>
          </div>
</form>

   <!-- <div class="wrapper">
    <div class="container">          
      <div class="row d-flex justify-content-center">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
          <div class="text-center" style="padding:90px 10px 30px 10px"><span class="registrationHeader">Sign Up</span></div>
         
        </div>
      </div>
    </div>
  </div>   -->
</section>
</body>
</html>