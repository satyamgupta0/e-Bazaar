<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="try1.User"%>
	<%@ page import="java.sql.Connection" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@ page import="Connection.MyCon"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.15.1/jquery.validate.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script"
	rel="stylesheet">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<title>e-Bazaar</title>
<style>
.header {
	position: sticky;
	top: 0;
	color:black;
	font-weight: 900;
	text-align: center;
}
</style>
<link rel="stylesheet" href="css/styleindex.css" />
<%@ include file="headercustomer.jsp"%>
</head>
<body>

	<%
	//############################################
	response.setHeader("cache-control", "no-cache, no-store , must-revalidate");
	//Http 1.1 line is used to prevent back button after logout
	response.setHeader("pragma", "no-cache");// http1.0
	response.setHeader("Expires", "0"); // proxies

	//boolean result=(boolean) session.getAttribute("LoginValue");

	if (session.getAttribute("email") == null) {
		response.sendRedirect("login.html");
	}

	try {
		User user = (User) session.getAttribute("user");
	%>

	<div style="text-align: center;">
        <h1>Welcome! <%=user.getName() %></h1>
		<h3>Email Id : <%=user.getEmail() %></h3>
		<h3>UserID : <%=user.getUserID() %></h3>
		
		<section>
		<body>
	<div style="color: Black; text-align: center; font-size: 30px;">
		<b>Recent Purchase history</b> <i class='fas fa-dolly'></i>
	</div>
	<br>
	<div class="table-responsive overflow-auto "
		style="height: 300px; overflow: auto; width:80%; margin:0 auto 0 auto;">


		<table class="table table-striped table-bordered"
			style="width: 90%; margin: 0 auto 0 auto">
			<thead class="thead-light"
				style="text-align: center; display: sticky;">
				<tr>
					<th class="header" scope="col">Activity Time</th>
					<th class="header" scope="col">Activity Description</th>
					<th class="header" scope="col">ProductID</th>
				</tr>

			</thead>
			<tbody>
				<%
				try {
					Connection con = MyCon.dbcon("user_activity");
					Statement st = con.createStatement();
					ResultSet rs = st
					.executeQuery("select * from customer_activity where userID='"+user.getUserID()+"' and activityName='BOUGHT'");
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				System.out.println(e);
				}
				%>
			</tbody>
		</table>


	</div>
</body>
		</section>
		<br><br>
		<section>
		<body>
	<div style="color: Black; text-align: center; font-size: 30px;">
		<b>Recent Login history</b> <i class='fas fa-dolly'></i>
	</div>
	<br>
	<div class="table-responsive overflow-auto "
		style="height: 300px; overflow: auto; width:80%; margin:0 auto 0 auto;">


		<table class="table table-striped table-bordered"
			style="width: 90%; margin: 0 auto 0 auto">
			<thead class="thead-light"
				style="text-align: center; display: sticky;">
				<tr>
					<th class="header" scope="col">Activity Time</th>
					<th class="header" scope="col">Activity</th>					
				</tr>

			</thead>
			<tbody>
				<%
				try {
					Connection con = MyCon.dbcon("user_activity");
					Statement st = con.createStatement();
					ResultSet rs = st
					.executeQuery("select * from customer_activity where userID='"+user.getUserID()+"' and activityName='LOGGEDIN'");
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(5)%></td>
					
				</tr>
				<%
				}
				} catch (Exception e) {
				System.out.println(e);
				}
				%>
			</tbody>
		</table>


	</div>
</body>
		</section>
		<br><br><br>
		
    </div>
	<%
	} catch (Exception e) {
	e.getMessage();
	}
	//##############################################
	%>
	
	
	<%@ include file="footer.jsp"%>
</body>
</html>