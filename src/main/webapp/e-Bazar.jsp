<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@ page import="Connection.MyCon"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>e-Bazaar</title>
<link rel="stylesheet" href="css/styleindex.css" />
<%@ include file="headercustomer.jsp" %> 
</head>
<body>
	
 
	<!-- Featured Product -->
	<div class="small-container">
		<h2 class="title">Clothing</h2>
		<div class="row">

			<%
			try {
				Connection con = MyCon.dbcon("product");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from clothing");
				int i = 0;
				while (rs.next() && i < 10) {
			%>



			<div class="col-4">
				<img src="images/product-1.jpg" alt="" />
				<h4><%=rs.getString(4)%></h4>
				<div class="ratings">
					<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star-o"></i>
				</div>


				<p>
					$<%=rs.getDouble(5)%></p>
				<p><%=rs.getString(7)%>
				</p>
				<p><%=rs.getString(8)%></p>
				<p>
					Product ID :<%=rs.getString(2)%></p>
					<!-- ***********************Add to Cart Button*********************** -->
					<form action="/cartactions">
					<input type="text" name="productID" value="<%=rs.getString(2) %>" hidden>
					<button class = "btn" type="submit">Add To Cart</button> 
					</form>
			</div>
			<%
			i++;
			}
			} catch (Exception e) {
			// TODO: handle exception
			out.print(e.getMessage());
			}
			%>
		</div>
	</div>



	<!-- Electronics Items -->

	<!-- Featured Product -->
	<div class="small-container">
		<h2 class="title">Electronics</h2>
		<div class="row">

			<%
			try {
				Connection con = MyCon.dbcon("product");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from electronics");
				int i = 0;
				while (rs.next() && i < 10) {
			%>



			<div class="col-4">
				<img src="images/product-1.jpg" alt="" />
				<h4><%=rs.getString(4)%></h4>
				<div class="ratings">
					<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star-o"></i>
				</div>


				<p>
					$<%=rs.getDouble(5)%></p>
				<p><%=rs.getString(7)%>
				</p>
				<p><%=rs.getString(8)%></p>
				<p>
					Product ID :<%=rs.getString(2)%></p>
					<!-- ***********************Add to Cart Button*********************** -->
					<form action="/cartactions">
					<input type="text" name="productID" value="<%=rs.getString(2) %>" hidden>
					<button class = "btn" type="submit">Add To Cart</button> 
					</form>
			</div>
			<%
			i++;
			}
			} catch (Exception e) {
			// TODO: handle exception
			out.print(e.getMessage());
			}
			%>
		</div>
	</div>




	<!-- Featured Product -->
	<div class="small-container">
		<h2 class="title">Grocery</h2>
		<div class="row">

			<%
			try {
				Connection con = MyCon.dbcon("product");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from grocery");
				int i = 0;
				while (rs.next() && i < 10) {
			%>



			<div class="col-4">
				<img src="images/product-1.jpg" alt="" />
				<h4><%=rs.getString(4)%></h4>
				<div class="ratings">
					<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star"></i> <i class="fa fa-star"></i> <i
						class="fa fa-star-o"></i>
				</div>


				<p>
					$<%=rs.getDouble(5)%></p>
				<p><%=rs.getString(7)%>
				</p>
				<p><%=rs.getString(8)%></p>
				<p>
					Product ID :<%=rs.getString(2)%></p>
					<!-- ***********************Add to Cart Button*********************** -->
					<form action="/cartactions">
					<input type="text" name="productID" value="<%=rs.getString(2) %>" hidden>
					<button class = "btn" type="submit">Add To Cart</button> 
					</form>
			</div>
			<%
			i++;
			}
			} catch (Exception e) {
			// TODO: handle exception
			out.print(e.getMessage());
			}
			%>
		</div>
	</div>

 <%@ include file="footer.jsp" %> 
</body>
</html>
