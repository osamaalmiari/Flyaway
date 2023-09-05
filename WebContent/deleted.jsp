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
	<%
		String flight_no_x = request.getParameter("flight_no");
		int flight_no = Integer.parseInt(flight_no_x);

		final String url = "jdbc:mysql://localhost:3306/flyaway";
		final String user = "root";
		final String password = "root";

		Connection con = null;
		PreparedStatement prSt;
		Statement stmt;

		String sqlUpdate = "DELETE from flightdetails where flight_no=?";

		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			prSt = con.prepareStatement(sqlUpdate);

			// Take user input for insertion

			prSt.setInt(1, flight_no);
			prSt.executeUpdate();

			System.out.println("Record deleted successfully");
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
	%>

	<h1>flight was deleted successfully</h1>
	<br>
	<br>
	<h1>
		<a href="delete_flight.jsp">delete more flights</a>
	</h1>
	<br>
	<h1>
		<a href="sessionhandling.jsp">back to main page</a>
	</h1>
</body>
</html>