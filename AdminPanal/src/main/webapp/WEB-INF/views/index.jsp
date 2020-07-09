 <%@ page isELIgnored="false" %>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap-form-validation.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/css/index.css"> 


<section class="footer-form padding-top-xl padding-bottom-xl" aria-label="Contact Form">
  <div class="wrapper">
    <div class="container">          
      <div class="row d-flex justify-content-center" style="padding-top: 10%;">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
    <h1 class="text-center" style="color: #ff0000; font-style: italic;"><b>${message}</b></h1>
          <div class="text-center" style="padding:40px 10px 30px 10px"><span class="registrationHeader">Login</span></div>
          <form name="contentForm"  method="post" action="perform_login" role="form" data-toggle="validator" novalidate="true">
          <div class="form schedule-assessment"> 
            <div class="row">
            <div class="form-group col-md-12">
              <label for="email" class="sr-only">Email Address: </label>
              <input name="email" id="email" placeholder="Email Address" type="email" value="" required="required" data-error="*Please enter a valid email.">
              <div class="help-block with-errors"></div>
            </div>
            <div class="form-group col-md-12">
                  <label for="password" class="sr-only">Password: </label>
                  <input name="password" id="password" placeholder="Password" type="password" value="" required="required" data-error="*Please enter password.">
                  <div class="help-block with-errors"></div>
                </div>
            </div><!-- close row-->
            
            <div class="form-group text-center">
            <input class="submit center-block btn btn-primary" value="Submit" type="submit">
            </div>
          </div>
</form>
        </div>
      </div> 
    </div>
  </div> 
</section>