<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>

<style>
.registraion{

	display: flex;
	flex-direction:column;;
	justify-content: center;
	align-items: center; 
	gap:40px;
}
.form {
	border: 1px solid;
	width: 300px;
	padding: 70px;
	display: flex;
	justify-content: center;
	align-items: center;
	gap:10px;
}
</style>

<body>

	<jsp:include page="header.jsp"></jsp:include>
	<div class="registraion">
	<br>
		<h1>Registration</h1>

		<%
		String errorMessage = request.getParameter("errorMessage");
		if (errorMessage != null) {
			out.println("<p>" + errorMessage + "</p>");
		}
		%>
		<div class="form">
			<form action="registration" method="post">
				<label>Username: </label> <input type="text" name="username"
					placeholder="Enter Username" value="Ajmal"> <br /> <label>Email:
				</label> <input type="email" name="email" placeholder="Enter email" value="ajmal@gmail.com">
				<br /> <label>Password: </label> <input type="password"
					name="password" placeholder="Enter password" value="Arun@2022"> <br /> <label>Phonenumber:
				</label> <input type="text" name="phonenumber"
					placeholder="Enter Phonenumber" value="6385102548"> <br />
				<button type="submit">Submit</button>
			</form>
		</div>

	</div>


</body>
</html>