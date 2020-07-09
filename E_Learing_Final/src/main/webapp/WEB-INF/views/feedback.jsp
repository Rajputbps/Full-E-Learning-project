<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link rel="stylesheet" type="text/css" href="resources/css/home.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
$(document).ready(function() { 
	$('#feedbackForm').click(function() {
		//alert("submit");
		$.post({
			url:'giveFeedback',
			data: $('form[name=fffform]').serialize(),
			success:function(response){ 
                 $("#messageBox").empty(); 
                 $("#messageBox").append("<br>"+response+"<br><br>"); 
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
</head>  
<body style="padding-top: 5%;"> 
 <section id="contact" >
 <div  id="messageBox" class="text-center meggae"></div>
  <div class="container text-center" style= "padding:50px;">
    <h1>Feedback</h1>
    <p>We would love to hear your thoughts, concerns or problems with with anything so we can improve!</p>
     <hr style=" border-top: 1px solid black;">
     <div style="padding-left: 6%;">
      <div class="row box"> 
      <div class="col-mod-6"> 
        <form:form class="contact-form"  name="fffform" modelAttribute="feedBack"> 
        <div class="row">
        <div class="col-lg-6">
        <div class ="form-group">
            <form:input path="sender_name" class="from-control feedbackcss" placeholder="Your Name"   required="required"  data-error="*Please enter your name."/>
          </div>
        </div> 
        <div class="col-lg-6">
        <div class ="form-group">
            <form:input path="mobile_number" class="from-control feedbackcss" placeholder="Mobile Number" type="tel"  required="required" data-error="*Please enter your phone number" />
              <div class="help-block with-errors"></div>
          </div>
        </div>
        <div class="col-lg-12"> 
        <div class ="form-group">
            <form:input path="sender_email" type ="email" class="from-control feedbackcss" placeholder="Email-id"  required="required" data-error="*Please enter a valid email."/>
             <div class="help-block with-errors"></div>
          </div>
        </div>
        <div class="col-lg-12">
          <div class ="form-group">
          <form:textarea path="message" class="from-control feedbackcss feedbackTextarea"  placeholder="Message"/> 
          </div>
        </div> 
        </div> 
        <div class="form-group">
        <button type="button" class="btn btn-primary btn-lg btn-block" id="feedbackForm">Submit</button>
        </div> 
        </form:form>
      </div>
     
    </div> 
     </div>
  </div>
</section>
   <%@include file="footer.jsp"%>
</body>
</html>