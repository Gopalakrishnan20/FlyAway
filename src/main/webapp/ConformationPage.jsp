<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap"
	rel="stylesheet">
<meta charset="ISO-8859-1">
<title>FlyAway</title>
<style>
body {
	background-color: #F7ECDE;
}

a {
	color: #11999E;
	font-family: 'Montserrat', sans-serif;
	margin: 10px 20px;
	text-decoration: none;
	cursor: pointer;
}

.button {
	background: #11cdd4;
	background-image: -webkit-linear-gradient(top, #11cdd4, #11999e);
	background-image: -moz-linear-gradient(top, #11cdd4, #11999e);
	background-image: -ms-linear-gradient(top, #11cdd4, #11999e);
	background-image: -o-linear-gradient(top, #11cdd4, #11999e);
	background-image: linear-gradient(to bottom, #11cdd4, #11999e);
	-webkit-border-radius: 8;
	-moz-border-radius: 8;
	border-radius: 8px;
	font-family: 'Montserrat', sans-serif;
	color: #ffffff;
	font-size: 20px;
	padding: 10px 20px 10px 20px;
	text-decoration: none;
}

.alert {
	background-color: #FF1E00;
}
</style>
</head>
<body>
	<br>
	<h1 align="center" style="font-family: 'Abril Fatface', cursive;">FlyAway</h1>
	<hr>
	<br>
	<br>

	<%
	@SuppressWarnings("unchecked")
	HashMap<String, String> user = (HashMap<String, String>) session.getAttribute("user");
	if (user == null) {
		response.sendRedirect("UserPage.jsp");
	}
	%>
	<%List<String[]> flights = (List<String[]>) session.getAttribute("ticket"); %>

	<p align="center"
		style="color: green; font-size: 40px; font-weight: bold">Flight
		Booked Successfully</p>
	<h2 align="center">Your Ticket Details</h2>
	<div align="center">
		<table border=1>
			<tr>
				<th>Username</th>
				<th>Airline</th>
				<th>From</th>
				<th>To</th>
				<th>Date</th>
				<th>Time</th>
				<th>Status</th>	
				<th>Travellers</th>
				<th>Paid Amount</th>	
			</tr>
			<%
			for (String[] flight : flights) {
			%>

			<tr>
				<td><%=user.get("name")%></td>
				<td><%=flight[1]%></td>
				<td><%=flight[2]%></td>
				<td><%=flight[3]%></td>
				<td><%=flight[4]%></td>
				<td><%=flight[5]%></td>
				<td>BOOKED</td>
				<td><%=flight[7]%></td>
				<td><%=flight[6]%></td>
			</tr>


			<%
			}
			%>
		</table>
	</div>
</body>
</html>
