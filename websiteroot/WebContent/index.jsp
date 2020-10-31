<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>

<head>
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>

    <title>Home</title>
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
    <div class="booking-form-box">

            <div class="booking-form">
                <form method="POST" action="search-results" onSubmit="return validation(this);">
                    <label>Source city</label>
                    <input type="text" class="form-control" placeholder="City or Airport" name="source">
                    <label>Destination city</label>
                    <input type="text" class="form-control" placeholder="City or Airport" name="destination">
                    <div class="input-grp">
                        <label>Date of Journey</label>
                        <input type="date" class="form-control select-date" name="journey_date">
                    </div>
                    <div class="input-grp">
                        <label>No of travellers</label>
                        <input type="number" name="no_of_travellers" class="form-control" value="1">
                    </div>
                    
                                        <div class="input-grp">
                        <button type="submit" class="btn btn-primary " style="margin-left: 120px; margin-top: 15px;" value="Submit">Show
                            flights</button>
                    </div>
                </form>
            </div>
        </div>
<script>
function validation(form) {
    if (form.source.value.length == '') {
        alert("Source city cannot be empty");
        form.source.focus();
        return false;
    }
    if (form.destination.value == '') {
        alert("Destination city cannot be empty");
        form.destination.focus();
        return false;
    }
    if (form.journey_date.value == '') {
        alert("Journey date cannot be empty");
        form.journey_date.focus();
        return false;
    }
    return true;
    
}</script>
</body>

</html>