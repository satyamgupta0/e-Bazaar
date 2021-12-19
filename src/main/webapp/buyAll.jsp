<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.Connection" %>
	<%@page import="try1.User"%>
	<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="reg.Product"%>
<%@ page import="Connection.MyCon"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="openUsers.OpenUserMethods"%>
<%@ page import="openUsers.MyCartFunctions"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ include file="headercustomer.jsp"%>
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
<h1>
  The successful operations are in Green and failed ones are in Red.
</h1>
<%
@SuppressWarnings("unchecked") 
LinkedList<Product> cartItems=(LinkedList<Product>) session.getAttribute("cartItems");
MyCartFunctions mn= new MyCartFunctions();
for(int i=0; i<cartItems.size();i++){
	out.println("________________________________________________________"+"<br><br>");
	out.println("for Item : "+cartItems.get(i).getName()+" With ProductID: "+cartItems.get(i).getProductID()+"<br>");
	out.println(mn.buyProduct(user, cartItems.get(i).getProductID(),1)+"<br>");
	out.println("========================================================="+"<br><br>");
}


%>

<h1>Thank You For shopping with us.</h1>
      </div>
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