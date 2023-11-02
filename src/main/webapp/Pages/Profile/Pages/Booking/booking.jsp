<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.creckett.model.TurfBooking"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>My Bookings</title>
<style>
.container {
	margin-top: 22px;
	display: flex !important;
	flex-wrap: wrap;
	justify-content: center;
	gap: 35px;
	display: flex !important;
}
.bookings{
text-align: center !important;
}

/* Styling for the booking container */
.booking-container {
	display: flex;
	flex-direction: column;
	border: 1px solid #ccc;
	background-color: #E6FFCC;
	padding: 20px;
	margin: 10px;
	max-width: 250px;
	text-align: center; /* Center align the text */
}

/* Styling for the turf image */
.turf-image {
	max-width: 100%;
	height: auto;
}

/* Styling for the one-liner description */
.one-liner {
	margin-top: 10px;
}

/* Styling for the booking details */
.booking-details {
	margin-top: 10px;
}

/* Styling for the owner's information */
.owner-details {
	margin-top: 10px;
}
#back{
  position:absolute;
  top:13%;
  left:2%;
  border: 1px solid;
  font-size:19px;
  padding: 7px 27px;
  cursor: pointer;

}
.no-book{
display: flex;
flex-direction: column;
}
#explore{
border: 1px solid;
  font-size:16px;
  width:130px;
  padding: 5px 10px;
  cursor: pointer;
  margin-left: 120px;
}
</style>
</head>
<body>
	<jsp:include page="../../../../Pages/Header/header.jsp"></jsp:include>

<a href="<%=request.getContextPath() %>/Pages/Profile/userprofile.jsp">
<button class="back" id="back">Back</button> </a>
<h1 class="bookings" style="text-align: center;">Your Bookings</h1>

	<div class="container">
	

		<%
		@SuppressWarnings("unchecked")
		List<TurfBooking> booking = (List<TurfBooking>) request.getAttribute("bookings");

		if (booking != null) {

			for (TurfBooking book : booking) {
		%>

		<!-- Sample booking container (repeat this for each booking) -->
		<div class="booking-container">
			<!-- Turf image -->
			<img class="turf-image" src="<%=book.getTurf().getImage()%>"
				alt="Turf Image">

			<!-- One-liner description -->
			<p class="one-liner"><%=book.getTurf().getMessage()%></p>

			<!-- Booking details -->
			<div class="booking-details">
				<p>
					<strong>Date:</strong>
					<%=book.getStrDate() %>
				</p>
				<p>
					<strong>Time:</strong>
					<%=book.getTime() %>
				</p>
			</div>

			<!-- Turf owner's information -->
			<div class="owner-details">
				<p>
					<strong>Turf Owner:</strong>
					<%=book.getTurf().getCreatedBy().getName() %>
				</p>
				<p>
					<strong>Email:</strong> <%=book.getTurf().getCreatedBy().getEmail() %>
				</p>
				<p>
					<strong>Phone:</strong> <%=book.getTurf().getCreatedBy().getPhonenumber() %>
				</p>
			</div>
		</div>

		<%
		}
		}
		else{
			%>
			<div class="no-book">
			<h1> You haven't booked anything</h1>
		
	<a href="<%=request.getContextPath() %>/ListTurfsList">
			<button id="explore"> Explore Now!</button> </a>
			
			</div>
		<%	
		}
		%>

	</div>

	<!-- Repeat the above booking container for each booking -->
</body>
</html>
