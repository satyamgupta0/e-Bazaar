<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="try1.User" %>
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

<title>Product Registration Page</title>
<%@ include file="headervendor.jsp"%>
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

try{
	User user=(User) session.getAttribute("user");
	if (user==null) response.sendRedirect("login.html");
%>


	<div style="width:70%; margin: 0 auto 0 auto;">
	<form action="ProductRegistration" method="post">

		<div class="form-group">
			<label for="exampleInputEmail1">Select the Product Category:</label>
			<select id="selection" class="form-control" name="category">
				<option selected>Category</option>
				<option value="Electronics">Electronics</option>
				<option value="Grocery">Grocery</option>
				<option value="Clothing">Clothing</option>

			</select>

		</div>

		<div class="form-group">
			<label for="">Enter the Product Sub Category:</label> 
			<input type="text" class="form-control" name="subCategory"> 
		</div>

		<div class="form-group">
			<label for="">Enter the Product name: </label> <input type="text"
				class="form-control" name="productName">
		</div>
		<div class="form-group">
			<label for="">Enter the Product Price</label> <input type="number"
				class="form-control" name="productPrice">
		</div>
		<div class="form-group">
			<label for="">Enter the Product unit </label> <input type="number"
				class="form-control" name="productUnit">
		</div>
		<div class="form-group">
			<label for="">Enter the Product Qualities (Separated by
				comma(,)) </label> <input type="text" class="form-control"
				name="productQualities">
		</div>
		<div class="form-group">
			<label for="">Enter the Manufacturer Name with address: </label> <input
				type="text" class="form-control" name="mfg">

		</div>
				<input type="text" name="sellerID" value="<%=user.getUserID()%>" style="display:none;">
		
		
		<button type="submit" class="btn">Submit</button>

	</form>
	
	</div>
<%
}
catch(Exception e){
	e.getMessage();
}
//##############################################
%>
	<%@ include file="footer.jsp"%>
</body>
</html>