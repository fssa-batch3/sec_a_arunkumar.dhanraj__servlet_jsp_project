<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Host Turf</title>

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

	<jsp:include page="header.jsp"></jsp:include>

	<%
	String error = (String) request.getParameter("error");

	if (error != null) {
	%>

	<div class="alert alert-danger" role="alert">  <%=error %> </div>

	<%
	}
	%>




	<div class="turf_div">
		<h1>Create turf</h1>
	</div>





	<section>

		<form action="CreateTurfServlet">
			<div>
				<label class="label-profile">Image URL: </label> <input type="text"
					class="file-choose" id="file" required name="image"  autofocus="autofocus" required value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdgY_ynR9XTmt2YwcRGZM5C-ix9ubr7vhP7g&usqp=CAU"/>
			</div>
			<div>
				<label>Ground details:</label>
				<textarea id="details" cols="20" rows="1" required name="message" required>Cric Turf, Adyar, Chennai</textarea>
			</div>
			<div>
				<button type="submit" class="submit-btn">Submit</button>
			</div>
		</form>
	</section>



</body>
</html>