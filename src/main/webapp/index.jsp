<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./Assests/Css/style.css" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Tangerine" />
<link
	href="https://fonts.googleapis.com/css2?family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Rajdhani&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Alegreya&family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Alegreya:wght@400;700&family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />
<title>Creckett</title>

</head>
<body>

	<jsp:include page="./Pages/Header/header.jsp"></jsp:include>

	<section id="home" class="sec-1">
		<div class="background-video-container">
			<div class="background-video-inner">
				<video class="main-video" autoplay muted loop id="myVideo">
					<source src="./Assests/Images/Ground.mp4" type="video/mp4" />
				</video>
			</div>
		</div>
		<div class="overlay">
			<h1>What are you looking for?</h1>
			<p>We are helping you to find a cricket turf and your opponent
				too. We will fulfill your requirement.</p>
			<a class="learn" href="#about">
				<button class="learn-more">
					<span class="circle" aria-hidden="true"> <span
						class="icon arrow"></span>
					</span> <span class="button-text">Learn More</span>
				</button>
			</a>
		</div>
	</section>

	<section id="features">
		<div class="feat-para">We are commited to bringing you what you
			want!</div>
		<div class="feat-container">

			<a href="<%=request.getContextPath()%>/ListTurfsList">
				<div class="container-turf" onclick="turf_container()">
					Turf <img src="./Assests/Images/turf.jpg" alt="Turf" />

					<button>
						<span>Book now</span>
					</button>

				</div>
			</a>

		

			<a href="<%=request.getContextPath()%>/RequirementList">

				<div class="container-requirements">
					Requirement <img src="./Assests/Images/account-multiple-plus.svg"
						alt="Account multiple plus" />
					<button>
						<span>Post now</span>
					</button>


				</div>

			</a>
			
				<div class="container-opponents" onclick="opponent_container()">
				Opponent <img src="./Assests/Images/boys of cricket.jpg"
					alt="Boys of cricket" /> <a href="">
					<button>
						<span>Coming soon</span>
					</button>
				</a>
			</div>
			
			
		</div>


	</section>
	<section id="about">
		<div class="search">
			<h1>Search</h1>
			<img src="./Assests/Images/icon/search.png" alt="Search" />
			<p>Are you looking to play cricket but don't have an ground and
				opponent? Search for it.</p>
		</div>
		<div class="book">
			<h1>Book</h1>
			<img src="./Assests/Images/icon/booking.png" alt="Booking" />
			<p>Ones you have found a perfect ground and opponent.Connect with
				them through online booking.</p>
		</div>
		<div class="play">
			<h1>Play</h1>
			<img src="./Assests/Images/icon/cricket-ball.png" alt="Ball" />
			<p>All right you've found that now it's time to play. Let's play
				and enjoy the game.</p>
		</div>
	</section>
	<footer>
		<div class="links">
			<h1>Quick links</h1>

			<p>
				<a href="#home">Home</a>
			</p>
			<p>
				<a href="./Pages/Turf/Turf.html">Turf</a>
			</p>
			<p>
				<a href="./Pages/Opponent/Opponent.html">Opponents</a>
			</p>
			<p>
				<a href="./Pages/Requirment/Requirment.html">Post your
					requirments</a>
			</p>
			<p>
				<a href="#about">About</a>
			</p>
		</div>
		<div class="contact">
			<h1>Contact</h1>
			<p>Freshworks software academy,</p>
			<p>Global infocity,</p>
			<p>Perungkudi,Chennai.</p>
			<p>Phone: +91 6385102549</p>
			<p class="email">Email: arunkumar.dhanraj@fssa.freshworks.com</p>
		</div>
		<div class="connect">
			<h1>Connect Us</h1>
			<div class="connect-images">
				<a href="https://www.facebook.com/arun.dhanraj.75" target="_blank"><img
					src="./Assests/Images/icon/facebook.gif" /></a> <a
					href="https://www.instagram.com/arun_smithan/" target="_blank"><img
					src="./Assests/Images/icon/instagram.gif" /></a> <a
					href="https://wa.me/qr/RFF4LBMRVVPLB1" target="_blank"><img
					src="./Assests/Images/icon/whatsapp.gif" /></a>
			</div>
		</div>
	</footer>
<script>
 function opponent_container(){
	 alert("This page is under maintenance");
 }


</script>
</body>
</html>