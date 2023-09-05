<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FlyAway</title>
</head>
<body>
	<div align="center">
		<b style="color: red; font-size: 50px;">FlyAway</b>
	</div>

	<h1 align="left">Sign IN</h1>
	<br>
	<form action="login" method="post">
		Email:<input type="text" name="username"><br> <br>
		password:<input type="password" name="password"><br> <br>
		<button type="submit">login</button>
	</form>

	<hr>
	<h1 align="left">Sign UP</h1>
	<br>
	<form action="signup" method="get">
		Email:<input type="text" name="username_signup" minlength="10"><br>
		<br> password:<input type="password" name="password_signup"
			minlength="10"><br> <br>
		<button type="submit">signup</button>
	</form>



</body>
</html>