function fisValid()
{
  var fname=document.getElementById("ufirst_name").value; 
  if ((fname.match(/^[A-Za-z]+$/))) { 
    document.getElementById("fvalidateerror").innerHTML="";
  } 
  else if((fname.match(/^[0-9a-zA-Z]+$/))){ 
    document.getElementById("fvalidateerror").innerHTML="*Only Alphabet!!!!"
  }
}
function lisValid()
{
  var fname=document.getElementById("ulast_name").value; 
  if ((fname.match(/^[A-Za-z]+$/))) { 
    document.getElementById("lvalidateerror").innerHTML=""
  } 
  else if((fname.match(/^[0-9a-zA-Z]+$/))){
    document.getElementById("lvalidateerror").innerHTML="*Only Alphabet!!!!"
  }
}
function emailValidate(){
	 var email=document.getElementById("uemail").value; 
	  if ((email.match(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/))) { 
		  document.getElementById("evalidateerror").innerHTML=""
	  } 
	  else{
	    document.getElementById("evalidateerror").innerHTML="*Email is not valid!!!"
	  }
}
function phoneValidate(){
	 var phone=document.getElementById("uphone_number").value; 
	  if ((phone.match(/^\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})$/))) { 
		  document.getElementById("pvalidateerror").innerHTML=""
	  } 
	  else{
		  document.getElementById("pvalidateerror").innerHTML="*Enter valid number!!"
	  }
}
function matchPassword(){
  var password=document.getElementById("upassword").value; 
  var confirmPassword=document.getElementById("cpassword").value;  
  if(password != confirmPassword){
    document.getElementById("passworderror").innerHTML="*Password Does not match!"
  }
  else{
    document.getElementById("passworderror").innerHTML="";
  }
} 

function matchResetPassword(){
	  var password=document.getElementById("newPasswordField").value; 
	  var confirmPassword=document.getElementById("cnewPasswordField").value;  
	  if(password!=confirmPassword){
	    document.getElementById("cnewPasswordFielderror").innerHTML="*Password Does not match!"
	  }
	  else{
	    document.getElementById("cnewPasswordFielderror").innerHTML="";
	  }
	}