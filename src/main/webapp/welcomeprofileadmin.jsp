<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
</head>
<%@ include file="header.jsp" %> 
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
<h1>Welcome Admin</h1>
<br>
<a href="userslistforadmin.jsp">View the registered users</a><br>
	<a href="#">Block a User</a><br>
	<a href="#">See feedbacks</a><br>
	<a href="#">Add a Product Category</a><br>
	<a href="#">View sales record </a><br>
	<a href="#">Dispatch payment to vendors (optional)
	</a><br>
	<a href="#"></a><br>
	
	<form action="logout" >
<button type="submit">logout</button>
</form>
	
<%@ include file="footer.jsp" %> 
</body>
</html>