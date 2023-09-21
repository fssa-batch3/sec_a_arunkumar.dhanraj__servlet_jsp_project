<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Turf</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">


<style>
body {
	margin: 0px;
	padding: 0px;
	font-family: "Alegreya", serif;
	font-size: 20px;
	height: 100vh;
}

.turf_div {
	display: flex;
	justify-content: center;
	font-family: "Alegreya", serif;
	position: relative;
	top: 10%;
}

section {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 80vh;
}

form {
	background-color: rgb(119, 170, 215);
	padding: 50px 40px 30px 40px;
	display: flex;
	flex-direction: column;
	gap: 20px;
	border-radius: 20px;
}

form div {
	display: flex;
	gap: 10px;
	justify-content: center;
}

.submit-btn {
	font-family: "Alegreya", serif;
	width: fit-content;
	padding: 5px 15px;
	font-size: 20px;
	border: 0px solid;
	border-radius: 4px;
	background-color: white;
	margin-top: 10px;
}

.submit-btn:hover {
	cursor: pointer;
	background-color: grey;
}
</style>

</head>
<body>



	<jsp:include page="../../Header/header.jsp"></jsp:include>



	<%
	String error = (String) request.getParameter("error");

	if (error != null) {
	%>

	<div class="alert alert-danger" role="alert">
		<%=error%>
	</div>

	<%
	}
	String id = (String) request.getParameter("id");
	%>
	<div class="turf_div">
		<h1>Update turf</h1>
	</div>
	
	<section>


		<form action="UpdateTurfServlet?id=<%=id%>" method="post">
			<div>
				<label class="label-profile">Image URL: </label> <input type="text"
					class="file-choose" id="file" required name="image"
					value="${updateTurf.image}" />
			</div>
			<div>
				<label>Ground details:</label>
				<textarea id="details" cols="20" rows="1" required name="message">${updateTurf.message}</textarea>
			</div>
			<div>
				<button type="submit" class="submit-btn">Update</button>
			</div>
		</form>
	</section>

</body>
</html>