<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.creckett.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>

<style>

.navbar.custom-navbar-bg {
    background-color:  #00A86B !important;
   
}
.navbar-brand{
font-size: 24px !important;
}
a{
color:black !important;
}
.nav-item{
 
 font-size: 18px !important;
}

</style>

</head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<body>

	<nav
		class="navbar custom-navbar-bg bg-dark navbar-expand-lg bg-body-tertiary"
		data-bs-theme="dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp">Creckett</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">


					<%
					User loggedUser = (User) session.getAttribute("loggedUser");
					if (loggedUser == null) {
					%>
					<li class="nav-item"><a class="nav-link" href="login.jsp">Login</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="registration.jsp">Register</a></li>
					<%
					} else {
					%>

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="home.jsp">Home</a></li>

					<li class="nav-item"><a class="nav-link" href="profile.jsp"><%=loggedUser.getName()%></a>

					</li>
					<li class="nav-item"><a class="nav-link" href="LogoutServlet">Logout</a>

					</li>

					<%
					}
					%>
				</ul>

			</div>
		</div>
	</nav>

</body>
</html>