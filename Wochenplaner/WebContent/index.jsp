<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,400italic,700,700italic,300italic'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="style.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Wochenplaner - Startseite</title>
</head>
<body>
	<h1>Wilkommen!</h1>
	<br />
	<h2>Login:</h2>
	<form action="hello.jsp" method="post">
		E-Mail : <input type="text" name="email"></input> Passwort: <input
			type="password" name="pw"></input> <input type="submit" name="submit"
			value="OK" />
	</form>

	<br />
		
	<input type="button" onclick="window.location='registration.jsp'"
		value="Hier gehts zur Registrierung" />


</body>
</html>