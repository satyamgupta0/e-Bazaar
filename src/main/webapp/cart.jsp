<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<%@ include file="header.jsp"%>
<body>


	<!-- Cart Items Details -->
	<div class="small-container cart-page">
		<table>
			<tr>
				<th>Product</th>
				<th>Quantity</th>
				<th>Subtotal</th>
			</tr>
			<tr>
				<td>
					<div class="cart-info">
						<img src="images/buy-1.jpg" alt="">
						<div>
							<p>Red Printed T-shirt</p>
							<small>$30</small> <br> <a href="">Remove</a>
						</div>
					</div>
				</td>
				<td><input type="number" value="1"></td>
				<td>$50.0</td>
			</tr>

			<tr>
				<td>
					<div class="cart-info">
						<img src="images/buy-1.jpg" alt="">
						<div>
							<p>Red Printed T-shirt</p>
							<small>$30</small> <br> <a href="">Remove</a>
						</div>
					</div>
				</td>
				<td><input type="number" value="1"></td>
				<td>$50.0</td>
			</tr>

			<tr>
				<td>
					<div class="cart-info">
						<img src="images/buy-1.jpg" alt="">
						<div>
							<p>Red Printed T-shirt</p>
							<small>$30</small> <br> <a href="">Remove</a>
						</div>
					</div>
				</td>
				<td><input type="number" value="1"></td>
				<td>$50.0</td>
			</tr>

			<tr>
				<td>
					<div class="cart-info">
						<img src="images/buy-1.jpg" alt="">
						<div>
							<p>Red Printed T-shirt</p>
							<small>$30</small> <br> <a href="">Remove</a>
						</div>
					</div>
				</td>
				<td><input type="number" value="1"></td>
				<td>$50.0</td>
			</tr>


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
		</div>
	</div>

	<%@ include file="footer.jsp"%>
</body>
</html>