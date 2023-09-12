<%@ page import="com.fssa.creckett.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">


<style>
.form-div {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	gap: 15px;
	height: 82vh;
	margin: 0;
}

form {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	gap: -6px;
}

h1 {
	text-align: center;
	padding-bottom: -200px;
}

.login-form {
	border: 1px solid;
	width: 310px;
	padding: 20px;
}
</style>

</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>


	<%
	String errorMessage = request.getParameter("errorMessage");
	%>

	<div class="form-div">
		<%
		if (errorMessage != null) {
		%>

		<div class="alert alert-danger" role="alert">
			<%=errorMessage%>
		</div>

		<%
		}

		User logUser = (User) request.getAttribute("logUser");

		String email = "muthu@gmail.com";
		String password = "Arun@2022";

		if (logUser != null) {
		email = logUser.getEmail();
		password = logUser.getPassword();
		}
		%>
		<div class="login-form">
			<h1>Login Page</h1>
			<br>

			<form action="login" method="post">
				<label>Email: </label> <input type="email" name="email"
					placeholder="Enter email" autofocus="autofocus" required
					value="<%=email%>"> <br /> <label>Password: </label> <input
					type="password" name="password" placeholder="Enter password"
					required value="<%=password%>"> <br />
				<div>
					Don't have an account? <a href="registration.jsp" class="register">Register
						now</a>
				</div>
				<br />
				<button type="submit">Submit</button>
			</form>
		</div>
	</div>

</body>
</html>
