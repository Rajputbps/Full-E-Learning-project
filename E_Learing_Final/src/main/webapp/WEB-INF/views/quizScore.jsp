<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.boxStyle{
border-style: solid;
border-color: #d3d3d3;
border-radius: 10px;
margin-top: 1%;
margin-left: 1%;
padding-top: 1%;
} 
.herader{
width: 100%;
height: 150px;
color: #ffffff;
background-color: #d3d3d3;
border-radius: 10px;
padding-left: 3%;
}
</style>
</head>
<body style="padding-top: 5%;">
<div class="container">
<div class="herader">
<h1 class="text-center" style="padding-top: 0.5%;">${lessionName.lesson_name}</h1>
<h4>Quiz.${quizNumber}</h4>
<h3>Your Score: ${your_score}</h3> </div>

<div class="row" style="margin-left: 5%;">
<c:forEach items="${your_score_status}" var="status" varStatus="number">
<div class="col-lg-2 col-md-2 boxStyle" >
<c:if test="${status == 'Right'}">
<div class="row">
<div class="col"><h4><b>${number.count}</b></h4></div>
<div class="col"><i class="fa fa-check" aria-hidden="true" style="color: green; font-size: 25px;"></i></div>
</div>
</c:if>
<c:if test="${status == 'Wrong'}">
<div class="row">
<div class="col"><h4 class="text-center"><b>${number.count}</b></h4></div>
<div class="col text-center" ><i class="fa fa-times" aria-hidden="true" style="color: red; font-size: 25px; "></i></div>
</div>
</c:if>
</div>
</c:forEach>
</div>
<div style="padding-top: 1%; padding-bottom: 1%; margin-top: 1%;" class="text-center">
<a type="button" class="btn btn-success" href="profile" style="width: 150px;">Close</a>
</div>
</div>
   <%@include file="footer.jsp"%>
</body>
</html>