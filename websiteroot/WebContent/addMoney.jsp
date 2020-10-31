<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title> Add money </title>
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
       <%
        	if(session!=null){
        		if(session.getAttribute("user")!=null){
        			String username = (String) session.getAttribute("user");
        			out.println("<ul class=\"navbar-nav ml-auto\">");
                	out.println("<li class=\"nav-item\">");
                	out.println("<a class=\"nav-link\" href=\"dash\">"+ username +"</a>");
                	out.println("</li>");
                	out.println("<li class=\"nav-item\">");
                	out.println("<a class=\"nav-link\" href=\"logout\">logout</a>");
                	out.println("</li>");
                	out.println("</ul>");
        		}
        		else{

        		    response.sendRedirect("index.jsp");
                }
        	}
        	else{
        	    response.sendRedirect("index.jsp");
        }
        %>
        
    </nav>
    <br>
    <br>
    <br>

    <style>
        body {
            margin: 0;
            padding: 0;
            background: url(assets/images/loginimage.jpg);
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            font-family: sans-serif;
        }


        .wrap {
            width: 400px;
            height: 280px;
            padding: 40px;
            border: 1.2px solid white;
            margin-top: 7%;
            margin-left: 35%;
            background-color: rgba(0, 0, 0, 0.5);

        }

        h1 {
            margin: 0;
            padding: 0 0 20px;
            text-align: center;
            font-size: 30px;
            font-weight: bold;
        }

        .wrap input[type="text"] {
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
    <div class="wrap">


            <h1 style="color:white;"> Add Money</h1>
            <form action="addmoney" method="POST">

                <p id="1" style="color:white;"><b>Amount</b></p>
                <input type="text" name="amount" placeholder="   Enter amount">
                <br>
                <br>
   
                    <button type="submit" class="btn btn-primary"> <b> Add </b></button>

            </form>
        

    </div>

</body>

</html>