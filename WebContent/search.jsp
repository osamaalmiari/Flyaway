<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1 align="left">flightdetails</h1>
	<br>
	<form action="flight_details" method="post">
		Date of travel:<input type="text" name="date_of_travel"><br>
		<br> source city:<input type="text" name="source_city"
			minlength="3"><br>
		<br> destination city:<input type="text" name="destination_city"
			minlength="3"><br>
		<br> nomber of persons:<input type="text"
			name="nomber_of_persons"><br>
		<br>
		<button type="submit">Search</button>
	</form>



</body>
</html>