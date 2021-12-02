<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Category</title>
</head>
<body>

<h1> Here you can add a new category, and a DB table related to entered category will be created</h1>
<form action="addNewCategory">
Enter the Category Name: <input type="text" name="categoryName">
<br> <br>
<button type="submit">Create Category</button>
</form>
</body>
</html>