<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Raleway&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Merriweather&family=Montserrat&family=Sacramento&display=swap"
	rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Login</title>
<style>
body {
	background-color: #F7ECDE;
}

.link {
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
	font-size: 15px;
	padding: 10px 10px 10px 10px;
	text-decoration: none;
}
form{font-family: 'Raleway', sans-serif;
}
h1{
font-family: 'Raleway', sans-serif;}
h2{
font-family: 'Raleway', sans-serif;}

.alert {
	background-color: #FF1E00;
}
.h1{
	font-family: 'Abril Fatface', cursive;
	font-size: 50px;
	text-decoration:none;
}
</style>
</head>
<body>
	<br>
	<div align="center" class=h1>
		<a href=WelcomePage.jsp>FlyAway</a>
	</div>
<hr>
	<br>
	<br>
	<div align="center">
		<h2>User Login</h2>
		<div
			style="border: 2px solid black; width: 25%; border-radius: 20px; padding: 20px"
			align="center">
			<form action=UserLogin method=post>
				<table>
					<tr>
						<td><label for=email>Email</label><br></td>
						<td><input type="email" name=email id=email /></td>
					</tr>
					<tr>
						<td><label for=pass>Password</label><br></td>
						<td><input type="password" name=password id=pass /></td>
					</tr>

					<tr>
						<td><input class=button type=submit value=submit /></td>
						<td><input class=button type=reset /></td>
					</tr>
				</table>

			</form>
		</div>
	</div>
	<br>
	<br>
	<div align="center"><i >New User-Create account</i>
	<h4>
		<a href=NewUser.jsp style="font-size: 25; color: red;">Create
			Account</a>
	</h4></div>
	

	<%
	String message = (String) session.getAttribute("message");
	if (message != null) {
	%>
	<p style="color: silver;"><%=message%></p>
	<%
	session.setAttribute("message", null);
	}
	%>
</body>
</html>
