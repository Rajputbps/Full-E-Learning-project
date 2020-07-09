<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="resources/css/mainpage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script> 
 <link rel="stylesheet" type="text/css" href="resources/css/form.css">
 <script type="text/javascript" src="resources/javascript/script.js"></script>
</head>
<body>
<div class="container-fluid">
<div class="w3-container">

   <div class="w3-teal" style="text-align: center;">
    <br>
    <h1><strong>Add Lesson</strong></h1>
    <br><br>
   </div>
   <br>
        <section class="footer-form padding-top-xl padding-bottom-xl" aria-label="Contact Form">
  <div class="wrapper">
    <div class="container-fluid">          
      <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1"> 
          <form:form  action="addCourseLession" enctype="multipart/form-data" method="post" modelAttribute="courseLesson" role="form" data-toggle="validator" novalidate="true">
          <div class="form schedule-assessment">
            <div class="row margin-top-l">
            <div class="form-group col-md-6 col-sm-12">
              <label for="lcourse_Name" class="sr-only">Course Name: </label>
              
               <form:select path="course_id" class="form-control selecterofCourseAndLession" id="lcourse_Name" required="required" data-error="*Please enter Course Name">
               <option selected="selected">Select Course Name</option>
               <c:forEach var="course" items="${courseList}">
               <form:option value="${course.course_Id}">${course.course_Name}</form:option>
               </c:forEach> 
    			</form:select> 
              <div class="help-block with-errors"></div>
            </div><!-- close col-->  
            <div class="form-group col-md-6 col-sm-12">
              <label for="lesson_no" class="sr-only">Lesson No: </label>
              <form:input path="lesson_no"  id="lesson_no" placeholder="Lesson No" type="number" value="" required="required" data-error="*Please enter Course Link"/>
              <div class="help-block with-errors"></div>
            </div><!-- close col-->  
            </div><!-- close row-->

            <div class="row">
            <div class="form-group col-md-12 col-sm-12">
              <label for="lesson_name" class="sr-only">Lesson Title: </label>
              <form:input path="lesson_name"  id="lesson_name" placeholder="Lesson Title" type="text" value="" required="required" data-error="*Please enter Course Description"/>
              <div class="help-block with-errors"></div>
            </div>
             <!-- close col-->
            </div><!-- close row-->
            <div class="row">
              <div class="form-group col-md-6 col-sm-12">
                <label for="youtube_link" class="sr-only">YouTube Link: </label>
                <form:input path="youtube_link"  id="youtube_link" placeholder="YouTube Link" type="text" value="" required="required" data-error="*Please enter Prerequisites"/>
                <div class="help-block with-errors"></div>
              </div> 
              <div class="form-group col-md-6 col-sm-12">
                  <label for="lesson_content" class="sr-only">Content of lesson: </label>
                  <input name="file"  id="lesson_content" placeholder="Content of lesson" type="file" value="" required="required" data-error="*Select Course Image."/>
                  <div class="help-block with-errors"></div>
                </div>
              </div><!-- close row-->
            <div class="form-group text-center">
            <input class="submit center-block btn btn-primary" value="Add Lesson" type="submit">
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