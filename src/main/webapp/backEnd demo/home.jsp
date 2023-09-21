<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Creckett</title>

<style>
body {
	font-family: Arial, sans-serif;
}

.container {
	max-width: 800px;
	margin: 0 auto;
	padding: 20px;
	text-align: center;
}

.header {
	padding: 10px;
}

.features {
	display: flex;
	align-items: center;
	justify-content: space-around;
	height: 50vh;
}

.features h2 {
	font-size: 1.5em;
	margin-bottom: 20px;
}

.feature-card {
	background-color: #f5f5f5;
	width:380px;
	border: 1px solid #ddd;
	padding: 35px;
	margin: 10px;
	border-radius: 5px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.list{
background-color: #00A86B;
padding: 8px;
}

.host{
border:1px solid;
padding: 8px;
}


.feature-card a {
	text-decoration: none;
	color: #007bff;
}
.feature-card a:hover {
	text-decoration: none;
	color: #007bff;
}


</style>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="header">
			<h1>Welcome to Creckett Home Page</h1>
		</div>
		<br>
		<h2>Turf Features</h2>
		<div class="features">
			
			<div class="feature-card">
				<h3>List Turf</h3>
				<br>
				<p>View a list of available turfs for booking.</p>
				<br>
				<a href="ListTurfsList" class="list">List Turfs</a>
			</div>
			
			<div class="feature-card">
				<h3>Create Turf</h3>
				<br>
				<p>If you have a turf, <br>you are welcome to host your turf here.</p>
				<br>
				<a href="createTurf.jsp" class="host">Host Turf</a>
			</div>
			
		</div>
	</div>
</body>
</html>
