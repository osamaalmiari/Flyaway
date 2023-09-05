package com.flyaway;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Search extends HttpServlet {

	static String date, source, destination;
	static int nomberofpersons;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		response.setContentType("text/html");
		String Date_of_travel = request.getParameter("date_of_travel");
		String source_city = request.getParameter("source_city");
		String destination_city = request.getParameter("destination_city");
		int nomber_of_persons = Integer.parseInt(request.getParameter("nomber_of_persons"));

		PrintWriter out = response.getWriter();

		date = Date_of_travel;
		source = source_city;
		destination = destination_city;
		nomberofpersons = nomber_of_persons;

		ArrayList flights = search();
		out.print("<table border='2'>");
		out.print("<tr>");
		out.print("<th>airlinename</th>");
		out.print("<th>price($)</th>");
		out.print("<th>source city</th>");
		out.print("<th>destination city</th>");
		out.print("<th>date of travel</th>");
		out.print("<th>departure_time_from_source</th>");
		out.print("<th>arrival_time_to_destination</th>");
		out.print("<th>class</th>");
		out.print("<th>Fligh nomber</th>");
		out.print("</tr>");
		for (int counter = 0; counter < flights.size(); counter++) {

			out.print("<tr>");
			for (int i = 0; i < 8; i++) {

				out.print("<td>" + ((java.util.List) flights.get(counter)).get(i) + "</td>");

			}

			out.print("<td><a href='registerdetails.jsp?fly=" + ((java.util.List) flights.get(counter)).get(8) + "'>"
					+ ((java.util.List) flights.get(counter)).get(8) + "</a></td>");

			/* out.print("<h1>" + flights.get(counter) + "</h1>"); */
			out.print("</tr>");
		}
		out.print("</table>");

	}

	public ArrayList search() {
		ArrayList flights = new ArrayList();
		// JDBC URL, username and password of MySQL server
		final String url = "jdbc:mysql://localhost:3306/flyaway";
		final String user = "root";
		final String password = "root";

		// JDBC variables for opening and managing connection
		java.sql.Connection con = null;
		java.sql.Statement stmt = null;
		java.sql.ResultSet rs = null;

		String query1 = "select * from flightdetails";

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
				String date_of_travel = rs.getString(11);
				String source_city = rs.getString(4);
				String destination_city = rs.getString(5);
				int seats_availability = rs.getInt(10);

				if (date.equals(date_of_travel) && source.equals(source_city) && destination.equals(destination_city)
						&& nomberofpersons <= seats_availability) {
					ArrayList f = new ArrayList();

					String airlinename = rs.getString(1);
					int price = rs.getInt(2);

					String departure_time_from_source = rs.getString(6);
					String arrival_time_to_destination = rs.getString(7);
					String class_type = rs.getString(12);
					String flight_no = rs.getString(3);
					f.add(airlinename);
					f.add(price);
					f.add(source_city);
					f.add(destination_city);
					f.add(date_of_travel);
					f.add(departure_time_from_source);
					f.add(arrival_time_to_destination);
					f.add(class_type);
					f.add(flight_no);

					flights.add(f);

				}

			}
		} catch (SQLException sqlEx) {
			sqlEx.printStackTrace();
		} finally {
			// close connection ,stmt and resultset here
			try {
				con.close();
			} catch (SQLException se) {
				/* can't do anything */ }
			try {
				stmt.close();
			} catch (SQLException se) {
				/* can't do anything */ }
			try {
				rs.close();
			} catch (SQLException se) {
				/* can't do anything */ }
		}
		return flights;
	}
}
