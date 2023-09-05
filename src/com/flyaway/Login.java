package com.flyaway;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {
	static String username;
	static String pass;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String Username = request.getParameter("username");
		String Password = request.getParameter("password");
		username = Username;
		pass = Password;

		response.setContentType("text/html");

		if (access().equals("accept")) {
			RequestDispatcher rd = request.getRequestDispatcher("search.jsp");
			rd.forward(request, response);

		} else if (admin().equals("accept")) {

			RequestDispatcher rd = request.getRequestDispatcher("sessionhandling.jsp");
			rd.forward(request, response);
		} else {
			PrintWriter out = response.getWriter();
			out.print(" invalid user name and pass  <br>");
			out.print("<a href='login.jsp'>return to login page</a>");

		}

	}

	public String access() {
		String access = "deny";
		// JDBC URL, username and password of MySQL server
		final String url = "jdbc:mysql://localhost:3306/flyaway";
		final String user = "root";
		final String password = "root";

		// JDBC variables for opening and managing connection
		java.sql.Connection con = null;
		java.sql.Statement stmt = null;
		java.sql.ResultSet rs = null;

		String query1 = "select * from user_login";

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
				String username_db = rs.getString(1);
				String password_db = rs.getString(2);
				if (username_db.equals(username) && password_db.equals(pass)) {
					access = "accept";
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
		return access;
	}

	public String admin() {
		String admin_access = "deny";
		// JDBC URL, username and password of MySQL server
		final String url = "jdbc:mysql://localhost:3306/flyaway";
		final String user = "root";
		final String password = "root";

		// JDBC variables for opening and managing connection
		java.sql.Connection con = null;
		java.sql.Statement stmt = null;
		java.sql.ResultSet rs = null;

		String query1 = "select * from admin_login";

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
				String username_db = rs.getString(1);
				String password_db = rs.getString(2);
				if (username_db.equals(username) && password_db.equals(pass)) {
					admin_access = "accept";
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
		return admin_access;
	}

}
