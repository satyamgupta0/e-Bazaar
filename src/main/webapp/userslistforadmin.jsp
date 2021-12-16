<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.Connection"%>
<%@ page import="Connection.MyCon"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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

<title>UserEntry</title>
<style>
    .header{
        position:sticky;
        top: 0 ;
    }
</style>
</head>

<body>
<%//############################################
response.setHeader("cache-control", "no-cache, no-store , must-revalidate");
//Http 1.1 line is used to prevent back button after logout
response.setHeader("pragma", "no-cache");// http1.0
response.setHeader("Expires", "0");  // proxies

//boolean result=(boolean) session.getAttribute("LoginValue");

if(session.getAttribute("email")==null){
	response.sendRedirect("login.html");
}
%>

<div style="text-align: center;">
 <br><br>
        <h1>User Registration Details</h1>    <br><br>
         
    </div>
	<div class="table-responsive overflow-auto "style="height:300px; overflow:auto;">
		

		<table class="table table-striped table-bordered" style="width: 90%; margin:0 auto 0 auto">
			<thead class="thead-dark" style="text-align: center; display:sticky;">
				<tr >

					<th class="header" scope="col">Sr.No.</th>
					<th class="header"  scope="col">Name</th>
					<th class="header"  scope="col">Email</th>
					<th class="header"  scope="col">MobNumber</th>
					<th class="header"  scope="col">Password</th>
					<th class="header"  scope="col">Address</th>
					<th class="header"  scope="col">Reg-Time</th>
					<th class="header"  scope="col">userID</th>
					<!-- 	<th scope="col">userType</th> 	-->	
				</tr>
			</thead>
			<tbody>
				<%
				try {
					Connection con = MyCon.dbcon("user_signup_login_DATA_for_admin");
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("select * from userRegistrationDetails");
					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getInt(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
	<!--<td><%=rs.getString(9)%></td>  	-->			
				</tr>
				<%
				}
				} catch (Exception e) {
				// TODO: handle exception
				out.print(e.getMessage());
				}
				%>
			</tbody>
		</table>


	</div>
	<!-- ###################################################### -->






</body>
</html>