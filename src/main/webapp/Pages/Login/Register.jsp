<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.creckett.model.User"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>



</head>

<style>
.registraion {
	margin-top: 20px;
	display: flex;
	flex-direction: column;;
	justify-content: center;
	align-items: center;
	gap: 10px;
}

.form {
	border: 1px solid;
	padding: 70px;
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 10px;
	width: 310px;
}

form {
	display: flex;
	flex-direction: column;
	justify-content: flex-start;
	gap: -6px;
}
</style>

<body>

<jsp:include page="../Header/header.jsp"></jsp:include>
	<div class="registraion">
		<h1>Registration</h1>

		<%
		String errorMessage = (String) request.getAttribute("errorMessage");


		if (errorMessage != null) {
		%>

		<div class="alert alert-danger" role="alert">
			<%=errorMessage%>
		</div>

		<%
		}

		User regUser = (User) request.getAttribute("regUser");

		String username = "";
		String email = "";
		String password = "";
		String phonenumber = "";

		if (regUser != null) {
		username = regUser.getName();
		email = regUser.getEmail();
		password = regUser.getPassword();
		phonenumber = regUser.getPhonenumber();
		}
		%>
		<div class="form">
			<form action="<%= request.getContextPath()%>/registration" method="post">

				<label>Username: </label> <input type="text" name="username"
					placeholder="Enter Username" autofocus="autofocus" required value="<%=username %>">
				<br /> <label>Email: </label> <input type="email" name="email"
					placeholder="Enter email" required value="<%=email %>"> <br /> <label>Password:
				</label> <input type="password" name="password" placeholder="Enter password"
					required value="<%= password%>"> <br /> <label>Phonenumber: </label> <input
					type="text" name="phonenumber" placeholder="Enter Phonenumber"
					required value="<%= phonenumber%>"> <br />


				<button type="submit">Submit</button>
			</form>
		</div>

	</div>


</body>
</html>