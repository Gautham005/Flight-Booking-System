<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*" %>
    
<!DOCTYPE html>
<html>

<head>
    <title> Booking List </title>
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
        
        td {
        	text-align: center;
        }
		table, th, td {
  			border: 1px solid black;
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
        <h1>Booking Confirmation</h1>
        <table style="width: 100%">
            <tr>
                <th>Booking id</th>
                <th>Source</th>
                <th>Destination</th>
                <th>Flight Name</th>
                <th>Date of travel</th>
                <th>Amount</th>
                <th>No of tickets</th>
                <th>Booking date</th>
            </tr>
            <%
            ArrayList<String> s = (ArrayList<String>) request.getAttribute("bookings");
            int i=0;
            while(i<s.size()){
            	String[] temp = s.get(i).split(",");
            	out.println("<tr>");
                out.println("<td><a href=\"tickets?id="+temp[0]+"\">"+temp[0]+"</a></td>");
                out.println("<td>"+ temp[1]+"</td>");
                out.println("<td>"+ temp[2]+"</td>");
                out.println("<td>"+ temp[3]+"</td>");
                out.println("<td>"+ temp[5]+"</td>");
                out.println("<td>"+ temp[4]+"</td>");
                out.println("<td>"+ temp[6]+"</td>");
                out.println("<td>"+ temp[7]+"</td>");
                out.println("</tr>");
                i++;
            }
            %>
        </table>
    </div>
    <br>
</body>

</html>