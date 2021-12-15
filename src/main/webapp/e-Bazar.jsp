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
</head>
<body>
	<div class="container">
		<div class="navbar">
			<div class="logo">
				<img src="images/transparent e-bazaar.png" width="125px" alt="" />
			</div>
			<nav>
				<ul id="menu-items">
					<li><a href="">Home</a></li>
					<li><a href="">Products</a></li>
					<li><a href="">About</a></li>
					<li><a href="">Contact</a></li>
					<li><a href="">Account</a></li>
				</ul>
			</nav>
			<img src="images/cart.png" width="30px" height="30px" alt="" /> <img
				src="images/menu.png" class="menu-icon" alt=""
				onclick="menuToggle()" />
		</div>
	</div>
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
					<button type="submit">Add To Cart</button>
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






















	<!-- Footer -->
	<div class="footer">
		<div class="container">
			<div class="row">
				<div class="footer-col-1">
					<h3>Download Our App</h3>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Suscipit, quis?</p>
					<div class="app-logo">
						<img src="images/play-store.png" alt="" /> <img
							src="images/app-store.png" alt="" />
					</div>
				</div>
				<div class="footer-col-2">
					<img src="images/transparent e-bazaar.png" alt="" />
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Suscipit, quis?</p>
				</div>
				<div class="footer-col-3">
					<h3>Useful Links</h3>
					<ul>
						<li>Coupons</li>
						<li>Blog Post</li>
						<li>Return Policy</li>
						<li>Join Affialiate Marketing</li>
					</ul>
				</div>
				<div class="footer-col-4">
					<h3>Follow Us</h3>
					<ul>
						<li>FaceBook</li>
						<li>Twitter</li>
						<li>Instagram</li>
						<li>YouTube</li>
					</ul>
				</div>
			</div>
			<hr />
			<p class="copyright">Copyright 2020 - RedStore</p>
		</div>
	</div>
	<!-- Js for toggle menu -->
	<script>
		var menuItems = document.getElementById("menu-items");
		menuItems.style.maxHeight = "0px";
		function menuToggle() {
			if (menuItems.style.maxHeight == "0px") {
				menuItems.style.maxHeight = "200px";
			} else {
				menuItems.style.maxHeight = "0px";
			}
		}
	</script>
</body>
</html>
