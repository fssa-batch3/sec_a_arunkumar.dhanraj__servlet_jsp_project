<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.creckett.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>



<style>
.popup {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.7);
	z-index: 1000;
}

.popup-content {
	background-color: #fff;
	max-width: 357px;
	margin: 240px auto;
	padding: 22px;
	text-align: center;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
	position: relative;
}

.close-icon {
	position: absolute;
	top: 10px;
	right: 10px;
	color: red;
	cursor: pointer;
}

.btn {
	background-color: grey;
	padding: 6px;
	cursor: pointer;
}

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

.reg, .forgot {
	display: flex;
	justify-content: center;
}

.reg a {
	margin-left: 8px;
}

.forgot {
	margin-top: 10px;
	cursor: pointer;
}
</style>

</head>

<body>
	<jsp:include page="../Header/header.jsp"></jsp:include>


	<%
	String errorMessage = (String) request.getAttribute("errorMessage");
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

		<div id="popup" class="popup">
			<div class="popup-content">
				<span class="close-icon" onclick="closePopup()">&#10006;</span>
				<h2>Forgot Password?</h2>
				<p>Relax! Try to remember your password.</p>
				<button onclick="closePopup()" class="btn">Okay</button>
			</div>
		</div>

		<div class="login-form">
			<h1>Login Page</h1>
			<br>

			<form action="<%=request.getContextPath()%>/login" method="post">
				<label>Email: </label> <input type="email" name="email"
					placeholder="Enter email" autofocus="autofocus" required
					value="<%=email%>"> <br /> <label>Password: </label> <input
					type="password" name="password" placeholder="Enter password"
					required value="<%=password%>"> <br />
				<div class="reg">
					Don't have an account? <a href="Register.jsp" class="register">Register
						now</a>
				</div>

				<div class="forgot" onclick="openPopup()">
					<a> Forgot Password?</a>
				</div>
				<br />
				<button type="submit">Submit</button>
			</form>
		</div>
	</div>


    <script>
        function openPopup() {
            document.getElementById('popup').style.display = 'block';
        }

        function closePopup() {
            document.getElementById('popup').style.display = 'none';
        }
    </script>

</body>
</html>
