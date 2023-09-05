<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1 align="left">add flight</h1>
	<br>
	<form action="added.jsp" method="post">
		airline_name:<input type="text" name="airline_name"><br>
		<br> price:<input type="text" name="price"><br>
		<br> flight_no:<input type="text" name="flight_no"><br>
		<br> source_city:<input type="text" name="source_city"><br>
		<br> destination_city:<input type="text" name="destination_city"><br>
		<br> departure_time_from_source:<input type="text"
			name="departure_time_from_source"><br>
		<br> arrival_time_of_destination:<input type="text"
			name="arrival_time_of_destination"><br>
		<br> total_seats:<input type="text" name="total_seats"><br>
		<br> date_of_travel:<input type="text" name="date_of_travel"><br>
		<br> class_type:<input type="text" name="class_type"><br>
		<br>
		<button type="submit">add flight</button>
	</form>
</body>
</html>