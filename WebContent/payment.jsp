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

	<img align="center" width="80%" height="50%" alt=""
		src="https://www.formget.com/wp-content/uploads/2018/08/paypal-advance-payment-payment-gateway-php-script.jpg">
	<br>
	<h1></h1>
	<img alt=""
		src="data:image/png;base64,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">
	<br>
	<%
		String price =session.getAttribute("price").toString();
		
	%>
	<h1><%= "Ticket price is " + price + "$" %></h1>
	<h1>
		<a href="Confirmation.jsp">Done</a>
	</h1>
</body>
</html>