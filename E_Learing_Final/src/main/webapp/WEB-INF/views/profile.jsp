<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/profile.css">
<script type="text/javascript">

$(document).ready(function(){
	$("input#editableFeild").hide(); 
	$("#updateButton").hide();
	$("#edit").click(function() { 
		$("input#editableFeild").show(1000);
		$("#updateButton").show();
		$("#edit").hide();
		$("span").hide();
	});
	
	$("#updateButton").click(function() {
		$.post({
			url:'updateUser',
			data:$('form[name=updateForm]').serialize(),
			success:function(respose){
				$("#messagetext").empty(); 
				$("#messagetext").append(respose);
				messageOn();
				setTimeout(function() {
               	 location.reload(true);
           	}, 3000);
			}, 
			error:function(response){   
				
			}
		});
	});
});
</script>
</head>
<body style="padding-top: 5%;">
<!-- Page Content -->
<div id="profileMessage" onclick="messageOff()">
  <div id="messagetext"></div>
</div>

  <div class="w3-container">

   <div class="w3-teal profileHeading text-center">
    <br>
  <h1><strong>My Profile</strong></h1>
  <br><br>
  </div>
  <div class="container">
  <table class="table table-hover">
 <form:form method="post" modelAttribute="userDetails" name="updateForm">
 		<form:hidden path="user_id"/>
        <tr>
          <th align="left">&nbsp;&nbsp;&nbsp;Name</th>
          <td>
          <span id="assessment-score-Assignment 1">${userDetails.f_name} ${userDetails.l_name}</span>
          <div class="row">
          <div class="col"><form:input path="f_name" id="editableFeild" placeHolder="First Name"/> </div>
          <div class="col"><form:input path="l_name" id="editableFeild" placeHolder="Last Name"/></div>
          </div>
          </td>
        </tr>
        <tr>
          <th align="left">&nbsp;&nbsp;&nbsp;Email Id</th>
          <td>
          <span id="assessment-score-Assignment 2">${userDetails.email}</span>
          <form:input path="email" id="editableFeild" placeHolder="Email"/>
          </td>
        </tr>
        <tr>
          <th align="left">&nbsp;&nbsp;&nbsp;Mobile No.</th>
          <td> 
          <span id="assessment-score-Assignment 2">${userDetails.mobile_number}</span>
          <form:input path="mobile_number" id="editableFeild" placeHolder="Phone Number"/>
          </td>
        </tr>    
        <tr id="updateButton">
        <td colspan="2" class="text-center"><button type="button" class="btn btn-outline-primary" id="updateButton" style="width: 250px;">Save</button></td>
        </tr>
          </form:form>
 </table>
<hr style="margin: 1px 0; margin-bottom: 3%;"> 
<div style="margin-bottom: 10px;" class="text-center"> <button type="button" class="btn btn-outline-info" style="width: 250px;" id="edit">Edit</button></div>
<div  class="border border-primary rounded" style="margin-bottom: 1%;"><h3 style="padding-left: 2%;"><b>Courses:</b></h3></div>  
<c:forEach items="${courseName}" var="rcourse">
<c:forEach items="${givenQuizzes}" var="quizzes">
<c:if test="${rcourse.course_Id == quizzes.course_Id}">
<div class="collapsible">
<div class="row">
<div class="col">
<h3 style="padding: 0px 0px 0px 20px;">${rcourse.course_Name} </h3>
</div> 
</div> 
</div>
</c:if>
</c:forEach>
<div class="content">
  <table class="table table-striped">
  <thead>
    <tr>  
      <th scope="col" class="text-center"><h6><b>Quiz</b></h6></th>
      <th scope="col" class="text-center"><h6><b>Score</b></h6></th>
      <th scope="col" class="text-center"><h6><b>Lesson</b></h6></th>
       <th scope="col" class="text-center"><h6><b>Date</b></h6></th>
    </tr>
  </thead>
  <tbody>
  <c:forEach items="${givenQuizzes}" var="quizzes">
  <c:if test="${quizzes.course_Id == rcourse.course_Id}">
  <tr>  
      <td class="text-center">${quizzes.quiz_Name}</td> 
      <td class="text-center">${quizzes.quiz_Marks}%</td> 
      <td class="text-center">${quizzes.lesson_name}</td>
      <td class="text-center">${quizzes.quize_given_date}</td> 
    </tr>
  </c:if> 
  </c:forEach>
  </tbody>
</table>
</div>
</c:forEach>
</div>
</div> 
 
<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.maxHeight){
      content.style.maxHeight = null;
    } else {
      content.style.maxHeight = content.scrollHeight + "px";
    } 
  });
}
</script>
   <%@include file="footer.jsp"%>
</body>
</html>