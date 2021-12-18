<%@page import="try1.User"%>
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
<%@ include file="headercustomer.jsp"%>
<style>
#snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  bottom: 30px;
  font-size: 17px;
}

#snackbar.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;} 
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;} 
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}
</style>
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

	try {
		User user = (User) session.getAttribute("user");
	%>

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
				while (rs.next() && i < 12) {
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
				<iframe name="dummyFrame" id="dummyFrame" style="display: none;">
				</iframe>
				<form action="cartactions" target="dummyFrame">
					<input type="text" name="productID" value="<%=rs.getString(2)%>"
						hidden>					
						<button style="cursor: pointer;" class="btn" type="submit" onclick="myFunction()">Add To
						Cart</button>
					<br>
					<h3 id="toast" style="display: none;">Added to cart</h3>
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
				while (rs.next() && i < 12) {
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
				<iframe name="dummyFrame" id="dummyFrame" style="display: none;">
				</iframe>
				<form action="cartactions" target="dummyFrame">
					<input type="text" name="productID" value="<%=rs.getString(2)%>"
						hidden>					
						<button style="cursor: pointer;" class="btn" type="submit" onclick="myFunction()">Add To
						Cart</button>
					<br>
					<h3 id="toast" style="display: none;">Added to cart</h3>
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
				while (rs.next() && i < 12) {
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
				<iframe name="dummyFrame" id="dummyFrame" style="display: none;">
				</iframe>
				<form action="cartactions" target="dummyFrame">
					<input type="text" name="productID" value="<%=rs.getString(2)%>"
						hidden>					
						<button style="cursor: pointer;" class="btn" type="submit" onclick="myFunction()">Add To
						Cart</button>
					<br>
					<h3 id="toast" style="display: none;">Added to cart</h3>
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
		<div id="snackbar">Product Added to cart</div>
	</div>
	<%
	} catch (Exception e) {
	e.getMessage();
	}
	//##############################################
	%>
	
	<script>
function myFunction() {
  var x = document.getElementById("snackbar");
  x.className = "show";
  setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
}
</script>

	<%@ include file="footer.jsp"%>
</body>
</html>
