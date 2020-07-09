<!DOCTYPE html>
        <%@ page isELIgnored="false" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>E-Learn</title>
<link rel="stylesheet" type="text/css" href="resources/css/new.css">
<link rel="stylesheet" type="text/css" href="resources/css/note.css">
<link rel="stylesheet" type="text/css" href="resources/css/bootstrap-form-validation.css"> 
<script type="text/javascript" src="resources/javaScript/formValidation.js"></script>
<script type="text/javascript" src="resources/javaScript/message.js"></script>
<script type="text/javascript" src="resources/javaScript/sideNav.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script> 

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<script type="text/javascript">
$(document).ready(function() {
	 /* Signin & SignUp */
	  
	  $('#show').click(function() {
	      $('#signIn').toggle("slide");
	       $('#signUp').toggle("slide");
	       
	    }); 
	 
	 /* ------------------------------------ NotePad --------------------------------------- */
	  $("#notePad").click(function(){
		  if(sessionStorage.getItem("userName")!=null){
			  $("#panel").slideToggle("slow");  
		  }
		  else {
			  $('#loginModalCenter').modal('show');
		}
		  });
	  $("#mnotePad").click(function(){
		  closeNav();
		    $("#panel").slideToggle("slow");
		  });
	  
	  $("#forgetPasswordOpen").click(function() {
		  $('#loginModalCenter').modal('hide');
		  $('#forgetPasswordD').modal('show');
	});
	  
	  if(screen.width>768){
			$("#openButton").hide();
		}
});
</script>
<script>
$(document).ready(function() { 
	
	var unsaved = false;
	var loginCheck= false;

	
	$('#noteContentTextArea').change(function(){ 
	    unsaved = true;
	});

	function unloadPage(){ 
	    if(unsaved){
	        return "You have unsaved changes on this page. Do you want to leave this page and discard your changes or stay on this page?";
	    }
	}

	window.onbeforeunload = unloadPage;
		
	
	
	/* --------------------------- Login ----------------------------- */ 
	   $('#loginForm').submit(function() {  
	      $.post({
	         url : 'perform_login',  
	         data : $('form[name=loginFormData]').serialize(),
	         success : function(response) {
	        	 window.location.reload(); 
	        		 loginCheck=true;
	        		 sessionStorage.setItem("userName", $('input[name=lemail]').val());  
	              
	              if(response == "f"){  
	            	 	alert("Email or Password is Wrong!!!");
	            	 	$('#loginModalCenter').modal('show');
	              }   
	         },
	      error:function(msg){
	    	  alert(msg); 
	      }
	      });
	      
	      if(loginCheck && sessionStorage.getItem("userName")==null){ 
				location.href ="perform_logout";
				$("#userName").empty(); 
	            $("#userName").append("<br> Login Faild!!!!!!!!!! <br><br>"); 
	            on();
			}
	   });
	   
	   /* --------------------------- Logout ----------------------------- */ 
	   $('a[href="#logout"]').click(function() { 
		   $.post({
			   url:'perform_logout',
			   success:function(data) { 
				   sessionStorage.removeItem("userName");
				   window.location.reload(); 
			   }
		   });
	});
	   
	  /* --------------------------- Signup ----------------------------- */ 
 	   
 	   $(document).ready(function() { 
			$('#userRegistrationForm').click(function() { 
				$.post({
					url:'registerUser',  
					data: $('form[name=contentForm]').serialize(),
					success:function(response){ 
						alert(response);
		                 $("#userName").empty(); 
		                 $("#userName").append("<br>"+response+"<br><br>"); 
		                 on();
		                 window.location.reload();
		                 setTimeout(function() {
		                	 location.reload(true);
		            	}, 3000);
					}
				});
			});  
		});  
	   
	   
	  /* -------------------------------- NotePad Save -----------------------------------  */
	  
 	  $('#notePadForm').submit(function() {   
 		 unsaved = false;
		   $.post({ 
			   url:'saveNote', 
			   data : $('form[name=contentForm]').serialize(),
			   success:function(data) {  
				   $("#userName").empty(); 
	                 $("#userName").append("<br> Note Saved!!!!!! <br><br>"); 
	                 on();  
	                 setTimeout(function() {
	                	 location.reload(true);
	            	}, 3000);
			   },
			      error:function(msg){
			    	  alert(msg); 
			      }
		   });
	}); 
	  
	  
	  /* -------------------------------- Read Note -----------------------------------  */
	  
 	  $('a[href="#readNote"]').click(function() {  
 		  $('#readNoteFileId').val($(this).attr("data-id"));
		   $.get({ 
			   url:'readNotes', 
			   data: 'noteIdData=' + $(this).attr("data-id"),  
			   success:function(response) {     
				    var items = "";
	                  $("#noteContentTextArea").empty();    
					    $.each(response, function(i, item) { 
					    	if(i==0){
					    		$('#readRoteFileName').val(item);
					    	}else { 
					    		$("#noteContentTextArea").append(item+"\n"); 	
							}
	                  }); 
			   },
			      error:function(msg){
			    	  alert(msg);
			    	  //$("#error").append("<div><u>Message</u>:<br /><br />" +  msg + "</div>");
			      }
		   })
	});
	  
	  /*------------------------------- Reset Password ---------------------------------  */
	  
	  $("#resetForm").submit(function() {
		$.post({
			url:'resetPassword',
			data:$('form[name=getResetMail]').serialize(),
			success:function(response){
				alert(response);
			}
		});	
	});
	  
	});
</script> 
</head>
<body> 
<!--NAVIGATIONBAR--->	
	<section id="nav-bar">
		<nav class="navbar navbar-expand-lg navbar-light fixed-top" style="background-color: lightgray">
  <a class="navbar-brand" href="home"><img src="resources/images/logo.png" style="width: 140px; padding-left: 15px; height: 40px"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" onclick="openNav()">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavDropdown"> 
    <ul class="navbar-nav ml-auto"> 
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Courses
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> 
         <c:forEach items="${courseName}" var="course">
         <a class="dropdown-item" href="courceDetail${course.course_Id}">
            ${course.course_Name}
          </a>
        </c:forEach> 
        </div>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="askindex">Doubts</a>
      </li>
      <li class="nav-item">
      	  <a class="nav-link" href="#" id="notePad"><img alt="" src="resources/images/notes.png" style="width: 40px; height: 30px;"> </a>
      </li> 
      <c:if test="${userDetails.email == null}">
      <li class="nav-item">
        <a class="nav-link" type="button" data-toggle="modal" data-target="#loginModalCenter">Login</a>
      </li> 
      </c:if>
      <c:if test="${userDetails.email != null}">
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          ${userDetails.f_name}
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"> 
          <a class="dropdown-item" href="profile">Profile</a>
          <div class="dropdown-divider" style="color: blue;"></div>
          <a class="dropdown-item" href="#logout"><b class="text-danger">Logout</b></a> 
        </div>
      </li>
      </c:if>
    </ul>
  </div>
  <div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  <div class="row" style="padding-left: 5%; padding-right: 5%;">
  <c:if test="${userDetails.email != null}">
   <div class="col">
     <div class="text-center"><a href="profile">Hello:)  ${userDetails.f_name} ${userDetails.l_name}</a></div>
   </div>
  </c:if>
  </div>
   <hr class="solid" style="border-color: #fff;">
  <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical"> 
  <a class="nav-link" data-toggle="collapse" href="#courseListC" role="button" aria-expanded="false" aria-controls="collapseExample">Courses</a>
  <div class="collapse" id="courseListC">
  <div class="card card-body">
     <c:forEach items="${courseName}" var="course">
         <a class="dropdown-item" href="courceDetail${course.course_Id}">
            ${course.course_Name}
          </a>
        </c:forEach> 
  </div>
</div>
  <a class="nav-link"    href="askindex" >Doubts</a> 
  <c:if test="${userDetails.email == null}"> 
  <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab">Note</a>
  </c:if>
   <c:if test="${userDetails.email != null}"> 
  <a class="nav-link" href="#" id="mnotePad">Note</a>
  </c:if>
   <c:if test="${userDetails.email == null}"> 
  <a class="nav-link btn btn-outline-primary" id="v-pills-settings-tab" data-toggle="modal" data-target="#loginModalCenter" role="tab" aria-controls="v-pills-settings" aria-selected="false">Login</a>
  </c:if> 
  <c:if test="${userDetails.email != null}"> 
  <a class="nav-link btn btn-outline-danger" style="margin-top: 50px;" data-toggle="pill" href="#logout" role="tab" aria-controls="v-pills-messages" aria-selected="false" ><b class="text-danger">Logout</b></a>
  </c:if> 
</div>
</div>
</nav>
</section>
 

<div class="modal fade" id="loginModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true" >
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content" style="background-image: url(resources/images/laptop.png); background-repeat:no-repeat; background-size: cover;-webkit-background-size: cover;
    -moz-background-size: cover;
    -o-background-size: cover;">
       <div class="modal-header"> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: white;">
          <span aria-hidden="true">&times;</span>
        </button>  
      </div>
      <div class="modal-body"> 
       <div class="signin" id="signIn">
		<section class="footer-form padding-top-xl padding-bottom-xl" aria-label="Contact Form">
		  <div class="wrapper">
			<div class="container">           
			  <div class="row d-flex justify-content-center">
				<div class="col-lg-8 col-lg-offset-2 col-md-12 col-md-offset-1">
				<div class="text-center"><span class="registrationHeader" id="error"></span></div>
				  <div class="text-center" style="padding:140px 10px 30px 10px"><span class="registrationHeader">Log In</span></div>
				  <form  method="post" id="loginForm"  action="perform_login"  name="loginFormData" role="form" data-toggle="validator">
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
					 <span style="font-weight: bold; font-size: 19px;"> <b><a  style="color: #ff0000; " href="#" id="forgetPasswordOpen"> ForgetPassword</a></b></span> 
					</div>
					</div><!-- close row-->
					 <div class="row">
					<div class="  col-md-12" style="text-align: center;"> 
					 <span style="color: #000000; font-weight: bold; font-size: 19px;"> Don't have an account ? <b><a href="#" id="show"> Sign Up</a></b></span> 
					</div>
					</div><!-- close row-->
				</div>
			  </div>
			</div>
		  </div>
		</section>
		
	</div>
	
	<!-- --------------------------------------------------- SignUp form -------------------------------------------------- -->
	
	 <div class="signin" id="signUp" style="display: none;">
		<section class="footer-form padding-top-xl padding-bottom-xl" aria-label="Contact Form">
		  <div class="wrapper">
		    <div class="container">          
      <div class="row d-flex justify-content-center">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
          <div class="text-center" style="padding:90px 10px 30px 10px"><span class="registrationHeader">Sign Up</span></div>
          <form:form name="contentForm" class="contact-form"  method="post"  role="form" data-toggle="validator"   modelAttribute="user" >
          <div class="form schedule-assessment">
            <div class="row margin-top-l"> 
            <div class="form-group col-md-6">
              <label for="first_name" class="sr-only">First Name: </label>
              <form:input path="f_name" name="first_name" id="ufirst_name" onkeyup="fisValid()" placeholder="First name" type="text" value="" required="required"  data-error="*Please enter your First name"/>
              <div class="help-block with-errors"><p id="fvalidateerror" style="color: rgb(255, 0, 0);"></p></div>
            </div><!-- close col-->  
            <div class="form-group col-md-6">
              <label for="last_name" class="sr-only">Last Name: </label>
              <form:input path="l_name" id="ulast_name" placeholder="Last name" type="text" value="" onkeyup="lisValid()" required="required" data-error="*Please enter your Last name."/>
              <div class="help-block with-errors"><p id="lvalidateerror" style="color: rgb(255, 0, 0);"></p></div>
            </div><!-- close col-->  
            </div><!-- close row-->

            <div class="row"> 
            <div class="form-group col-md-6">
              <label for="remail" class="sr-only">Email Address: </label>
              <form:input path="email" type ="email" class="from-control" id="uemail" onkeyup="emailValidate()" placeholder="Email Address"   required="required" data-error="*Please enter a valid email."/>
              <div class="help-block with-errors"><p id="evalidateerror" style="color: rgb(255, 0, 0);"></p></div>
            </div>
            <div class="form-group col-md-6">
              <label for="phone_number" class="sr-only">Phone Number: </label>
              <form:input path="mobile_number" class="from-control" type="tel" name="phone_number" value="xxxxxxxxxx" onkeyup="phoneValidate()" id="uphone_number" placeholder="Phone number"   required="required" data-error="*Please enter your phone number"/>
              <div class="help-block with-errors"><p id="pvalidateerror" style="color: rgb(255, 0, 0);"></p></div>
            </div><!-- close col--> 
            </div><!-- close row-->
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="rpassword" class="sr-only">Password: </label>
                  <form:input path="password" name="password" id="upassword" placeholder="Enter Password" type="password"  required="required" data-error="*Please enter password."/>
                  <div class="help-block with-errors"></div>
                </div>
                <div class="form-group col-md-6">
                  <label for="cpassword" class="sr-only">Confirm Password: </label>
                  <input name="cpassword" id="cpassword" placeholder="Enter Confirm Password" type="password"  required="required" onkeyup="matchPassword()" data-error="*Please enter confirm password.">
                  <div class="help-block with-errors"><p id="passworderror" style="color: rgb(255, 0, 0);"></p></div>
                </div>
                </div><!-- close row-->
            <div class="form-group text-center">
            <input class="submit center-block btn btn-primary" id="userRegistrationForm" value="Submit" type="submit">
            </div>
          </div>
          </form:form>
          <hr style=" border-top: 1px solid black;">
          <div class="row">
			<div class="  col-md-12" style="text-align: center;"> 
			  <span style="color: #000000; font-weight: bold; font-size: 19px;"> If you have an account ? <b><a href="#" id="show"> Login</a></b></span> 	
			</div>
		 </div>
        </div>
      </div>
    </div>
		  </div>
		</section>
		
	</div>
	
      </div>  
    </div>
  </div>
</div>

<!----------------------------------------------- NotePad ----------------------------------------------  -->

<div id="panel" style="display: none;">
<div class="card">
 <form:form   modelAttribute="notePad" id="notePadForm" name="contentForm">
 <form:input path="user_Id" type="hidden" value="${userDetails.user_id}"/>
  <div class="card-header">
   <div class="row">
   <div class="col-lg-5 col-sm-5"> 
   <form:input path="note_title" id="readRoteFileName"  placeholder="Enter title." style="width:100%;height:50px;"/> 
   </div>
   <div class="col-lg-7 col-sm-5 text-right">
<button type="submit" class="btn btn-outline-secondary" style="margin-top: 1.5%; width: 200px;">Save</button> </div>
   </div>
  </div>
  <div class="card-body"> 
 <div class="row">
 <div class="col-lg-3 col-md-3">
 <ul class="list-group">
      	<li class="list-group-item" style="background-color: #d3d3d3;"><div> <h4>Notes</h4> </div> </li>
      	 <c:forEach items="${notesList}" var="notes">
      	 <li class="list-group-item"><a href="#readNote" data-id="${notes.note_Id}"> <b>${notes.note_Id}.</b> ${notes.note_title}</a> 
      	 </li>
      	 </c:forEach> 
	 </ul>
 </div>
 <div class="col-lg-9 col-md-9"> 
 <c:out value="${readNote}"></c:out>
 <div class="paper">
  <div class="lines">
  <div class="row">
  <div class="col"> <div class="holes hole-top"></div> </div>
  <div class="col"> <div class="holes hole-middle"></div> </div>
  <div class="col"> <div class="holes hole-bottom"></div> </div>
    <div class="col"> <div class="holes hole-top"></div> </div>
  <div class="col"> <div class="holes hole-middle"></div> </div>
  <div class="col"> <div class="holes hole-bottom"></div> </div>
    <div class="col"> <div class="holes hole-top"></div> </div>
  <div class="col"> <div class="holes hole-middle"></div> </div>
  <div class="col"> <div class="holes hole-bottom"></div> </div> 
  </div>
  </div> 
  <div>
   <form:input path="note_Id" type="hidden" id="readNoteFileId"  value=""/>
 <textarea id="noteContentTextArea" cols="" rows="" class="writtenArea" spellcheck="true" name="file"> 
 </textarea> 
 </div>  
</div> 
 </div>
 </div>
  </div>
 </form:form>
</div>
</div>

<!-- ForgetPassword Part  -->

<div class="modal fade" id="forgetPasswordD"> 
  <div class="modal-dialog modal-dialog-centered" role="document">  
    <div class="modal-content" style="wi">
      <div class="modal-header"> 
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> 
          <span aria-hidden="true">&times;</span>
        </button> 
      </div> 
      <div class="modal-body text-center"> 
      <div>
      <span><i class="fas fa-lock" style="font-size: 150px;"></i></span>
      </div> 
      <div style="margin-top: 1%;"> <h4>Ooooo! You Forgot your password!!</h4>
      <p>Don't Worry you will get here :)</p></div>
         <form id="resetForm" name="getResetMail" role="form" data-toggle="validator"  style="padding: 3% 30% 5% 30%;">
         <div class="input-group mb-3">
  			<div class="input-group-prepend">
  			  <span class="input-group-text" id="basic-addon1">@</span>
  			</div>
  			<input name="resetemail" id="resetemail" placeholder="Enter Email" type="email" class="form-control"   aria-label="Username" aria-describedby="basic-addon1" required>
			</div> 
		<div class="form-group text-center"> 
			<input class="submit center-block btn btn-lg btn-primary" value="Send My Password" type="submit">
		</div>
         </form>
      </div> 
    </div>
  </div>
</div>

 <div id="overlay" onclick="off()">
  <div class="userDetails">
   <h3 id="userName"></h3>
  </div> 
</div>

</body>
</html>