<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Creckett</title>

<style>
div {
	display: flex;
	justify-content: center;
	align-items: center;
}

.logged_user {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.features {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div>
		<h1>Welcome to Creckett Home Page</h1>

	</div>
	

	<div class="logged_user">

		<p>Name: ${sessionScope.loggedUser.name}</p>
		<p>Email: ${sessionScope.loggedUser.email}</p>
		<p>Phone number: ${sessionScope.loggedUser.phonenumber}</p>
		<p>
			<a href="GetAllUserServlet">All users List</a>
		</p>

		<p>
			<a href="LogoutServlet">logout</a>
		</p>


	</div>

	<br>

	<div class="features">
		<h2>Turf Feature</h2>
		<br>

		<p>
			<a href="createTurf.jsp">Create turf</a>
		</p>

		<p>
			<a href="ListTurfsList">Turf List</a>
		</p>

	</div>
</body>
</html>