<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="try1.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
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
%>

Welcome .... Customer

<h1>Your Profile Details</h1><br><br>
Your Name: <%=user.getName() %>
<br><br><br>
Your Email: <%= user.getEmail() %><br><br>
Your Mob. No.: <%=user.getMobNumber() %><br><br>

<%
}
catch(Exception e){
	e.getMessage();
}
//##############################################
%>
<br><br><br><br>
<a href="#">Your Saved Items</a>
<br>
<a href="#">Your Previous logins</a>
<br>
<a href="#">Your Shopping History</a>
<br>


<form action="logout" >
<button type="submit">logout</button>
</form>
</body>
</html>