<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <title>Search Results</title>
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

                	out.println("<ul class=\"navbar-nav ml-auto\">");
                	out.println("<li class=\"nav-item\">");
                	out.println("<a class=\"nav-link\" href=\"signup.jsp\">Signup</a>");
                	out.println("</li>");
                	out.println("<li class=\"nav-item\">");
                	out.println("<a class=\"nav-link\" href=\"login.jsp\">Login</a>");
                	out.println("</li>");
                	out.println("</ul>");
                }
        	}
        	else{

            	out.println("<ul class=\"navbar-nav ml-auto\">");
            	out.println("<li class=\"nav-item\">");
            	out.println("<a class=\"nav-link\" href=\"signup.jsp\">Signup</a>");
            	out.println("</li>");
            	out.println("<li class=\"nav-item\">");
            	out.println("<a class=\"nav-link\" href=\"login.jsp\">Login</a>");
            	out.println("</li>");
            	out.println("</ul>");
            }
        	
        %>
    </nav>

    <div class="search-results-box">
        <table class="table-sm table-dark">
            <thead class="thead-dark">
                <tr>
                    <th scope="col" style="color: #FF5733">Source</th>
                    <th scope="col" style="color: #FF5733">Destination</th>
                    <th scope="col" style="color: #FF5733">Date of Journey</th>
                </tr>
                <tr>
                <%
                out.println("<th scope=\"col\">"+ request.getAttribute("source") +"</th>");
                out.println("<th scope=\"col\">"+ request.getAttribute("destination") +"</th>");
                out.println("<th scope=\"col\">"+ request.getAttribute("date") +"</th>");
                %>
                    
                </tr>
            </thead>
        </table>
    </div>
    <div class="search-results-box">
        <table class="table table-sm table-dark">
            <thead class="thead-dark">
                <tr>
                    <th scope="col" colspan="5" style="color: #FF5733">SEARCH RESULTS</th>
                </tr>
            </thead>
            <thead class="thead-dark">
                <tr>
                    <th style="color:  #DAF7A6">#</th>
                    <th style="color:  #DAF7A6">Flight Name</th>
                    <th style="color:  #DAF7A6">Departure</th>
                    <th style="color:  #DAF7A6">Arrival</th>
                    <th style="color:  #DAF7A6">Price per person</th>
                    <th style="color:  #DAF7A6">Booking link</th>
                </tr>
            </thead>
            <tbody>
            <%
            	ArrayList<String> result = (ArrayList<String>) request.getAttribute("flights");
            	Iterator itr = result.iterator();
            	int c = 1;
            	int c1 = (int) request.getAttribute("count");

            	while(itr.hasNext()){
            		out.println("<tr>");
            		String temp =(String) itr.next();
            		String arr[] = temp.split(",");
            		out.println("<th scope=\"row\">"+ c +"</th>");
            		out.println("<td>"+arr[0]+"</td>");
            		out.println("<td>"+arr[2]+"</td>");
            		out.println("<td>"+arr[5]+" "+arr[3]+"</td>");
            		out.println("<td>"+arr[4]+"</td>");
            		out.println("<td><a href=\"book?flight=" +arr[0]+"_"+c1+ "_"+ request.getAttribute("date") + "\">Book Now</td>");
            		out.println("</tr>");	
            	}
            %>
            
                
                
            </tbody>
        </table>
    </div>
</body>

</html>
