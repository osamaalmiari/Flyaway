<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*,java.io.*, java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1 align="center">Ticket</h1>

	<%
		String fly = request.getParameter("fly");
		int fly_x = Integer.parseInt(fly);
		
		
	%>

	<%
		// JDBC URL, username and password of MySQL server
		final String url = "jdbc:mysql://localhost:3306/flyaway";
		final String user = "root";
		final String password = "root";

		// JDBC variables for opening and managing connection
		java.sql.Connection con = null;
		java.sql.Statement stmt = null;
		java.sql.ResultSet rs = null;

		String query1 = "select * from flightdetails where flight_no = " + fly + ";";

		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			// opening database connection to MySQL server
			con = DriverManager.getConnection(url, user, password);

			// getting Statement object to execute query
			stmt = con.createStatement();

			rs = stmt.executeQuery(query1);
			
			
			while (rs.next()) {

				String airline_name = rs.getString(1);
				String price = rs.getString(2);
				// session is created to send price to payment
				session.setAttribute("price", price);
				String departure_time_from_source = rs.getString("departure_time_from_source");
				String arrival_time_of_destination = rs.getString("arrival_time_of_destination");
				String class_type = rs.getString("class_type");
	%>
	<table border="2" width="100%">
		<tr>
			<th>airlinename</th>
			<th>price</th>
			<th>departure_time_from_source</th>
			<th>arrival_time_to_destination</th>
			<th>class</th>
		</tr>
		<tr>
			<td><%=airline_name%></td>
			<td><%=price%></td>
			<td><%=departure_time_from_source%></td>
			<td><%=arrival_time_of_destination%></td>
			<td><%=class_type%></td>
	
		</tr>


		<%
			}

			} catch (SQLException sqlEx) {
				sqlEx.printStackTrace();
			} finally {
				//close connection ,stmt and resultset here
				try {
					con.close();
				} catch (SQLException se) {
					/*can't do anything */ }
				try {
					stmt.close();
				} catch (SQLException se) {
					/*can't do anything */ }
				try {
					rs.close();
				} catch (SQLException se) {
					/*can't do anything */ }
			}
		
		%>



	</table>

	<hr>

	<h1 align="left">personal info</h1>
	<br>
	<form action="add_personal_info.jsp" method="post">
		Full Name:<input type="text" name="Full_Name" minlength="10"><br>
		<br> Address:<input type="text" name="Address" minlength="10"><br>
		<br> Age:<input type="text" name="Age"><br>
		<br> mobile:<input type="text" name="mobile" minlength="8"><br>
		<br> emailid_username:<input type="text" name="emailid_username"
			minlength="5"><br>
		<br> <select name="payment" id="cards">
			<option value="Addhar card">Addhar card</option>
			<option value="SSN">SSN</option>
			<option value="Passport">Passport</option>
			<option value="Voter ID">Voter ID</option>
			<option value="Driving license">Driving license</option>
			<input type="text" name="payment_type">
			<br>
		<br> country:
			<input type="text" name="country" minlength="3">
		<br>
		<br>




			<br>
			<button type="submit">Submit</button>
	</form>
	
	
</body>
</html>