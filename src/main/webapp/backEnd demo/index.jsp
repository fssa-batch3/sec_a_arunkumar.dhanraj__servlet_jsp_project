<html>
<head>
<meta charset="ISO-8859-1">
<title>Creckett</title>

<link
	href="https://fonts.googleapis.com/css2?family=Alegreya:wght@400;700&family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />

<style>
.h1 {
	display: flex;
	justify-content: center;
	font-family: "Alegreya", serif;
}

#sec-1 {
	margin-top: 35px;
	display: flex;
	justify-content: space-around;
	align-items: center;
	height: 400px;
	gap: 74px;
}

.content {
	padding: 10px;
}

.content h1 {
	font-family: "Alegreya", serif;
	font-size: 40px;
}

.content p {
	font-family: "Alegreya", serif;
	font-size: 20px;
}

.content-image img {
	width: 490px;
	border-radius: 20px;
}

.content button {
	font-family: "Alegreya", serif;
	font-size: 19px;
	padding: 9px 21px;
	background-color: #94ca65;
	border: none;
	border-radius: 10px;
}

.content button:hover {
	transition: 0.2s;
	cursor: pointer;
	background-color: #ccffcf;
}
</style>

</head>
<body>

	<jsp:include page="header.jsp"></jsp:include>
	<br>
	<div class="h1">
		<h1>Welcome to Creckett index page</h1>
	</div>


	<section id="sec-1">

		<div class="content">
			<h1>
				Find your <br />nearest turf
			</h1>
			<br>
			<p>Don't have a playground?</p>
			<p>Don't worry we are providing you a turf to play.</p>
			<a href="TurfBookingServlet">    <button>Book venue</button></a>
		</div>

		<div class="content-image">

			<img src="https://iili.io/J97lCBf.md.png" alt="Location" border="0">

		</div>

	</section>


</body>
</html>
