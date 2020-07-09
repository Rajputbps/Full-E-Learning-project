<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp"%>
<!DOCTYPE html> 
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/openBook.css">
<link rel="stylesheet" type="text/css" href="resources/css/quiz.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/file.css">  

<script type="text/javascript">
$(document).ready(function() { 
	var question ='${quizQuestion}';

	if(screen.width>768){
		$("#openButton").hide();
	}
	
	$("#getQuizList").click(function() {
		$("#lessonListofQuiz").show(1000);
		 $("#questionSection").removeClass('col-md-12').addClass('col-md-9 ');
	});
	
	if ( screen.width < 768 ) {   
		if(question != null){
			setTimeout(function() {
				 $("#lessonListofQuiz").hide(1000);
				 $("#questionSection").removeClass('col-md-9 col-lg-9 col-xl-9').addClass('col-md-12 col-lg-9 col-xl-9 ');
				 $("#question").removeClass('h5').addClass('h3');
				  }, 2000);	
		}
	}  

	});
</script>

</head>
<body style="padding-top: 5%; margin-bottom: 20%;">
  
<div class="container-fluid"> 
 <div class="quizeHeader">
      <h3 class="text-center">Programming in ${courseContent.course_Name}</h3>
 </div>
  <div class="row">
    <div class="col-md-3 col-lg-3 col-xl-3" id="lessonListofQuiz">  
      <div> 
      <div style="padding-top: 2px;">     
      <ul class="list-group">
      	<li class="list-group-item" style="background-color: #d3d3d3;"><div> <h4>Course Layout</h4> </div> </li>
      	<c:forEach var="lessionC" items="${courseLession}" varStatus="number">
      	<c:choose>
    <c:when test="${lessionC.lesson_id == 1}">
    <li class="list-group-item lessionList"> <div class="lessionList row"> <div class="col"><a href="readLessonContent${lessionC.lesson_id}" style="color: #fff;"> >> ${lessionC.lesson_name}</a> </div><div class="col"><i class="fa fa-hand-o-right float-right" aria-hidden="true"></i></div>
    <div class="col-md-12 col-lg-12 col-xl-12"><a href="selectedquiz${lessionC.lesson_id}" style="color: #fff;"> >> Quiz ${number.count}</a></div>
     </div> </li>
    </c:when>    
    <c:otherwise>
     	<li class="list-group-item">
     	<a href="readLessonContent${lessionC.lesson_id}">>> ${lessionC.lesson_name} </a><br>
     	<a href="selectedquiz${lessionC.lesson_id}"> >> Quiz ${number.count}</a>
     	 </li>
    </c:otherwise>
</c:choose>
      	</c:forEach>  
	 </ul>
      </div>
      </div>
    </div> 
    <div class="col-md-9 col-lg-9 col-xl-9" id="questionSection"> 
      <div class="quizright">
      <div style="margin-bottom: 3%; background-color: #d3d3d3;">  
      <div class="row">
       <div class="col"> <h4 >Quize 1: ${lessionName.lesson_name}</h4> </div>
      <div class="col text-right" id="openButton"> <h4><span id="getQuizList">&#9776; open</span></h4> </div> 
      </div>
      </div> 
      
      <c:choose>
  		<c:when test="${quizQuestion == null}">
  		<div class=" text-center ifNotSelected "><h3>Please Select the Quiz....</h3><i class="fa fa-hand-pointer-o" aria-hidden="true" style="font-size: 30px;"></i></div>
  		</c:when>
  		<c:when test="${quizQuestion != null}">
  		<div style="margin-bottom: 2%; padding-left: 5px;"> 
  		
  		<c:choose>
  		<c:when test="${ifQuizAllReadyGiven != null}">
  		<div class=" text-center ifNotSelected "><h3>${ifQuizAllReadyGiven}</h3></div>
  		</c:when>
  		<c:otherwise>
  		 <form:form modelAttribute="quiz" action="submitQuiz">
  		 <div class="form-group">
     	 <input  name="user_Id" value="${userDetails.user_id}" type="hidden"/>
     	 <input name="lesson_name" value="${lessionName.lesson_name}" type="hidden"/> 
       <form:input path="quiz_number" value="${quizNumber}" type="hidden"/>
        <form:input path="lesson_Id" value="${lessionName.lesson_id}" type="hidden"/> 
        <input type="hidden" name="course_id" value="${courseContent.course_Id}">
      </div> 
      <c:forEach  var="questionAnswer" items="${quizQuestion}" varStatus="questionNumber">
       <p class="h5" id="question">Q ${questionNumber.count}: ${questionAnswer.question} </p>      
      <div class="form-group">
      <input type="radio" value="${questionAnswer.answer_1}" name="${questionAnswer.question_id}"/>${questionAnswer.answer_1}
      </div>
      <div class="form-group">
      <input type="radio" value="${questionAnswer.answer_2}"  name="${questionAnswer.question_id}"/>${questionAnswer.answer_2}
      </div>
      <div class="form-group">
      <input type="radio" value="${questionAnswer.answer_3}"  name="${questionAnswer.question_id}" />${questionAnswer.answer_3}
      </div>
      <div class="form-group">
      <input type="radio" value="${questionAnswer.answer_4}"   name="${questionAnswer.question_id}"/>${questionAnswer.answer_4}
      </div>
      </c:forEach> 
      <hr>
     <div class="form-group text-center"> 
		<input class="submit center-block btn  btn-primary" value="Submit" type="submit" style="width: 40%; height: 40px;">
	</div>
      </form:form> 
  		</c:otherwise>
  		</c:choose>
      </div> 
  		</c:when> 
		</c:choose>
      </div>
    </div>
  </div>
</div>
   <%@include file="footer.jsp"%>
</body>
</html>