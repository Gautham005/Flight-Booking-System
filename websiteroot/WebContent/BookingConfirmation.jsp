<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title> Booking Confirmation </title>
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
        <% String username = (String) session.getAttribute("user");
        			out.println("<ul class=\"navbar-nav ml-auto\">");
                	out.println("<li class=\"nav-item\">");
                	out.println("<a class=\"nav-link\" href=\"dash\">"+ username +"</a>");
                	out.println("</li>");
                	out.println("<li class=\"nav-item\">");
                	out.println("<a class=\"nav-link\" href=\"logout\">logout</a>");
                	out.println("</li>");
                	out.println("</ul>");
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
            width: 800px;
            height: auto;
            overflow: hidden;
            padding: 40px;
            border: 1.2px solid white;
            margin-top: 2%;
            margin-left: 25%;
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

        .wrap input[type="password"] {
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

        <font color="white">
            <h1>Enter customer details</h1>
            

                <%
                	int c = (int)request.getAttribute("count");
                int v1 = (int) request.getAttribute("price");
            	int v2 = (int) request.getAttribute("wallet");
            	if(v2<v1){
            		out.println("<form action=\"addMoney.jsp\" method=\"POST\">");
            	}
            	else{
            		out.println("<form action=\"book\" method=\"POST\">");
            	}
            	int i=0;
            	while(i<c){
                		out.println("<p id=\"1\"><b>Name</b></p>");
                		out.println("<input type=\"text\" name=\"pname"+i + "\" placeholder=\"   Enter customer name\">");
                		out.println("<br><br>");
                		out.println("<p id=\"1\"><b>Date of birth</b></p>");
                		out.println("<input type=\"date\" name=\"dob"+i+"\" placeholder=\"   Enter customer dob\">");
                		out.println("<br><br>");
                		out.println("<p id=\"1\"><b>Gender</b></p>");
                		out.println("<input type=\"radio\" name=\"gender"+i+"\" value=\"male\" checked> Male");
                		out.println("<input type=\"radio\" name=\"gender"+i+"\" value=\"female\"> Female</input>");
                		out.println("<input type=\"radio\" name=\"gender"+i+"\" value=\"other\"> Other");
                		out.println("<input type=\"hidden\" name=\"price\" value=\""+ v1+"\" />");
                		out.println("<input type=\"hidden\" name=\"flightno\" value=\""+ request.getAttribute("flightno")+"\" />");
                		out.println("<input type=\"hidden\" name=\"date\" value=\""+ request.getAttribute("date")+"\" />");
                		i++;
                	}
                	
                	
                	out.println("<p> Total amount = " +  v1+ "</p>");
                	out.println("<p> Wallet balance = " + v2 + "</p>");
                	if(v2 < v1){
                		out.println("<a href=\"addbalance.jsp\"><button  class=\"btn btn-primary\"> <b> Add money </b></button> </a> ");
                	}
                	else{
                		out.println("<button type = \"submit\" class=\"btn btn-primary\"> <b> Book </b></button>");
                	}
                %>

                    
            </form>
        </font>

    </div>

</body>

</html>