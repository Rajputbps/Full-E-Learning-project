<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  rel="stylesheet" type="text/css" href="resources/css/questionDescription.css"> 

<script>
$(document).ready(function() {
	$('#youeFormAnswer').click(function() { 
		if(sessionStorage.getItem("userName")!=null){
			$.post({
				url:'postedAnswer',
				data: $('form[name=youeAnswer]').serialize(),
				success:function(response){  
	                 $("#messageBox").empty(); 
	                 $("#messageBox").append("<br>"+response+"<br><br>"); 
	                 setTimeout(function() {
	                	 location.reload(true);
	            		  }, 1000);
				},
				 error:function(msg){
					 $("#messageBox").empty(); 
	                 $("#messageBox").append("<br>"+msg+"<br><br>"); 
				 }
			});	
		}else {
			$('#loginModalCenter').modal('show');
		}
	});  
	
	$("#askTheQuestion").click(function() {
		if(sessionStorage.getItem("userName")!=null){
			location.href ="askTheQuestion";	
		}else {
			$('#loginModalCenter').modal('show');
		}
	});
}); 
</script>

</head>
<body style="padding-top: 5%;">
<div class="container-fluid">
<section>
<div class="row">
<!-- Left panal -->
<div class="col-lg-2 col-md-2">
<ul class="list-group list-group-flush">
  <li class="list-group-item text-center">Home</li>
  <li class="list-group-item list-group-item-dark" style="height: 30px; padding-top: 0.25rem;">Public</li>
  <li class="list-group-item"><a class="nav-link active" data-toggle="pill" href="#home">All</a></li>
  <li class="list-group-item"><a class="nav-link " data-toggle="pill" href="#category">Category</a></li> 
  <li class="list-group-item"><a class="nav-link " data-toggle="pill" href="#user">User</a></li>  
</ul> 
</div>

<div class="col-lg-10 col-md-10 border-left">
<div class="row" style="margin-top: 3%;">
<div class="col-lg-9 col-md-9"><h4 style="padding-left: 3%;">${question.doubtsQuestion}</h4></div>
<div class="col-lg-3 col-md-3"><a type="button" href="#" id="askTheQuestion" class="btn btn-outline-primary">Ask Question</a></div>
</div>
<hr>








<div class="tab-content">
<!-- Tab 1 -->
 <div id="home" class="container-fluid tab-pane active">
<div class="container-fluid">
<div>
<p>${question.description}</p>
<div class="row">
<div class="col"><a href="${userProfile.user_id}" class="">${userProfile.f_name} ${userProfile.l_name}</a></div>
<div class="col"><p class="text-right">Asked: ${question.localDate}</p></div>
</div>
</div> 
<hr> 
<div>
<h4>${allAnswer} Answers</h4>
<div>
<ul class="list-group list-group-flush">
<c:forEach items="${givenAnswers}" var="answerg" varStatus="number">
 <li class="list-group-item">
  	<p> ${answerg.answer}</p>
		<div class="row">
		<div class="col"><a href="${answerg.user_id}" class="">${answerg.user_name}</a></div>
		<div class="col"><p class="text-right">Replyed: ${answerg.localDate}</p></div>
	</div>
  </li>  
</c:forEach>
</ul> 
</div>
</div>
<hr>
<div>
<h4>Your Answer</h4>
 <div  id="messageBox" class="text-center meggae"></div>
  <form:form  name="youeAnswer"  method="POST" modelAttribute="youeAnswer" >
   <form:hidden path="user_id" value="${userDetails.user_id}"/> 
   <form:hidden path="user_name" value="${userDetails.f_name} ${userDetails.l_name}"/> 
   <form:hidden path="user_doubt_question_id" value="${question.user_doubt_question_id}"/> 
            <div class="form-group ">
              <label for="doubtsQuestion" class="sr-only">Your Answer: </label>
               <form:textarea path="answer" placeholder="Your Answer" class="descriptionField"/> 
            </div>  
             <div class="form-group text-center"> 
            <button type="button" class="btn btn-primary btn-lg btn-block" id="youeFormAnswer">Post Your Answer</button>
            </div> 
 </form:form>    
</div> 
</div>
 </div>

<!-- TAb 2 -->
<div id="category" class="container tab-pane fade"> 
<section>
<div class="row">
<c:forEach var="cName" items="${courseName}">
<div class="col-md-3 col-lg-3" style="margin-top: 1%;">
<a href="getSelectedCourse${cName.course_Id}">
<div class="userList"> 
<div class="row">
<div class="col-md-5"> <img alt="no Image" src="resources/courseImages/${cName.course_image}" class="imagesAll"> </div>
<div class="col-md-7">${cName.course_Name}</div>
</div>
</div>
</a>
</div>
</c:forEach>
</div>
</section>
</div>
<!-- Tab3 -->

<div id="user" class="container tab-pane fade"><br>
<section>
<div class="row">
<c:forEach var="userName" items="${allUser}">
<div class="col-md-3 col-lg-3" style="margin-top: 1%;">
<div class="userList">
${userName.f_name} ${userName.l_name}
</div>
</div>
</c:forEach>
</div>
</section>
</div>
</div>

















</div>
</div>
</section>
</div>

 <div id="overlay" class="message" onclick="off()">
  <div class="userDetails">
   <h3 id="userName">Name: </h3>
  </div> 
</div>
   <%@include file="footer.jsp"%>
</body>
</html>