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
		String Full_Name = request.getParameter("Full_Name");
		String Address = request.getParameter("Address");
		String Age_x = request.getParameter("Age");
		int Age = Integer.parseInt(Age_x);
		String mobile_x = request.getParameter("mobile");
		int mobile = Integer.parseInt(mobile_x);
		String emailid_username = request.getParameter("emailid_username");
		String payment = request.getParameter("payment");
		String payment_type = request.getParameter("payment_type");
		String country = request.getParameter("country");
		
		session.setAttribute("Full_Name", Full_Name);
	%>
	
	<%
		// JDBC URL, username and password of MySQL server
		final String url = "jdbc:mysql://localhost:3306/flyaway";
		final String user = "root";
		final String password = "root";

		Connection con = null;
		PreparedStatement prSt = null;
		Statement stmt = null;

		String query = "insert into details_table values(?,?,?,?,?,?,?)";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, password);

			prSt = con.prepareStatement(query);

			prSt.setString(1, Full_Name);
			prSt.setString(2, Address);
			prSt.setInt(3, Age);
			prSt.setInt(4, mobile);
			prSt.setString(5, emailid_username);
			prSt.setString(6, payment + ": " + payment_type);
			prSt.setString(7, country);

			int count = prSt.executeUpdate();

			//show the number of records
			stmt = con.createStatement();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (prSt != null)
					prSt.close();
				if (con != null)
					con.close();
			} catch (Exception ex) {
			}
		}
	%>
	<h1>Flight was successfully added</h1><br><br>
	
	<h1>Passenger details</h1><br><br>
	
		<table border="6px" width="100%">
	  <tr>
	    <th>Full Name</th>
	    <th>Address</th>
	    <th>Age</th>
	    <th>mobile</th>
	    <th>emailid or username</th>
	    <th>payment</th>
	    <th>country</th>
	  </tr>
	  <tr>
	    <td><%= Full_Name%></td>
	    <td><%= Address%></td>
	    <td><%= Age_x%></td>
	    <td><%= mobile_x%></td>
	    <td><%= emailid_username%></td>
	    <td><%= payment + ": " + payment_type%></td>
	    <td><%= country%></td>
	    
	    
	  </tr>
	</table>

	<a href="payment.jsp">go to payment</a>
	<br>

</body>
</html>