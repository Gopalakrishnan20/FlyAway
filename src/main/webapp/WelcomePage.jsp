<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Merriweather&family=Montserrat&family=Sacramento&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
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
.alert{
background-color:#FF1E00;
}
.text{

}
</style>
</head>
<body>
	<h1 align="center" style="font-family: 'Abril Fatface', cursive;">FlyAway</h1>
	<hr>
	<div align="right" class="link">
		<a href="AdminPage.jsp">Admin Login</a>
	</div>

	<%
	@SuppressWarnings("unchecked")
	HashMap<String, String> user = (HashMap<String, String>) session.getAttribute("user");
	if (user != null) {
	%>
	<p>
		Welcome
		<%=user.get("name")%></p>
		<span class="material-symbols-outlined">
logout
</span>
	<a href="Logout">Logout</a>
	<%
	} else {
	%>
	<span class="material-symbols-outlined">
login
</span>
	<a class="link" href=UserPage.jsp>User Login</a>
	<div class="alert">
		<p>Not Yet Logged in!!</p>
	</div>

	<%
	}
	%>
	<br>
	<br>
	<div align="center">
		<div
			style=" width: 25%; border-radius: 20px; padding: 20px; background-color: #9ED2C6"
			align="center">
			<form action=FlightList method=post>
				<label for=from>From :-</label> <input type=text name=from id=from /><br>
				<br> <label for=to>To :-</label> <input type=text name=to id=to /><br>
				<br> <label for=departure>Departure :-</label> <input type=date
					name=departure id=departure /><br> <br> <label
					for=travellers>Travellers :-</label> <input type=number
					name=travellers id=travellers /><br> <br> <input
					class="button" type=submit value=Search /> <input class="button"type=reset />
			</form>
		</div>
	</div>
</body>
</html>
