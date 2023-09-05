package com.flyaway;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangePassword extends HttpServlet {
	String new_Password;
	String Username;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String old_password = request.getParameter("old_password");
		String new_password = request.getParameter("new_password");
		String confirm_password = request.getParameter("confirm_password");

		Username = Login.username;

		new_Password = new_password;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		if (old_password.equals(Login.pass)) {
			if (new_password.equals(confirm_password)) {
				if (new_password.equals(old_password)) {
					out.println("you can't use old password");
					out.println("<a href='sessionhandling.jsp'>go back to session handling page</a>");
				} else {
					changepass();
					out.print("password was changed successfully <br>");
					out.print("<a href='login.jsp'>Login page</a>");
				}
			} else {
				out.println("passwords don't match");
				out.println("<a href='sessionhandling.jsp'>go back to session handling page</a>");
			}
		} else {
			out.println("Old password is wrong");
			out.println("<a href='sessionhandling.jsp'>go back to session handling page</a>");
		}

	}

	public void changepass() {

		// JDBC URL, username and password of MySQL server
		final String url = "jdbc:mysql://localhost:3306/flyaway";
		final String user = "root";
		final String password = "root";

		// JDBC variables for opening and managing connection
		java.sql.Connection con = null;
		java.sql.PreparedStatement stmt = null;
		java.sql.ResultSet rs = null;

		String sqlUpdate = "UPDATE admin_login SET password = ? WHERE username = ?";

		try {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			stmt = con.prepareStatement(sqlUpdate);

			stmt.setString(1, new_Password);
			stmt.setString(2, Username);

			int rowAffected = stmt.executeUpdate();
			System.out.println(String.format("Row affected %d", rowAffected));

			rowAffected = stmt.executeUpdate();
			System.out.println(String.format("Row affected %d", rowAffected));

		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
	}

}