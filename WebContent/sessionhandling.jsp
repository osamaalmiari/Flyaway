<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1 align="left">Change password</h1>
	<br>
	<form action="changepassword" method="post">
		old password:<input type="text" name="old_password"><br>
		<br> new password:<input type="password" name="new_password"><br>
		<br> confirm password:<input type="password"
			name="confirm_password"><br>
		<br>
		<button type="submit">change password</button>
	</form>
	<br>
	
	<h1>
		<a href="add_flight.jsp">add flight</a>
	</h1>
	<br>
	<h1>
		<a href="delete_flight.jsp">delete flight</a>
	</h1>
	<br>


</body>
</html>