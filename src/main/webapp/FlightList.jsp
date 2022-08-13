<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.*"%>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap"
	rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Flight List</title>
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
.alert{
background-color:#FF1E00;
}
</style>
</head>
<body>
	<br>
	<h1 href="WelcomPage.jsp" align="center"
		style="font-family: 'Abril Fatface', cursive;">FlyAway</h1>
	<br>
	<br>
	<%
	@SuppressWarnings("unchecked")
	HashMap<String, String> user = (HashMap<String, String>) session.getAttribute("user");
	if (user != null) {
	%>
	<p>
		Welcome
		<%=user.get("name")%></p>
	<a href="Logout">Logout</a>
	<%
	} else {
	%>
	<a href=UserPage.jsp>User Login</a>
	<%
	}
	%>
	<%
	@SuppressWarnings("unchecked")
	List<String[]> flights = (List<String[]>) session.getAttribute("flights");
	if (flights != null) {
	%>

	<h1 align="center">Available Flights</h1>

	<div align="center">
		<table border="1">
			<tr>
				<th>FlightID</th>
				<th>Name</th>
				<th>Time</th>
				<th>Price</th>
			</tr>



			<%
			for (String[] flight : flights) {
			%>

			<tr>
				<td><%=flight[3]%></td>
				<td><%=flight[0]%></td>
				<td><%=flight[1]%></td>
				<td><%=flight[2]%></td>
			</tr>


			<%
			}
			%>
		</table>
	</div>

	<%
	} else {
	%>
	<h1>There are no available flights</h1>
	<%
	}
	%>
	<div align="center">
		<form action="TicketGenerator">
			Enter Flight ID:<input type="number" name="fID">

			<button class=button>Book</button>
		</form>
	</div>
</body>
</html>