<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link rel="stylesheet" type="text/css" href="resources/css/openBook.css">  
</head>
<body> 
  
<div class="container-fluid">
  <div class="row">
    <div class="col-md-3 col-lg-3 col-xl-3">  
      <div>
      <div> <h2 style="padding-top: 10px; padding-left: 8px;">${courseContent.course_Name} Tutorial</h2> </div>
      <br>
      <div style="padding-top: 8px;">    
      <ul class="list-group">
      	<li class="list-group-item" style="background-color: #d3d3d3;"><div> <h4>Course Layout</h4> </div> </li>
      	<c:forEach var="lessionC" items="${courseLession}" >
      	
      	<c:choose> 
      	<c:when test="${lessionC.lesson_id == 1}">
      	<li class="list-group-item"><a href="courceDetail${lessionC.course_id}">${lessionC.lesson_name} </a> </li>
      	</c:when>
    <c:when test="${lessionC.lesson_id == lessionName.lesson_id}">
    <li class="list-group-item lessionList"> <div class="lessionList row"> <div class="col-md-10 col-lg-10"><a href="readLessonContent${lessionC.lesson_id}" style="color: #fff;">${lessionC.lesson_name}</a> </div><div class="col-md-2 col-lg-2"><i class="fa fa-hand-o-right float-right" aria-hidden="true"></i></div> </div> </li>
    </c:when>    
    <c:otherwise>
     	<li class="list-group-item"><a href="readLessonContent${lessionC.lesson_id}">${lessionC.lesson_name} </a> </li>
    </c:otherwise>
</c:choose>
      	</c:forEach> 
      	     	<c:if test="${userDetails.email == null}">
      	<li class="list-group-item" data-toggle="tooltip" data-placement="top" title="Please Login....."><a>Quiz</a></li>
      	<li class="list-group-item" data-toggle="tooltip" data-placement="top" title="Please Login....."><a>Compiler</a></li>
      	</c:if>
      	<c:if test="${userDetails.email != null}">
      	<li class="list-group-item "><a href="quiz${courseContent.course_Id}">Quiz</a></li>
      	<c:choose>
      	<c:when test="${courseContent.course_Name == 'C'}">
      	<li class="list-group-item "><a href="https://www.jdoodle.com/c-online-compiler/" target="_blank">Compiler</a></li>
      	</c:when>
      	<c:when test="${courseContent.course_Name == 'C++'}">
      	<li class="list-group-item "><a href="https://www.jdoodle.com/online-compiler-c++/" target="_blank">Compiler</a></li>
      	</c:when>
      	<c:when test="${courseContent.course_Name == 'Java'}">
      	<li class="list-group-item "><a href="https://www.jdoodle.com/online-java-compiler/" target="_blank">Compiler</a></li>
      	</c:when>
      	<c:when test="${courseContent.course_Name == 'Python'}">
      	<li class="list-group-item "><a href="https://www.jdoodle.com/python3-programming-online/" target="_blank">Compiler</a></li>
      	</c:when>
      	</c:choose>
      	</c:if>
	 </ul>
      </div>
      </div>
    </div>
    <div class="col-md-9 col-lg-9 col-xl-9">
      <div style="margin-bottom: 3%;">
      <h1>Programming in ${courseContent.course_Name}</h1>
      </div>  
      <div style="margin-bottom: 2%;">       
      <c:forEach items="${filedd}" var="file" varStatus="ii">
       <p><c:out value = "${file}"/></p>
       </c:forEach>
       <p><c:out value = "${filedd}"/></p> 
      </div>  
    </div>
  </div>
</div>
   <%@include file="footer.jsp"%>
</body>
</html>