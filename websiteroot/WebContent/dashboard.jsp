<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

  <link rel="stylesheet" href="assets/css/style_dashboard.css">
  <link rel="stylesheet" href="assets/css/bootstrap.min.css">
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/popper.min.js"></script>
  <script src="assets/js/bootstrap.min.js"></script>

  <title>Dashboard</title>
</head>

<body>
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top justify-content-between">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">BookMyFlight.com</a>
      </li>
    </ul>
    <%
    String username = (String) session.getAttribute("user");
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

  <div class="container-fluid">
    <div class="row" style="margin-top: 1cm">
      <div class="col-md-8">
        <div class="content-section">
          <div class="media">
            <div class="media-body">
            <%
            String userd = (String) request.getAttribute("userd");
            String temp[] = userd.split(",");
            out.println("<h2 class=\"display-3\">"+username +"</h2>");
            out.println("<p class=\"text-secondary\">" + temp[1] +"</p>");
            
            
            %>
              
            </div>
          </div>
          <legend class="border-bottom mb-4">Profile Info</legend>
          <div id="div_id_name" class="form-group"> <label for="id_name" class="col-form-label">
              Name</label>
            <% out.println("<div class=\"\"> <input type=\"text\" disabled=\"true\" name=\"name\" value=\""+ temp[0] +"\" class=\"form-control\" required id=\"id_name\"> </div>"); %>
          </div>
          <div id="div_id_phone_no" class="form-group"> <label for="id_phone_no" class="col-form-label">
              Phone number</label>
            <% out.println("<div class=\"\"> <input type=\"text\" disabled=\"true\" name=\"phone_no\" value=\""+ temp[2] +"\" class=\"form-control\" required id=\"id_phone_no\"> </div>"); %>
            
          </div>
          <legend class="border-bottom mb-4">Wallet</legend>
          <div id="div_id_wallet" class="form-group"> <label for="id_wallet" class="col-form-label">
              Balance</label>
              <%
              	int bal = (int) request.getAttribute("balance");
        		out.println("<div class=\"\"> <input type=\"text\" disabled=\"true\" name=\"wallet_balance\" value=\"" + bal + "\" class=\"form-control\" required id=\"id_name\"> </div>");
              %>
          </div>
          <div class="form-group">
           <a href = "addMoney.jsp"> <button class="btn btn-outline-success" type="submit">Add money</button></a>
          </div>
        </div>
      </div>
      <div class="col-md-4">
        <div class="row-sm-3">
          <div class="content-section">
          <br>
            <h3>Latest bookings</h3>
          
            <table class="table table-sm table">
              <thead class="thead">
                <tr>
                  <th>Booking ID</th>
                  <th>Flight number</th>
                  <th>Amount</th>
                  <th>Date of Travel</th>
                  <th>No of travellers</th>
                  <th>Booking Date</th>
                </tr>
              </thead>
              <tbody>
              <%
              ArrayList<String> booking = (ArrayList<String>) request.getAttribute("bookings");
              int s = 5 > booking.size() ? booking.size() : 5;
              int i=0;
              while(i<s){
            	  String[] t = booking.get(i).split(",");
            	  out.println("<tr>");
                  out.println("<td><a href=\"tickets?id="+t[0]+"\">"+ t[0] +"</a></td>");
                  out.println("<td>"+ t[1] +"</td>");
                  out.println("<td>"+ t[2] +"</td>");
                  out.println("<td>"+ t[3] +"</td>");
                  out.println("<td>"+ t[4] +"</td>");
                  out.println("<td>"+ t[5] +"</td>");
                  out.println("</tr>");
            	  i++;
              }
              
              %>
              </tbody>
            </table>
                       <a href = "bookHistory"> <button class="btn btn-outline-success" type="button">View All Bookings</button></a>
            
          </div>
        </div>

        <div class="row-sm-1">
          <div class="content-section">
            <h3>Latest transactions</h3>
            <table class="table table-sm table">
              <thead class="thead">
                <tr>
                  <th>Transaction ID</th>
                  <th>Amount</th>
                  <th>Date </th>
                </tr>
              </thead>
              <tbody>
              
              <%
              ArrayList<String> transactions = (ArrayList<String>) request.getAttribute("transactions");
              s = 5 > transactions.size() ? transactions.size() : 5;
              i=0;
              while(i<s){
            	  String[] t1 = transactions.get(i).split(",");
            	  out.println("<tr>");
                  out.println("<td>"+ t1[0] +"</td>");
                  out.println("<td>"+ t1[1] +"</td>");
                  out.println("<td>"+ t1[2] +"</td>");
                  out.println("</tr>");
            	  i++;
              }
              
              %>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>

</html>
