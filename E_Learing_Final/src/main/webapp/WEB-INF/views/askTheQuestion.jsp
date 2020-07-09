<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link  rel="stylesheet" type="text/css" href="resources/css/askTheQuestion.css">
<script>
$(document).ready(function() {
	$('#userQuestion').click(function() { 
		$.post({
			url:'submitAskedQuestion',
			data: $('form[name=userDoubtsQuestion]').serialize(),
			success:function(response){  
                 $("#messageBox").empty(); 
                 $("#messageBox").append("<br>"+response+"<br><br>"); 
                 setTimeout(function() {
                	 location.href ="askindex";
            		  }, 2000);
			},
			 error:function(msg){
				 $("#messageBox").empty(); 
                 $("#messageBox").append("<br>"+msg+"<br><br>"); 
			 }
		});
	});  
}); 
</script>
</head>
<body style="padding-top: 5%;"> 
 
 <div class=" container-fluid">
 <div class="headerAsk"> 
 <h3 class="text-center headerText">Ask A Question</h3>
 </div> 
 <div  id="messageBox" class="text-center meggae"></div>
 <div class="row">
 <div class="col-lg-5 col-md-5">
 <div>
 <img alt="" src="resources/images/askAquestion.jpeg" class="img-thumbnail aboutImage">
 </div>
 </div>  
 <div class="col-lg-7 col-md-7">
   <form:form  name="userDoubtsQuestion"  method="post" modelAttribute="doubtsQuestion" >
   <form:hidden path="user_id" value="${userDetails.user_id}"/>
   <div class="form-group">
              <label for="course_id" class="sr-only">Select Course Name: </label>
               <form:select path="course_id" id="course_id" class="selecterofCourseAndLession">
               <option selected="selected">Select Course Name</option>
               <c:forEach var="courseName" items="${courseName}">
               <form:option value="${courseName.course_Id}">${courseName.course_Name}</form:option>
               </c:forEach>
               </form:select> 
            </div>  
             <div class="form-group">
              <label for="doubtsQuestion" class="sr-only">Your Question: </label>
               <form:input path="doubtsQuestion" id="doubtsQuestion" placeholder="Question" type="text"   class="selecterofCourseAndLession"  /> 
            </div>  
            <div class="form-group ">
              <label for="doubtsQuestion" class="sr-only">Description: </label>
               <form:textarea path="description" id="doubtsQuestion" placeholder="Description" class="descriptionField"/> 
            </div>  
             <div class="form-group text-center">
        <button type="button" class="btn btn-primary btn-lg btn-block" id="userQuestion">Submit</button>
        </div> 
 </form:form>   
 
 </div> 
 </div>
 </div>
    <%@include file="footer.jsp"%>
</body>
</html>