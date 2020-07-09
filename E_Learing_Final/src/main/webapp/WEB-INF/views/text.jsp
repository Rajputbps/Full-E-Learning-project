         
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BORAJI.COM</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
  span.error{
    color: red;
    margin-left: 5px;
  }
  .table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <!-- <script type="text/javascript">
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
        	 console.log("SUCCESS: ", $('input[name=email]').val());
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
</script>   -->
<script>
$(document).ready(function() {
	 $('a[href="#readNote"]').click(function() {   
		   $.get({
			   url:'read', 
			   data: 'noteIdData=' + $(this).attr("data-id"),
			   success:function(response) {    
				    var items = "";
	                  $("#noteContentTextArea").empty();  
					    $.each(response, function(i, item) { 
	                      $("#noteContentTextArea").append(item); 
	                  }); 
			   },
			      error:function(msg){
			    	  alert(msg);
			    	  //$("#error").append("<div><u>Message</u>:<br /><br />" +  msg + "</div>");
			      }
		   });
	});
	 
	 
	 
	 
	 
	 $('a[href="#readNoteA"]').click(function() {   
		   $.get({
			   url:'reada', 
			   data: 'noteIdData=' + $(this).attr("data-id"),
			   success:function(response) {    
				    var items = "";
	                  $("#noteContentTextArea").empty();  
					    $.each(response, function(i, item) { 
	                      $("#noteContentTextArea").append(item); 
	                  }); 
			   },
			      error:function(msg){
			    	  alert(msg);
			    	  //$("#error").append("<div><u>Message</u>:<br /><br />" +  msg + "</div>");
			      }
		   });
	});
	  
	 /* --------------------------- Login ----------------------------- */   
	   $('#testloginForm').submit(function() {  
	      $.post({ 
	    	  contentType : 'application/json; charset=utf-8',
	         url : 'perform_login',     
	         dataType : 'json',
	         data : $('form[name=testloginFormData]').serialize(),  
	         success : function(response) {
	        	 window.location.reload(); 
	        	 if(response == "s"){ 
	        		 sessionStorage.setItem("userName", $('input[name=lemail]').val());  
	              
	              }else if(response == "f"){  
	            	 	alert("Email or Password is Wrong!!!");
	            	 	$('#loginModalCenter').modal('show'); 
	              }   
	         },
	      error:function(msg){
	    	  console.log("---------"+msg)
	    	  alert("------>"+msg); 
	      }
	      }); 
	   });
});  
</script> 
</head>
<body>
<form action="https://www.jdoodle.com/api/redirect-to-post/online-java-compiler" method="post">
  Script: <textarea name="initScript" rows="8" cols="80"></textarea>
  <input type="submit" value="Submit">
</form>
  <h1>Employee Input Form</h1>
  <hr />
<a href="#readNote">read</a>
<a href="#readNoteA">readA</a>
		<section class="footer-form padding-top-xl padding-bottom-xl" aria-label="Contact Form">
		  <div class="wrapper">
			<div class="container">            
			  <div class="row d-flex justify-content-center">
				<div class="col-lg-8 col-lg-offset-2 col-md-12 col-md-offset-1">
				<div class="text-center"><span class="registrationHeader" id="error"></span></div>
				  <div class="text-center" style="padding:140px 10px 30px 10px"><span class="registrationHeader">Log In</span></div>
				  <form  method="post" id="testloginForm"   name="testloginFormData" role="form" data-toggle="validator">
				  <div class="form schedule-assessment">
					<div class="row"> 
					<div class="form-group col-md-12">
					  <label for="email" class="sr-only">Email Address: </label>
					  <input name="lemail" id="email" placeholder="Enter Email" type="email" data-error="*Please enter a valid email." required>
					  <div class="help-block with-errors"></div>
					</div>
					<div class="form-group col-md-12">
						<label for="password" class="sr-only">Password: </label>
						<input name="lpassword" id="password" placeholder="Enter Password" type="password"   data-error="*Please enter password." required>
						<div class="help-block with-errors"></div>
					  </div>
					</div><!-- close row-->
					  
					<div class="form-group text-center"> 
					<input class="submit center-block btn btn-lg btn-primary" value="Login" type="submit">
					</div>

				  </div> 
				  </form>
				  <hr style=" border-top: 1px solid black;">
				  <div class="row">
					<div class="  col-md-12" style="text-align: center;"> 
					 <span style="color: #ffffff; font-weight: bold; font-size: 19px;"> Don't have an account ? <b><a href="#" id="show"> Sign Up</a></b></span> 
					
					</div>
					</div><!-- close row-->
				</div>
			  </div>
			</div>
		  </div>
		</section>
<div id="noteContentTextArea"></div>
  <%-- <form action="saveEmployee" method="post" name="employeeForm">
    <table>
      <tr>
        <td>First Name</td>
        <td><input  name="email" id="email" placeholder="Enter Email" type="email" /></td>
      </tr>
      <tr>
        <td>Last Name</td>
        <td><input name="password" id="password" placeholder="Enter Password" type="password" /></td>
      </tr>
      <!-- <tr>
        <td>Email</td>
        <td><input name="email" type="text" /></td>
      </tr>
      <tr>
        <td>Designation</td>
        <td><input name="designation" type="text" /></td>
      </tr> -->
      <tr>
        <td></td>
        <td><button type="submit">Submit</button></td>
      </tr>
    </table>
  </form>

<!-- Result Container  -->
<div id="resultContainer" style="display: none;">
 <hr/>
 <h4 style="color: green;">JSON Response From Server</h4>
  <pre style="color: green;">
    <code></code>
   </pre>
</div>


 <c:if test="${userDetails.email == null}">
      <li class="nav-item">
        <a class="nav-link" href="loginUser">Login</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">/</a>
      </li>
      <li class="nav-item"> 
        <a class="nav-link" href="signup1.html">Sign Up</a>
      </li>
      </c:if>
      <c:if test="${userDetails.email != null}">
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ${userDetails.f_name}
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="#">Notes</a>
          <a class="dropdown-item" href="profile">Profile</a>
          <div class="dropdown-divider" style="color: blue;"></div>
          <a class="dropdown-item" href="perform_logout"><b class="text-danger">Logout</b></a> 
          <input type="hidden" value="${userDetails.f_name}" id="user_id">
        </div>
      </li>
      </c:if> 
   <c:if test="${readNote!=null}"> 
  <div>
 <textarea cols="" rows="10" class="writtenArea" spellcheck="true" name="file">
 <c:forEach items="${readNote}" var="ii">
 <c:out value="${ii}"></c:out>
 </c:forEach>
 </textarea> 
 </div> 
  </c:if> --%>
<!--   
  <p><iframe src="https://www.jdoodle.com/c-online-compiler/" width=100%; height=400  ></iframe></p> -->
  
  <%-- <% 
  
  try { 
		  
		 BufferedReader in = new BufferedReader(new FileReader("/home/rajput/College_Project/E_Learing_Final/src/main/webapp/resources/courses/C/DataTypes,Variables & Constants"));
 
		String str = null;
		 
		while((str = in.readLine()) != null){
		     out.print(str); 
		}
		 
	} catch (Exception e) {
		System.out.println(e);
	}
  
  %> --%>
  
  
</body>
</html>