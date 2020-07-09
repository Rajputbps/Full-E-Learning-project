<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title> 
		<link href="resources/css/bootstrap-form-validation.css" rel="stylesheet"> 
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
<script type="text/javascript">
$(function() {
   /*  Submit form using Ajax */
   $('button[type=submit]').click(function(e) {
   
      //Prevent default submission of form
      e.preventDefault();
      
      //Remove all errors
      $('input').next().remove();
      
      $.post({
         url : 'perform_login',
         data : $('form[name=employeeForm]').serialize(),
         success : function(data) {
        	 localStorage.setItem("userName", $('input[name=email]').val()); 
        	 window.location.reload(); 
            
            /*}else{
              //Set error messages
              $.each(res.errorMessages,function(key,value){
  	            $('input[name='+key+']').after('<span class="error">'+value+'</span>');
              });
            } */
         }
      })
   });
});
</script>
</head>
<body style="background-image: url(resources/images/laptop.png); background-repeat:no-repeat; background-size: cover;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;">
<div class="signin">
		<section class="footer-form padding-top-xl padding-bottom-xl" aria-label="Contact Form">
		  <div class="wrapper">
			<div class="container">          
			  <div class="row d-flex justify-content-center">
				<div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
			
				  <div class="text-center" style="padding:140px 10px 30px 10px"><span class="registrationHeader">Log In</span></div>
				  <form action="saveEmployee" method="post" name="employeeForm" role="form" data-toggle="validator">
				  <div class="form schedule-assessment">
					<div class="row">
					<div class="form-group col-md-12">
					  <label for="email" class="sr-only">Email Address: </label>
					  <input name="email" id="email" placeholder="Enter Email" type="email" value="" required="required" data-error="*Please enter a valid email.">
					  <div class="help-block with-errors"></div>
					</div>
					<div class="form-group col-md-12">
						<label for="password" class="sr-only">Password: </label>
						<input name="password" id="password" placeholder="Enter Password" type="password" value="" required="required" data-error="*Please enter password.">
						<div class="help-block with-errors"></div>
					  </div>
					</div><!-- close row-->
					  
					<div class="form-group text-center">
					<button class="btn btn-primary btn-lg btn-block" type="submit">Log In</button>
					</div>

				  </div>
				  </form>
				  <hr style=" border-top: 1px solid black;">
				  <div class="row">
					<div class="  col-md-12" style="text-align: center;">
					 <span style="color: #000000; font-weight: bold; font-size: 15px;">Don't have an account ? <a href="signUpUser">&nbsp;&nbsp;&nbsp;Sign Up</a></span> 
					
					</div>
					</div><!-- close row-->
				</div>
			  </div>
			</div>
		  </div>
		</section>
		
	</div>
</body>
</html>