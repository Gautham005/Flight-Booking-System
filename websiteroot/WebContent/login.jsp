<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title> Login </title>
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
			<a class="nav-link" href="signup.jsp">Sign Up</a>
		</li>
	</ul>
</nav>
<br>
<br>
<br>

<style>

body{
    margin: 0;
    padding: 0;
    background: url(assets/images/loginimage.jpg);
    background-repeat:no-repeat; 
    background-size: cover;
    background-position: center;
    font-family: sans-serif;
}


.wrap{
width: 400px;
height: 450px;
padding: 40px;
border: 1.2px solid white;
margin-top: 7%;
margin-left: 35%; 
background-color: rgba(0,0,0,0.5);

}

h1{
    margin: 0;
    padding: 0 0 20px;
    text-align: center;
    font-size: 30px;
    font-weight: bold;
}

.wrap input[type="text"]
{
    border: none;
    border-bottom: 1px solid #fff;
outline: none;
    border-radius: 5px;
    height: 40px;
    color: black;
    font-size: 16px;
    width: 320px;

}

.wrap input[type="password"]
{
    border: none;
    border-bottom: 1px solid #fff;
    outline: none;
      border-radius: 5px;
    height: 40px;
    color: black;
    font-size: 16px;
    width: 320px;

}






</style>
	<div class = "wrap" >

<font color="white">
<%
	Boolean a = (Boolean) request.getAttribute("status");
if(a!=null){
	if(a==false){
		out.println("<p>Username or password incorrect </p>");
	}	
}
Cookie[] cookies = request.getCookies();
String uname = "";
String password = "";
if(cookies!=null  ){
	if(cookies.length >1)
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("username")){
			uname = cookies[i].getValue();
		}
		else if(cookies[i].getName().equals("password")){
			password = cookies[i].getValue();
		}
	}
}
%>
		<h1 > Login</h1>
		<form action="authenticate" method="POST">

		<p  id="1"><b>Username</b></p>
		<% out.println("<input type = \"text\"   name = \"username\" placeholder =\"   Enter Username\"   value = \""+uname+"\">"); %>
		<br>
		<br>

		 <p id ="2" ><b>Password</b></p>
		<% out.println("<input type = \"password\" name = \"password\" placeholder =\"   Enter Password\" value = \""+password+"\" >"); %>
		<br>
		<br>
		<p>Remember me 
		<input type="checkbox" name = "rememberMe" value="remember" checked></p>
		<center>
		<button class ="btn btn-primary"> <b>  Login </b></button>
	</center>	
	</form>
		</font>

	</div>

</body>

</html>