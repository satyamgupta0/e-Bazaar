<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
					<li><a href=""><u>Home</u> </a></li>
					<li><a href=""><u>Account</u></a></li>					
					<li><a href=""><u>History</u></a></li>
					<li><a href="#"><u>FeedBack</u></a></li>
					<li><a href="logout"><u>Logout</u></a></li>
				</ul>
			</nav>
			<a href="cart.jsp"><img src="images/cart.png" width="30px" height="30px" alt="" /> </a>
			 <img
				src="images/menu.png" class="menu-icon" alt=""
				onclick="menuToggle()" />
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
		</div>
	</div>
	</body>