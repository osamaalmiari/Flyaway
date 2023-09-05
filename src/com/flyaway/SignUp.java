package com.flyaway;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignUp extends HttpServlet {
	static String username;
	static String pass;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String Username = request.getParameter("username_signup");
		String Password = request.getParameter("password_signup");
		username = Username;
		pass = Password;
		SignUp ob = new SignUp();
		ob.signup();

		PrintWriter out = response.getWriter();
		out.print("<a href='login.jsp'>go to login</a>");
		out.print(" user name an password added");

	}

	public void signup() {

		// JDBC URL, username and password of MySQL server
		final String url = "jdbc:mysql://localhost:3306/flyaway";
		final String user = "root";
		final String password = "root";

		// JDBC variables for opening and managing connection
		java.sql.Connection con = null;
		java.sql.Statement stmt = null;
		java.sql.ResultSet rs = null;

		String query = "INSERT INTO flyaway.user_login (username, password) \n" + " VALUES ('" + username + "', '"
				+ pass + "');";

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

			// executing SELECT query
			int v = stmt.executeUpdate(query);
			if (v == 1) {
				System.out.println("Record is inserted");
			} else {
				System.out.println("Not inserted");
			}

		} catch (SQLException sqlEx) {
			// sqlEx.printStackTrace();
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
		}
	}

}
