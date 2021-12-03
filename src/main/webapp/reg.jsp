<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Registration Page</title>
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


	<form action="ProductRegistration" method="post">
		Select the Product Category: 
  	<select id="selection" name ="category">
			<option selected >Category</option>
			<option value="Electronics">Electronics</option>
			<option value="Grocery">Grocery</option>
			<option value="Clothing">Clothing</option>
			
		</select> 
		<br> <br> 
		Enter the Product Sub Category: <input type="text" name="subCategory"> <br><br>
		Enter the Product name: <input type="text" name="productName"> <br><br>
		Enter the Product Price <input type="number" name="productPrice"> <br> <br>
		Enter the Product unit  <input type="number" name ="productUnit"><br><br>
		Enter the Product Qualities (Separated by comma(,)) <input type="text" name="productQualities"> <br> <br>
		Enter the Manufacturer Name with address: <input type="text" name="mfg"> <br><br>
		<button type="submit">Submit</button>
	</form>


</body>
</html>