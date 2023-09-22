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
	<div class="turf-container">
		<!-- Turf Image and Details -->
		<img class="turf-image" src="${turf.image}" alt="Turf Image">
		<div class="turf-details">
			<p>Location: ${turf.message}</p>
		</div>

		<form action="TurfBooking?turfId=${turf.turfId}" method="post">

			<!-- Date Picker -->
			<div class="date-picker">
				<input id="turfId" value="${turf.turfId}"> <label for="date">Select
					a date:</label> <input type="date" id="date" min="YYYY-MM-DD" name="date"
					onchange="generateTimeSlots()" required="required" />


			</div>

			<!-- Time Slots -->
			<div class="time-slots">
				<p>Select a time slot:</p>
				<div id="time-slots-container">
					<!-- Time slots will be generated here using JavaScript -->
				</div>
			</div>

			<button id="book" type="submit">Book now</button>
		</form>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

	<script
		src="<%=request.getContextPath()%>/Pages/Turf/Pages/Book_turf.js"></script>


</body>
</html>
