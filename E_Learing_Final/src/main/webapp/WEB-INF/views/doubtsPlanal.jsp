<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link  rel="stylesheet" type="text/css" href="resources/css/doubtsPanal.css">
<script type="text/javascript">
$(document).ready(function() {
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
<section>
<div class="row">
<!-- Left panal -->
<div class="col-lg-2 col-md-2">
<ul class="list-group list-group-flush nav-pills" role="tablist"">
  <li class="list-group-item text-center">Home</li>
  <li class="list-group-item list-group-item-dark" style="height: 30px; padding-top: 0.25rem;">Public</li>
  <li class="list-group-item"><a class="nav-link active" data-toggle="pill" href="#home">All</a></li>
  <li class="list-group-item"><a class="nav-link " data-toggle="pill" href="#category">Category</a></li> 
  <li class="list-group-item"><a class="nav-link " data-toggle="pill" href="#user">User</a></li>   
</ul> 
</div>
<div class="col-lg-10 col-md-10 border-left">
<div class="tab-content">
<!-- Tab 1 -->
 <div id="home" class="container-fluid tab-pane active">
 <div class="row" style="margin-top: 3%;">
<div class="col-lg-9 col-md-9"><h4 style="padding-left: 3%;">
All Questions
</h4></div>
<div class="col-lg-3 col-md-3">
<a type="button" href="#" id="askTheQuestion" class="btn btn-outline-primary">Ask Question</a> 
</div>
</div>
<hr>
<div  >
<div>
<ul class="list-group list-group-flush"> 
<c:forEach var="questoion" items="${userDoubts}" varStatus="number">
<li class="list-group-item"><h5> Q ${number.count}: <a href="questionDescription${questoion.user_doubt_question_id}">${questoion.doubtsQuestion}</a> </h5>
<div class="row"> 
<div class="col-md-9 col-lg-10"><p style="padding-left: 5%;">${questoion.description} </p></div>
<div class="col-md-3 col-lg-2"><h6 class="text-right">Asked: ${questoion.localDate}</h6> </div>
</div>
</li>
</c:forEach>
<!-- ---------------------------------------------- -->
<c:forEach var="questoion" items="${selectUserDoubts}" varStatus="number">
<li class="list-group-item"><h5> Q ${number.count}: <a href="questionDescription${questoion.user_doubt_question_id}">${questoion.doubtsQuestion}</a> </h5>
<div class="row"> 
<div class="col-sm-10 col-lg-10"><p style="padding-left: 5%;">${questoion.description} </p></div>
<div class="col-sm-2 col-lg-2"><h6 class="text-right">Asked: ${questoion.localDate}</h6> </div>
</div>
</li>
</c:forEach>
</ul>
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
   <%@include file="footer.jsp"%>
</body>
</html>