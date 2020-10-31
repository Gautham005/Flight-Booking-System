<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<center>
  <head>
    <title>Registration</title>
    <link rel="stylesheet" href="assets/css/style_signup.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    

  </head>

  <body>
	
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top justify-content-between">

      <ul class="navbar-nav">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">BookMyFlight.com</a>
        </li>

      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a>
        </li>
      </ul>
    </nav>
    <br>
    <br>
   
    <div class="form">
    <%
    String a = (String) request.getAttribute("status");
    if(a!=null){
    	if(a.equals("1")){
    		out.println("<p> Username already exists. <a href=\"login.jsp\">Click here to login </a></p>");
    	}
    	else if(a.equals("2")){
    		out.println("<p>Email already exists. <a href=\"login.jsp\">Click here to login </a> </p>");
    	}	
    	else if(a.equals("3")){
    		out.println("<p> Phone number already exists. <a href=\"login.jsp\">Click here to login </a> </p>");
    	}	
    }
    
    %>
       <h1><b>Registration</b></h1><br>
      <form action="verify" method="POST" onSubmit="return checkPassword(this);">
         <label>Username:</label>
        <input type="text" name="username" placeholder="Enter username"><br><br>
        <label>Name:</label>
        <input type="text" name="name" placeholder="Enter Name"><br><br>
        <label>Email id:</label>
        <input type="text" name="email" placeholder="Enter Email id"><br><br>
        <label>Phone No:</label>
        <input type="text" name="phone" placeholder="Enter Phone Number"><br><br>
        <label>Password:</label>
        <input type="password" name="password1" placeholder="Enter password"><br>
                <br>

        <label>Confirm password:</label>
        <input type="password" name="password2" placeholder="Enter password"><br>

        <br>
        <button type="submit" class="btn btn-primary">Register</button>
      </form>
    </div>

</html>
<script>
function checkPassword(form) { 
    password1 = form.password1.value; 
    password2 = form.password2.value; 
	
    if(form.username.value.length < 1){
    	alert("Username should not be empty");
    	return false;
    }
    
    // If password not entered 
    if (password1 == '') {
        alert ("Please enter Password"); 
    	return false;
    }
    // If confirm password not entered 
    else if (password2 == '') {
        alert ("Please enter confirm password"); 
    	return false;
    }
    // If Not same return False.     
    else if (password1 != password2) { 
        alert ("\nPassword did not match: Please try again...") ;
        return false; 
    } 
	phone = form.phone;
	if(phone.value.length !=10){
		alert("Enter 10 digit phone number");
		return false;
	}
	if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(form.email.value)){
			
	}
	else{
		alert("Please enter proper email id");
		return false;
	}
	if(form.name.length < 1){
		alert("Please enter name");
		return false;
	}
	if(/^\d{10}$/.test(phone.value)){
		
	}
	else{
		alert("Phone number should only consist of digits");
		return false;
	}
	
} 
</script>
