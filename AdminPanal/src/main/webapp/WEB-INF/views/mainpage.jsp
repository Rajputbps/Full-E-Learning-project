<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp" %>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="resources/css/mainpage.css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script> 
 <link rel="stylesheet" type="text/css" href="resources/css/form.css">
 <script type="text/javascript" src="resources/javascript/script.js"></script>
 <script>
 function on() {
	  document.getElementById("overlay").style.display = "block";
	}

	function off() {
	  document.getElementById("overlay").style.display = "none";
	}
	
 $(document).ready(function() {
	$("#addCourse").click(function() {
		 location.href = "coursePage";
	});
	$("#addLessonCourse").click(function() {
		 location.href = "courseLessonPage";
	});
	$("#addQuiz").click(function() {
		 location.href = "quizPage";
	});
	
	/* ------------------------- User Profile  ----------------------- */
	
	 $('a[href="#readUserProfile"]').click(function() {  
		  $.get({
			  url:'getUserProfile',
			  data:'userIdData=' + $(this).attr("data-id"),
			  success:function(response){ 
				  $("#userName").empty();
				  $("#email").empty();
				  $("#phonenumber").empty();
				 $("#userName").append(response.f_name + " " +response.l_name);
				 $("#email").append(response.email);
				 $("#phonenumber").append(response.mobile_number);
				 on();
			  } 
		  });
		});   
	
});
 </script>
  
</head>
<!------ Include the above in your HEAD tag ---------->

<body>
<div class="container-fluid back">
<div class="meggae text-center">${messages}</div>
<div style="margin: 2% 4% 2% 4%;">
<div class="row">
<div class="col-lg-4"> <button type="button" class="btn btn-primary btn-lg btn-block divCss" id="addCourse">Add Course</button> 
</div>
<div class="col-lg-4"> <button type="button" class="btn btn-primary btn-lg btn-block divCss" id="addLessonCourse">Add Course Lesson</button> </div>
<div class="col-lg-4"> <button type="button" class="btn btn-primary btn-lg btn-block divCss" id="addQuiz">Add Quiz</button> </div>
</div>
</div>

<div class="otheerAcc text-center"> <span>Other Activity</span> </div>
<div class="container-fluid">
 
<div>
<ul class="nav nav-tabs" role="tablist">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#home">Home</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#course1">Courses</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#user2">User</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#feedback2">Feedback</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content" style="background-color: #eeebeb;">
    <div id="home" class="container tab-pane active text-center" style="padding-top: 6%; padding-bottom: 6%;"><br>
      <h3>Hello Admin</h3>
      <p> Welcom :)</p>
    </div>
    <div id="course1" class="container tab-pane fade"><br>
      <h3 class="text-center">Courses List</h3>
      <hr>
        <table class="table table-striped table-dark">
  <thead>
    <tr>
      <th scope="col" class="text-center">Course Id</th>
      <th scope="col" class="text-center">Corse Name</th>
      <th scope="col" class="text-center">Lesson Name</th> 
    </tr>
  </thead> 
  <tbody>
  <c:forEach items="${courseList}" var="data">
    <tr>
      <th scope="row" class="text-center">${data.course_Id}</th>
      <td class="text-center">${data.course_Name}</td>
      <td>
      <ul style="list-style-type:none;">
      <c:forEach var="lessonName" items="${lessonName}" varStatus="number">
      <c:if test="${lessonName.course_id == data.course_Id}">
      <li style="text-transform: capitalize;"> ${lessonName.lesson_no}.  ${lessonName.lesson_name}</li>
      </c:if>
      </c:forEach>  
</ul>
      </td> 
    </tr>
  </c:forEach>
  </tbody>
</table>
    </div>
    <div id="user2" class="container tab-pane fade" style="width: 100%;"><br>
       <h3 class="text-center">User List</h3>
      <hr>
       <table class="table table-striped table-dark">
  <thead>
    <tr>
      <th scope="col" class="text-center">User Id</th>
      <th scope="col" class="text-center">Name</th>
      <th scope="col" class="text-center">More Detail</th>
      <th scope="col" class="text-center">Operation</th>
    </tr>
  </thead> 
  <tbody>
  <c:forEach items="${userData}" var="data">
    <tr>
      <th scope="row" class="text-center">${data.user_id}</th>
      <td class="text-center">${data.f_name} ${data.l_name}</td>
      <td class="text-center"><a href="#readUserProfile" data-id="${data.user_id}" class="btn"><i class="fa fa-info-circle" style="color: #fff;"></i></a></td>
      <td class="text-center"><a href="#" class="btn"><i class="fa fa-trash" style="color: #fff;"></i></a></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
    </div>
    <div id="feedback2" class="container tab-pane fade"><br>
       <h3 class="text-center">All Feedback</h3>
      <hr>
       <table class="table table-striped table-dark">
  <thead>
    <tr>
      <th scope="col" class="text-center">Feedback Id</th>
      <th scope="col" class="text-center">Sender Name</th>
       <th scope="col" class="text-center"> Message </th>
      <th scope="col" class="text-center">Sender Email</th>
      <th scope="col" class="text-center"> Phone Number </th>
      <th scope="col" class="text-center"> Date </th>
    </tr>
  </thead> 
  <tbody>
  <c:forEach items="${feedbacklist}" var="data">
    <tr>
      <th scope="row" class="text-center">${data.feedBack_Id}</th>
      <td class="text-center">${data.sender_name}</td> 
      <td class="text-center">${data.message}</td> 
      <td class="text-center">${data.sender_email}</td> 
      <td class="text-center">${data.mobile_number}</td> 
      <td class="text-center">${data.message_Date}</td> 
    </tr>
  </c:forEach>
  </tbody>
</table>
    </div> 
  </div>
</div>  
</div>

</div>
 <div id="overlay" onclick="off()">
  <div   class="userDetails">
   <h3 id="userName">Name: </h3>
  <h3 id="email">Email: </h3>
  <h3 id="phonenumber">Mobile number:  </h3>
  </div>
<!--   <div id="email" class="userDetails"></div><br>
  <div id="phonenumber" class="userDetails"></div> -->
</div>
</body>
</html>