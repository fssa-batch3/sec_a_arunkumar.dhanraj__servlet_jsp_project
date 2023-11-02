<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.creckett.model.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="<%=request.getContextPath()%>/Pages/Requirment/Assests/Css/Requirment.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Alegreya&family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Alegreya:wght@400;700&family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="../../Assests/Css/style.css" />
<title>Requirement</title>
</head>
<body>

	<%
	User user = (User) session.getAttribute("loggedUser");
	%>
	<jsp:include page="/Pages/Header/header.jsp"></jsp:include>
	<main>
		<section id="sec-1">
			<div class="content">
				<h1>
					Post your<br /> Requirment
				</h1>
				<a href=""></a>
				<p>Post what are you looking for</p>
				<p>
					Looking for a player to join your team<br /> or want to play with
					a team, Then post it now
				</p>

				<%
				if (user != null) {
				%>
				<a
					href="<%=request.getContextPath()%>/Pages/Requirment/Pages/Form.jsp"><button>Post
						now</button></a>

				<%
				} else {
				%>

				<a href="<%=request.getContextPath()%>/Pages/Login/login.jsp"><button>Post
						now</button></a>

				<%
				}
				%>
			</div>
			<div class="background-gif">
				<img
					src="<%=request.getContextPath()%>/Pages/Requirment/Assests/Images/Gif/sec-1 gif.gif" />
			</div>
		</section>

		<section id="sec-3">
			<h1>What others are looking for</h1>
			<div class="main-container" id="main">

				<%
				@SuppressWarnings("unchecked")
				List<Requirement> reqList = (List<Requirement>) request.getAttribute("reqList");

				if (reqList != null) {

					for (Requirement req : reqList) {
				%>

				<div class="requir-1">
					<div class="profile-details">
						<a href="./Pages/profile/Req_profile.html?req_id=your_email">
							<img class="profile_logo"
							src="<%=request.getContextPath()%>/Assests/Images/icon/custom.png"
							alt="Profile">
						</a>
						<div>
							<span><%=req.getMessage()%></span>
							<p>
								By:
								<%=req.getPostedBy().getName()%></p>
						</div>
					</div>


					<%
					if ( user!=null && user.getId() == req.getPostedBy().getId() ) {
					%>
					<div class="edit-delete-btn">
						<img
							src="<%=request.getContextPath()%>/Pages/Requirment/Assests/Images/icon/pencil.svg"
							alt="Edit"> <img
							src="<%=request.getContextPath()%>/Pages/Requirment/Assests/Images/icon/delete.svg"
							alt="Delete">
					</div>
					<%
					}
					%>
<!-- /Pages/Requirment/Pages/profile/req_profile.jsp
 -->
					<div class="more-info">
						<div class="info">
							<a href="<%=request.getContextPath() %>/RequirementProfile?id=<%=req.getPostedBy().getEmail() %>">
								<img
								src="<%=request.getContextPath()%>/Pages/Requirment/Assests/Images/Image/boy.png"
								alt="Profile">
							</a>
							<p>Profile</p>
						</div>
						<div class="info" onclick="share()">
							<img
								src="<%=request.getContextPath()%>/Pages/Requirment/Assests/Images/Image/send.png"
								alt="Profile">
							<p>Share</p>
						</div>
						<div class="info" onclick="contact(<%= req.getPostedBy().getPhonenumber()%>)">
							<img
								src="<%=request.getContextPath()%>/Pages/Requirment/Assests/Images/Image/contact.png"
								alt="Profile">
							<p>Contact</p>
						</div>
					</div>
				</div>


				<%
				}
				} else {
				out.print("<h2>There are no requirements</h2>");
				}
				%>

			</div>

		</section>
	</main>
	<footer>
		<div class="links">
			<h1>Quick links</h1>

			<p>
				<a href="../../index.html">Home</a>
			</p>
			<p>
				<a href="../Turf/Turf.html">Turf</a>
			</p>
			<p>
				<a href="../Opponent/Opponent.html">Opponents</a>
			</p>
			<p>
				<a href="../Requirment/Requirment.html">Post your requirments</a>
			</p>
			<p>
				<a href="../../index.html">About</a>
			</p>
		</div>
		<div class="contact">
			<h1>Contact</h1>
			<p>Freshworks software academy,</p>
			<p>Global infocity,</p>
			<p>Perungkudi,Chennai.</p>
			<p>Phone: +91 6385102549</p>
			<p>Email: arunkumar.dhanraj@fssa.freshworks.com</p>
		</div>
		<div class="connect">
			<h1>Connect Us</h1>
			<div class="connect-images">
				<a href="https://www.facebook.com/arun.dhanraj.75" target="_blank"><img
					src="<%=request.getContextPath()%>/Assests/Images/icon/facebook.gif" /></a>
				<a href="https://www.instagram.com/arun_smithan/" target="_blank"><img
					src="<%=request.getContextPath()%>/Assests/Images/icon/instagram.gif" /></a>
				<a href="https://wa.me/qr/RFF4LBMRVVPLB1" target="_blank"><img
					src="<%=request.getContextPath()%>/Assests/Images/icon/whatsapp.gif" /></a>
			</div>
		</div>
	</footer>



<script>
function contact(phoneNumber) {
   
    const message = "I saw your Requirement on the 'Creckett' website, and I'm looking forward to discussing it further";

    const whatsappURL = "whatsapp://send?phone=" + phoneNumber + "&text=" + encodeURIComponent(message);

    window.location.href = whatsappURL;
}

function share(){
	alert("This feature is under maintenence");
}


</script>
</body>
</html>