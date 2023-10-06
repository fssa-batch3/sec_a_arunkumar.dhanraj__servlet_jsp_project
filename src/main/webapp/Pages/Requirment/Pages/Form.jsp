<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.creckett.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Form</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Pages/Requirment/Pages/Assests/Css/Form.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Alegreya&family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Alegreya:wght@400;700&family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />
</head>
<body>
	<%
	User user = (User) session.getAttribute("loggedUser");
	String error = (String) request.getAttribute("error");
	String message = (String) request.getAttribute("message");
	%>
	<section id="sec-2">
		<div class="form-div">



			<form id="form"
				action="<%=request.getContextPath()%>/PostRequirement">
				<%
				if (error != null)
					out.println("<h5 style=\"color: red;\">" + error + "</h5>");
				%>
				<label for="name">Name:</label> <input type="text" id="fname"
					name="name" placeholder="Arunkumar" disabled
					value="<%=user.getName()%>" /> <label for="textarea">Looking
					for:</label> <input id="text"
					placeholder="Ex: I am looking for team to join as...."
					name="message" value="<%=message != null ? message : ""%>" />
				<!-- <textarea form="usrform" >
</textarea> -->
				<button type="submit">Post now</button>
			</form>
		</div>
	</section>
</body>
</html>