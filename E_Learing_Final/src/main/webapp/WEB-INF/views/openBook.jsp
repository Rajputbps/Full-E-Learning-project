<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp"%>
<!DOCTYPE html> 
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/openBook.css"> 
<link rel="stylesheet" type="text/css" href="resources/css/file.css"> 
<script type="text/javascript" src="resources/javaScript/sideNav.js"></script>
<script>
$(document).ready(function() {
	$("#name").hide();
	//$("#mname").hide(); 
	
	if(screen.width>768){
		$("#openButton").hide();
	}
	
	if ( screen.width < 768 ) {
		$("#courseNameHEader").hide();
			 setTimeout(function() {
				 $("#lissonList").hide(1000);
				 $("#lessonContent").removeClass('col-md-9 col-lg-9 col-xl-9').addClass('col-md-12');
				  }, 2000);
		}  
	
	function checkScreenWidth() {
		if ( screen.width < 768 ) {
			   $("#lissonList").hide(1000);
				 $("#lessonContent").removeClass('col-md-9 col-lg-9 col-xl-9').addClass('col-md-12');
		}
	}
	
	$("#openLessonList").click(function() {
		 $("#lessonContent").removeClass('col-md-12').addClass('col-md-8');
		 $("#lissonList").removeClass('col-md-3 col-lg-3 col-xl-3').addClass('col-md-4');
		$("#lissonList").show(1000);
	});
	
		  $('[data-toggle="tooltip"]').tooltip();
		  
		  $('a[href="#readContant"]').click(function() {   
			   $.get({
				   url:'readLessonContentFromFile', 
				   data: 'lessonIdData=' + $(this).attr("data-id"),
				   success:function(response) {    
					   $("#mainreload").hide();
					   $("#name").show();
					   checkScreenWidth();
					    var items = "";
		                  $("#LessonContentText").empty();  
						    $.each(response, function(i, item) {  
		                      $("#LessonContentText").append(item); 
		                  }); 
				   },
				      error:function(msg){
				    	  alert("error"+msg);
				    	  //$("#error").append("<div><u>Message</u>:<br /><br />" +  msg + "</div>");
				      }
			   });
		});
		  $('a[href="#mreadContant"]').click(function() {   
			   $.get({
				   url:'readLessonContentFromFile', 
				   data: 'lessonIdData=' + $(this).attr("data-id"),
				   success:function(response) {    
					   $("#mmainreload").hide();
					   closeLessonList();
					   $("#mname").show();
					    var items = "";
		                  $("#MlessonContentText").empty();  
						    $.each(response, function(i, item) {  
		                      $("#MlessonContentText").append(item); 
		                  }); 
				   },
				      error:function(msg){
				    	  alert("error"+msg);
				    	  //$("#error").append("<div><u>Message</u>:<br /><br />" +  msg + "</div>");
				      }
			   });
		});
		 
});
</script>
 
</head>
<body style="padding-top: 5%;">
<div class="container-fluid">
  <div class="row">
    <div class="col-md-3 col-lg-3 col-xl-3" id="lissonList">    
      <div>
     
      <br>
      <div style="padding-top: 2px;">     
      <ul class="list-group">
      	<li class="list-group-item" style="background-color: #d3d3d3;"><div> <h4>Course Layout</h4> </div> </li>
      	 <li class="list-group-item lessionList"> <div class="lessionList row"> <div class="col-lg-10 col-md-10"><a href="courceDetail${lessionC.course_id}" style="color: #fff;">Course Description</a> </div><div class="col-lg-2 col-md-10"><i class="fa fa-hand-o-right float-right" aria-hidden="true"></i></div> </div> </li>
      	<c:forEach var="lessionC" items="${courseLession}" varStatus="number">
      	<c:choose>
    <c:when test="${lessionC.lesson_id == 1}">
    <li class="list-group-item" style="text-transform: capitalize;"> <a href="#readContant" data-id="${lessionC.lesson_id}">${lessionC.lesson_name}</a> </li> 
    </c:when>    
    <c:otherwise>
     	<li class="list-group-item" style="text-transform: capitalize;"> ${number.count}. <a  href="#readContant" data-id="${lessionC.lesson_id}"> ${lessionC.lesson_name} </a> </li>
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
    <div class="col-md-9 col-lg-9 col-xl-9" id="lessonContent"> 
      <div class="row" style="background-color: #b4cfc8;"> 
      <div class="col"><h2 style="padding-top: 30px; padding-left: 10px; padding-bottom:30px;">${courseContent.course_Name}</h2></div>
      <div class="col text-right" id="openButton"><h4 style="padding-top: 30px; padding-left: 10px; padding-bottom:30px;"><span id="openLessonList">&#9776; open</span></h4> </div>
      </div> 
       <div id="mainreload">
      <div style="margin-bottom: 2%;">  
      <img alt="" src="resources/courseImages/${courseContent.course_image}" style="float: right; height: 300px; width: 300px;">
      		 ${courseContent.course_description}
      	   </div>   
      <div style="margin-bottom: 2%;">
      <h3>COURSE LAYOUT</h3>
      <c:forEach var="lessionC" items="${courseLession}" varStatus="number">
       <b>Lesson ${number.count} </b> :  ${lessionC.lesson_name}<br/>
      </c:forEach> 
          <h3>BOOKS AND REFERENCES</h3>
          <ul>
          <li>${courseContent.books_and_references}</li>
          </ul> 
      </div>
      </div>     
      <!-- Read Contant -->
      <div id="name" style="margin-bottom: 20%;">
       <div id="LessonContentText">
       </div> 
      </div>
    </div> 
  </div>
</div> 
 
<!-- For small device -->
 <%-- <div class="d-none d-md-block d-lg-none">
    <div style="padding-top: 2px;" id="lessonList" class="sidenav">     
      <ul class="list-group"> 
      	<li class="list-group-item" style="background-color: #d3d3d3;"><div> <h4>Course Layout <a href="javascript:void(0)" class="closebtn" onclick="closeLessonList()">&times;</a></h4> </div> </li>
      	 <li class="list-group-item lessionList"> <div class="lessionList">
      	 <a href="courceDetail${lessionC.course_id}" style="color: #fff;">Course Description</a>   
      	 </div> 
      	 </li>
      	<c:forEach var="lessionC" items="${courseLession}" varStatus="number">
      	<c:choose>
    <c:when test="${lessionC.lesson_id == 1}">
    <li class="list-group-item" style="text-transform: capitalize;"> <a href="#mreadContant" data-id="${lessionC.lesson_id}">${lessionC.lesson_name}</a> </li> 
    </c:when>    
    <c:otherwise>
     	<li class="list-group-item" style="text-transform: capitalize;"><a  href="#mreadContant" data-id="${lessionC.lesson_id}"> ${lessionC.lesson_name} </a> </li>
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
 

<div id="mainpage"> 
       <div id="mmainreload">
            <div class="row" style="background-color: #b4cfc8;"> 
      <div class="col"><h2 style="padding-top: 30px; padding-left: 10px; padding-bottom:30px;">${courseContent.course_Name}</h2></div>
      <div class="col text-right"><h4 style="padding-top: 30px; padding-left: 10px; padding-bottom:30px;"><span onclick="openLessonList()">&#9776; open</span></h4> </div>
      </div> 
      <div style="margin-bottom: 2%;">  
      <img alt="" src="resources/courseImages/${courseContent.course_image}" style="float: right; height: 300px; width: 300px;">
      		 ${courseContent.course_description}
      	   </div>   
      <div style="margin-bottom: 2%;">
      <h3>COURSE LAYOUT</h3>
      <c:forEach var="lessionC" items="${courseLession}" varStatus="number">
       <b>Lesson ${number.count} </b> :  ${lessionC.lesson_name}<br/>
      </c:forEach> 
          <h3>BOOKS AND REFERENCES</h3>
          <ul>
          <li>${courseContent.books_and_references}</li>
          </ul> 
      </div>
      </div>     
      <!-- Read Contant -->
      <div id="mname">
      <div class="row" style="background-color: #b4cfc8;"> 
      <div class="col"><h2 style="padding-top: 30px; padding-left: 10px; padding-bottom:30px;">${courseContent.course_Name}</h2></div>
      <div class="col text-right"><h4 style="padding-top: 30px; padding-left: 10px; padding-bottom:30px;"><span onclick="openLessonList()">&#9776; open</span></h4> </div>
      </div>  
       <div id="MlessonContentText"> 
       </div> 
      </div>
</div>
 </div> --%>

<!-- <div id="noteContentTextArea"></div> -->
   <%@include file="footer.jsp"%>
</body>
</html>