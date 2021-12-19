<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.Connection" %>
	<%@page import="try1.User"%>
	<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="reg.Product"%>
<%@ page import="Connection.MyCon"%>
<%@ page import="java.util.LinkedList"%>
<%@ page import="openUsers.OpenUserMethods"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
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

	<!-- Cart Items Details -->
	<div class="small-container cart-page">
		<table>
			<tr>
				<th>Product Name</th>
				<th>Quantity</th>
				<th>Price</th>
				<th>Subtotal</th>
			</tr>
			<%
			try {
				LinkedList<Product> cartItems=new LinkedList<Product>();
				Connection con = MyCon.dbcon("user_activity");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from customer_activity where userID='"+user.getUserID()+"' and activityName='CARTED'");
				int i = 0;
				while (rs.next()) {
					String productID=rs.getString(7);
					Product product=OpenUserMethods.getProductDetails(productID);					
					cartItems.add(product);
				
			%>
				<tr>
				<td>
					<h3><%=product.getName() %></h3>					
					<h4><%=product.getMfg() %></h4>
					<h4>Qualities</h4> <br> 
					<a href="">Remove</a>
				</td>
				<td><input type="number" value="1"></td>
				<td><h3><%=product.getProductPrice() %></h3></td>
				<td>total-price</td>
			</tr>	
			<%
			}
				session.setAttribute("cartItems", cartItems);
			} catch (Exception e) {
			// TODO: handle exception
			out.print(e.getMessage());
			}%>


		</table>
		<div class="total-price">
			<table>
				<tr>
					<td>Subtotal</td>
					<td>$200</td>
				</tr>
				<tr>
					<td>Tax</td>
					<td>$200</td>
				</tr>
				<tr>
					<td>Total</td>
					<td>$200</td>
				</tr>
			</table>
			<form action="buyAll.jsp" method="post">
        <button class="btn" type="submit">Buy All</button>
      </form>
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