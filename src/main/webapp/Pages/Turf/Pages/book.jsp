<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Pages/Turf/Pages/Assests/Css/Book.css" />
<title>Book Turf</title>

</head>
<body>
	<jsp:include page="../../Header/header.jsp"></jsp:include>
	<div class="turf-container">



		<div class="popup">
			<div class="popup-content">
				<span class="close-icon">&#10006;</span>
				<div class="popup-body">
					<form
						action="<%=request.getContextPath()%>/TurfBooking?turfId=${turf.turf.turfId}"
						method="post">
						<div class="date-picker">
							<input id="turfId" value="${turf.turf.turfId}"
								style="display: none;"> <label for="date">Select
								a date:</label> <input type="date" id="date" min="YYYY-MM-DD"
								name="date" onchange="generateTimeSlots()" required="required">
						</div>
						<div class="time-slots">
							<p class="times" id="avail">Available Time slots:</p>
							<div id="time-slots-container">
								<!-- Time slots will be generated here using JavaScript -->
							</div>
						</div>
						<button type="submit">Book now</button>
					</form>
				</div>
			</div>
		</div>



<div class="Desktop1">
    <div class="Frame6">
        <img class="Rectangle1" src="${turf.turf.image}" />
        <div class="Frame5">
            <div class="Frame3">
                <div class="TaramaniTurf">Location</div>
                <div class="location">${turf.turf.message}</div>
                <div class="Amenities">Amenities: Parking, First Aid, Change Room</div>
            </div>
            <div class="Frame4">
                <div class="Frame1">
                    <div class="BookTurf" id="book">Book Now</div>
                </div>
                <div class="Frame2">
                    <div class="Contact" id="contact-button">Contact</div>
                </div>
            </div>
        </div>
        <div class="AboutVenue">
            <h2>About the Venue</h2>
            <p>
                Welcome to Chad Turf, your ultimate destination for cricket enthusiasts. Our cricket turf offers a state-of-the-art playing experience with top-notch amenities. 
                Located in a prime location, you'll have easy access to nearby parking facilities, first aid assistance, and spacious change rooms. 

                Whether you're a professional cricketer or just want to enjoy a game with friends, our venue is the perfect choice. Join us for an exceptional cricket experience!

                Book your slot now and get ready to play your best game at Chad Turf.
            </p>
        </div>
    </div>
</div>



		

	</div>




	<!-- Popup for user details -->
	<div class="user-details-popup">
		<div class="popup-content">
			<span class="close-icon">&#10006;</span>
			<div class="popup-body">
				<h2>Contact Details</h2>
				<p>Name: ${turf.turf.createdBy.name} </p>
				<p>Email: ${turf.turf.createdBy.email}</p>
				<p>Phone: ${turf.turf.createdBy.phonenumber}</p>
			</div>
		</div>
	</div>



	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<script
		src="<%=request.getContextPath()%>/Pages/Turf/Pages/Book_turf.js"></script>
</body>
</html>
