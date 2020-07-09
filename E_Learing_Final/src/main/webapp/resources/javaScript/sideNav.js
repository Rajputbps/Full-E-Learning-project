function openLessonList() {
  document.getElementById("lissonList").style.width = "500px";
  document.getElementById("mainpage").style.marginLeft = "500px";
}

function closeLessonList() {
	  document.getElementById("mainpage").style.marginLeft= "0";
  document.getElementById("lessonList").style.width = "0";
}

//header page 

function openNav() {
	  document.getElementById("mySidenav").style.width = "500px";
	}

	function closeNav() { 
	  document.getElementById("mySidenav").style.width = "0";
	}