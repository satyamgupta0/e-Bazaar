<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.Connection"%>
<%@ page import="Connection.MyCon"%>
<%@ page import="try1.User" %>

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

<title>Stock</title>
<style>
.header {
	position: sticky;
	top: 0;
	color:black;
	font-weight: 900;
	text-align: center;
}
</style>
<%@ include file="headervendor.jsp"%>
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
	try{
		User user=(User) session.getAttribute("user");
		if (user==null) response.sendRedirect("login.html");
	%>

	<div id="grocery">
		<div style="text-align: center;">
			<br>
			<h1>Grocery</h1>
			<br> <br>

		</div>
		<div class="table-responsive overflow-auto "
			style="height: 400px; overflow: auto;">


			<table class="table table-striped table-bordered"
				style="width: 90%; margin: 0 auto 0 auto">
				<thead class="thead-light"
					style="text-align: center; display: sticky;">
					<tr>

						<th class="header" scope="col">Sr.No.</th>
						<th class="header" scope="col">ProductID</th>
						<th class="header" scope="col">SubCategory</th>
						<th class="header" scope="col">Name</th>
						<th class="header" scope="col">Price</th>
						<th class="header" scope="col">Unit</th>
						<th class="header" scope="col">Qualities</th>
						<th class="header" scope="col">MFG</th>
						<th class="header" scope="col">Update</th>
					</tr>
				</thead>
				<tbody>
					<%
					try {
						Connection con = MyCon.dbcon("product");
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * from grocery where sellerID='"+user.getUserID()+"'");
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getInt(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getDouble(5)%></td>
						<td><%=rs.getInt(6)%></td>
						<td><%=rs.getString(7)%></td>
						<td><%=rs.getString(8)%></td>
						<td><form action="updateStockVendor.jsp" class="normal">
						<input type="text" name="productID" value="<%=rs.getString(2)%>" style="display:none;">
						<button class="btn" type="submit" style="background: green; margin:5px;">Update</button>
						</form></td>



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
	</div>
	<!-- ###################################################### -->
<div id="electronics">
		<div style="text-align: center;">
			<br>
			<h1>Electronics</h1>
			<br> <br>

		</div>
		<div class="table-responsive overflow-auto "
			style="height: 400px; overflow: auto;">


			<table class="table table-striped table-bordered"
				style="width: 90%; margin: 0 auto 0 auto">
				<thead class="thead-light"
					style="text-align: center; display: sticky;">
					<tr>

						<th class="header" scope="col">Sr.No.</th>
						<th class="header" scope="col">ProductID</th>
						<th class="header" scope="col">SubCategory</th>
						<th class="header" scope="col">Name</th>
						<th class="header" scope="col">Price</th>
						<th class="header" scope="col">Unit</th>
						<th class="header" scope="col">Qualities</th>
						<th class="header" scope="col">MFG</th>
						<th class="header" scope="col">Update</th>
					</tr>
				</thead>
				<tbody>
					<%
					try {
						Connection con = MyCon.dbcon("product");
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * from electronics where sellerID='"+user.getUserID()+"'");
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getInt(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getDouble(5)%></td>
						<td><%=rs.getInt(6)%></td>
						<td><%=rs.getString(7)%></td>
						<td><%=rs.getString(8)%></td>
						<td><form action="updateStockVendor.jsp" class="normal">
						<input type="text" name="productID" value="<%=rs.getString(2)%>" style="display:none;">
						<button class="btn" type="submit" style="background: green;margin:5px;">Update</button>
						</form></td>



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
	</div>
<!-- ################################ -->
<div id="clothing">
		<div style="text-align: center;">
			<br>
			<h1>Clothing</h1>
			<br> <br>

		</div>
		<div class="table-responsive overflow-auto "
			style="height: 400px; overflow: auto;">


			<table class="table table-striped table-bordered"
				style="width: 90%; margin: 0 auto 0 auto">
				<thead class="thead-light"
					style="text-align: center; display: sticky;">
					<tr>

						<th class="header" scope="col">Sr.No.</th>
						<th class="header" scope="col">ProductID</th>
						<th class="header" scope="col">SubCategory</th>
						<th class="header" scope="col">Name</th>
						<th class="header" scope="col">Price</th>
						<th class="header" scope="col">Unit</th>
						<th class="header" scope="col">Qualities</th>
						<th class="header" scope="col">MFG</th>
						<th class="header" scope="col">Update</th>
					</tr>
				</thead>
				<tbody>
					<%
					try {
						Connection con = MyCon.dbcon("product");
						Statement st = con.createStatement();
						ResultSet rs = st.executeQuery("select * from clothing where sellerID='"+user.getUserID()+"'");
						while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getInt(1)%></td>
						<td><%=rs.getString(2)%></td>
						<td><%=rs.getString(3)%></td>
						<td><%=rs.getString(4)%></td>
						<td><%=rs.getDouble(5)%></td>
						<td><%=rs.getInt(6)%></td>
						<td><%=rs.getString(7)%></td>
						<td><%=rs.getString(8)%></td>
						<td><form action="updateStockVendor.jsp" class="normal">
						<input type="text" name="productID" value="<%=rs.getString(2)%>" style="display:none;">
						<button class="btn" type="submit" style="background: green;margin:5px;">Update</button>
						</form></td>



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
	</div>
	<%
	} catch (Exception e) {
	e.getMessage();
	}
	//##############################################
	%>
	<br> <br>
	
	<%@ include file="footer.jsp"%>
</body>
</html>