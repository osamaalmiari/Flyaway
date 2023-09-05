<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.util.*,java.io.*, java.sql.*, com.mysql.jdbc.Driver"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String airline_name = request.getParameter("airline_name");
	String price_x = request.getParameter("price");
	int price = Integer.parseInt(price_x);
	String flight_no_x = request.getParameter("flight_no");
	int flight_no = Integer.parseInt(flight_no_x);
	String source_city = request.getParameter("source_city");
	String destination_city = request.getParameter("destination_city");
	String departure_time_from_source = request.getParameter("departure_time_from_source");
	String arrival_time_of_destination = request.getParameter("arrival_time_of_destination");
	String total_seats_x = request.getParameter("total_seats");
	int total_seats = Integer.parseInt(total_seats_x);
	String date_of_travel = request.getParameter("date_of_travel");
	String class_type = request.getParameter("class_type");
	%>
	
	<%

	// JDBC URL, username and password of MySQL server
    final String url = "jdbc:mysql://localhost:3306/flyaway";
    final String user = "root";
    final String password = "root";
    
    Connection con = null;
    PreparedStatement prSt = null;
    Statement stmt = null;
	
	
		
		
   	
	String query = "insert into flightdetails values(?,?,?,?,?,?,?,?,?,?,?,?)";
	
      try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, password);
           
            prSt = con.prepareStatement(query);
            
          
           prSt.setString(1, airline_name);
           prSt.setInt(2, price);
           prSt.setInt(3, flight_no);
           prSt.setString(4, source_city   );
           prSt.setString(5, destination_city  );
           prSt.setString(6, departure_time_from_source);
           prSt.setString(7, arrival_time_of_destination);
           prSt.setInt(8, total_seats);
           prSt.setInt(9, 0);
           prSt.setInt(10, total_seats);
           prSt.setString(11, date_of_travel);
           prSt.setString(12, class_type);
          
          
            
            int count = prSt.executeUpdate();
            
            //show the number of records
            stmt = con.createStatement();
            
           
            
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally{
            try{
                if(prSt != null) prSt.close();
                if(con != null) con.close();
            } catch(Exception ex){}
        }


	%>
	<h1>Flight was successfully added</h1>
	<a href="add_flight.jsp">add more flights</a><br>
	<a href="sessionhandling.jsp">back to main page</a>
</body>
</html>