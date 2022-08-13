<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap" rel="stylesheet">
<meta charset="ISO-8859-1">
<title>Register</title>
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
<body >
<br>
<h1 href="WelcomPage.jsp" align="center"style="font-family: 'Abril Fatface', cursive;">FlyAway</h1>
<br><br>
<div align="center">
<div style="border:3px solid black;width:25%;border-radius:20px;padding:20px" align="center">
<form action=UserRegistration method=post>
	<label for=email>Email :-</label> <input type="email" name=email id=email /><br><br>
	<label for=pass>Password :-</label> <input type="password" name=password id=pass /><br><br>
	<label for=name>Name :-</label> <input type="text" name=name id=name /><br><br>
	<label for=phno>Phone No. :-</label> <input type="text" name=phno id=phno /><br><br>
	<label for=adno>Aadhaar No. :-</label> <input type="text" name=adno id=adno /><br><br>
	<input class=button type=submit value=submit /> <input class=button type=reset />
</form>
</div>
</div>
</body>
</html>