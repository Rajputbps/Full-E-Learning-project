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
  <div class="w3-container">
    <div class="w3-teal" style="text-align: center;">
    <br>
    <h1><strong>Add Course</strong></h1>
    <br><br>
    </div>
    <br>
   <section class="footer-form padding-top-xl padding-bottom-xl" aria-label="Contact Form">
  <div class="wrapper">
    <div class="container-fluid">          
      <div class="row">
        <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1"> 
          <form:form  action="addCourse" enctype="multipart/form-data" method="post" modelAttribute="course" role="form" data-toggle="validator" novalidate="true">
          <div class="form schedule-assessment">
            <div class="row margin-top-l">
            <div class="form-group col-md-6 col-sm-12">
              <label for="course_Name" class="sr-only">Course Name: </label>
              <form:input path="course_Name"  id="course_Name" placeholder="course_Name" type="text" value="" required="required" data-error="*Please enter Course Name"/>
              <div class="help-block with-errors"></div>
            </div><!-- close col-->  
              <div class="form-group col-md-6 col-sm-12">
                <label for="books_and_references" class="sr-only">Books And References: </label>
                <form:input path="books_and_references"  id="books_and_references" placeholder="Books And References" type="text" value="" required="required" data-error="*Please enter Books And References"/>
                <div class="help-block with-errors"></div>
              </div>
            </div><!-- close row-->
            <div class="row"> 
            
            <div class="form-group col-md-12 col-sm-12">
              <label for="course_description" class="sr-only">Course description: </label>
              <form:textarea path="course_description"  id="course_description" placeholder="Course Description" type="text" value="" required="required" data-error="*Please enter Course Description"/>
              <div class="help-block with-errors"></div>
            </div>
             <!-- close col--> 
            
              </div><!-- close row-->
              <div class="row">
                <div class="form-group col-md-6 col-sm-12">
                  <label for="course_image" class="sr-only">Course Image: </label>
                  <form:input path="image"  id="course_image" placeholder="Course Image" onchange="readURL(this);" type="file" value="" required="required" data-error="*Select Course Image."/>
                  <div class="help-block with-errors"></div>
                </div>
                <div class="form-group col-md-6 col-sm-12">
                <img id="blah" src="" alt="No image select" class="selectedImage img-thumbnail"/>
                  <div></div>
                </div>
                </div><!-- close row--> 
            <div class="form-group text-center">
            <input class="submit center-block btn btn-primary" value="Add Course" type="submit">
            </div>
          </div>
          </form:form> 
        </div>
      </div>
    </div>
  </div>
</section>  
</div>
</body>
</html>