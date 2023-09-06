<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Declaration</title>
</head>
<body>

<!-- This is how you write comments in JSP -->
	
	<!--  Example of JSP Declaration -->
	<%!public String getMessage() {
		return "Success";
	}%>
	
	<!--  Example of Scriptlet -->
	<%
	String message = "Success";
	%>
	
	<!-- Expressions -->
	<%=message%>
	<%=getMessage()%>

	<%!int count = 0; // declaring a variable

	public int incrementCount() { // declaring a method
		return count++;
	}%>

	The current count is:<%=incrementCount()%>
	
	

</body>
</html>