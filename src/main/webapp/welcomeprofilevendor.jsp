<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="try1.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>e-Bazaar</title>
<link rel="stylesheet" href="css/styleindex.css" />
<%@ include file="headervendor.jsp" %> 
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

<div style="text-align: center;">
        <h1>Welcome! <%=user.getName() %></h1>
		<h3>Email Id : <%=user.getEmail() %></h3>
		<h3>UserID : <%=user.getUserID() %></h3>
		<h2>Recent Actions i.e. Prev Logins and other stuff</h2>
		<!-- Table -->
		<h2>Recent Sales</h2>
		<h2>Total Sales</h2>
		<h4>use update stock to add a new category</h4>
    </div>
<%
}
catch(Exception e){
	e.getMessage();
}
//##############################################
%>

<%@ include file="footer.jsp" %> 
</body>
</html>