<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta  charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="resources/css/form.css">
 <script type="text/javascript" src="resources/javascript/script.js"></script>
  <link rel="stylesheet" type="text/css" href="resources/css/mainpage.css">
 <link rel="stylesheet" type="text/css" href="resources/css/mainpage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script> 

   <script>
  $(document).ready(function() {
	 $('#selectedCourseName').on('change', function() {  
		  $.get({
			  url:'getLessions',
			  data:'course_id='+this.value,
			  success:function(response){
				    var items = "";
                  $("#qlesson_no").empty(); 
				  $.each(response, function(i, item) {
                      $("#qlesson_no").append("<option value='" + item
                          .lesson_id + "'>" + item.lesson_name +
                          "</option>");
                  });	 
			  } 
		  });
		});   
	 
  }); 
 </script>
</head>
<body>
<div class="container-fluid">
<div class="meggae text-center">${messages}</div>
<div class="w3-container"> 
  

   <div class="w3-teal" style="text-align: center;">
    <br>
    <h1><strong>Add Quiz</strong></h1>
    <br><br>
   </div>

   
    <br>
       <section class="footer-form padding-top-xl padding-bottom-xl" aria-label="Contact Form">
  <div class="wrapper">
    <div class="container-fluid">          
      <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1"> 
          <form:form action="addQuiz"  method="post" modelAttribute="quizQuestion" role="form" data-toggle="validator" novalidate="true">
          <div class="form schedule-assessment">
            <div class="row margin-top-l">
            <div class="form-group col-md-4 col-sm-12">
              <label for="lcourse_Name" class="sr-only">Quiz Number: </label>
              <form:input path="quiz_number" id="lcourse_Name"  placeholder="Quiz Number" value="" required="required" data-error="*Please enter Quiz Number"/>
              <div class="help-block with-errors"></div>
            </div><!-- close col-->  
            <div class="form-group col-md-4 col-sm-12">
              <label for="courseName" class="sr-only">Course Name: </label>
               <select class="form-control selecterofCourseAndLession" id="selectedCourseName">
               <option selected="selected">Select Course Name</option>
               <c:forEach var="course" items="${courseName}">
               <option value="${course.course_Id}">${course.course_Name}</option>
               </c:forEach> 
    			</select>
              <div class="help-block with-errors"></div>
            </div>
              <div class="form-group col-md-4 col-sm-12">
              <label for="qlesson_no" class="sr-only">Lesson Name: </label> 
    			<form:select path="lesson_Id" class="form-control selecterofCourseAndLession" id="qlesson_no">
               		<option selected="selected" >Select Lesson Name</option>  
               	</form:select>
              <div class="help-block with-errors"></div>
            </div><!-- close col-->  
            </div><!-- close row-->

            <div class="row">
            <div class="form-group col-md-12 col-sm-12">
              <label for="lesson_name" class="sr-only">Question: </label>
             <form:textarea path="question"  id="lesson_name" placeholder="Question" type="text" value="" required="required" data-error="*Please enter Question"/>
              <div class="help-block with-errors"></div>
            </div> 
            </div><!-- close row-->
            <div class="row">
              <div class="form-group col-md-6 col-sm-12">
                <label for="answer_1" class="sr-only">Option 1: </label>
                <form:input path="answer_1"  id="answer_1" placeholder="Option 1" type="text" value="" required="required" data-error="*Please enter Option 1"/>
                <div class="help-block with-errors"></div>
              </div> 
              <div class="form-group col-md-6 col-sm-12">
                <label for="answer_2" class="sr-only">Option 2: </label>
                <form:input path="answer_2"  id="answer_2" placeholder="Option 2" type="text" value="" required="required" data-error="*Please enter Option 2"/>
                <div class="help-block with-errors"></div>
              </div> 
              </div><!-- close row-->
                <div class="row">
              <div class="form-group col-md-6 col-sm-12">
                <label for="answer_3" class="sr-only">Option 3: </label>
                <form:input path="answer_3"  id="answer_3" placeholder="Option 3" type="text" value="" required="required" data-error="*Please enter Option 3"/>
                <div class="help-block with-errors"></div>
              </div> 
              <div class="form-group col-md-6 col-sm-12">
                <label for="answer_4" class="sr-only">Option 4: </label>
                <form:input path="answer_4"  id="answer_4" placeholder="Option 4" type="text" value="" required="required" data-error="*Please enter Option 4"/>
                <div class="help-block with-errors"></div>
              </div> 
              </div><!-- close row-->
              <div class="row">
            <div class="form-group col-md-12 col-sm-12">
              <label for="right_answer" class="sr-only">Answer: </label>
              <form:input path="right_answer"  id="right_answer" placeholder="Right Answer" type="text" value="" required="required" data-error="*Please enter Right Answer"/>
              <div class="help-block with-errors"></div>
            </div> 
            </div><!-- close row-->
            <div class="form-group text-center">
            <input class="submit center-block btn btn-primary" value="Add Quiz" type="submit">
            </div>
          </div>
          </form:form>
        </div>
      </div> 
    </div>
  </div>
</section>  
    
</div>
</div>
</body>
</html>