<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.creckett.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Header</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/Assests/Css/header.css" />

<link
	href="https://fonts.googleapis.com/css2?family=Alegreya:wght@400;700&family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />

</head>
<body>

	<header>
		<a href="<%=request.getContextPath()%>/index.jsp">
			<div class="logo-div">
				<img class="logo-pic"
					src="<%=request.getContextPath()%>/Assests/Images/Ball-new.jpg"
					alt="Ball" />
				<p class="logo-name">Creckett</p>
			</div>
		</a>
		<nav class="nav-links">
			<a href="<%=request.getContextPath()%>/index.jsp#home"
				class="nav-list">Home</a> <a
				href="<%=request.getContextPath()%>/index.jsp#features"
				class="nav-list">Features</a> <a
				href="<%=request.getContextPath()%>/index.jsp#about"
				class="nav-list">About</a>

			<%
			User loggedUser = (User) session.getAttribute("loggedUser");

			if (loggedUser == null) {
			%>

			<div class="register">
				<a href="<%=request.getContextPath()%>/Pages/Login/login.jsp">
					<button class="login-btn">Log in</button>
				</a> <a href="<%=request.getContextPath()%>/Pages/Login/Register.jsp">
					<button class="signup-btn">Sign up</button>
				</a>
			</div>
			<%
			} else {
			%>
			<img class="profile"
			style="display: block"
				src="<%=request.getContextPath()%>/Assests/Images/icon/custom.png"
				alt="profile" onclick="dropdown()" />
			<div class="dropdown-content" id="myDropdown">
				<a href="<%= request.getContextPath() %>/LogoutServlet">Log out</a> <a
					href="#">Profile</a>
			</div>
			<%
			}
			%>
		</nav>
	</header>

	<script type="text/javascript">
		function dropdown() {
			document.getElementById("myDropdown").classList.toggle("show");
		}

		window.onclick = function(e) {
			if (!e.target.matches(".profile")) {
				let myDropdown = document.getElementById("myDropdown");
				if (myDropdown.classList.contains("show")) {
					myDropdown.classList.remove("show");
				}
			}
		};
	</script>




</body>
</html>