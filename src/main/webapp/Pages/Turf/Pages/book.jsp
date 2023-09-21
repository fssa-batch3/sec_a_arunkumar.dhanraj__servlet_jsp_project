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
		<img class="turf-image" src="turf-image.jpg" alt="Turf Image">
		<div class="turf-details">
			<p>Turf Name: ABC Turf</p>
			<p>Location: XYZ Street, City</p>
		</div>

		<!-- Date Picker -->
		<div class="date-picker">
			<label for="date">Select a date:</label> <input type="date" id="date"
				min="YYYY-MM-DD" onchange="generateTimeSlots()" />


		</div>

		<!-- Time Slots -->
		<div class="time-slots">
			<p>Select a time slot:</p>
			<div id="time-slots-container">
				<!-- Time slots will be generated here using JavaScript -->
			</div>
		</div>

		<button id="book" type="submit">Book now</button>
	</div>


	<script>
  const currentDate = new Date().toISOString().split("T")[0];
  document.getElementById("date").setAttribute("min", currentDate);
  
  
  
  const generateTimeSlots = () => {
	    const dateInput = document.getElementById("date");
	    const selectedDate = dateInput.value;
	    const timeSlotsContainer = document.getElementById("time-slots-container");
	    
	    // Clear previously generated time slots
	    timeSlotsContainer.innerHTML = "";
	    
	    // Check if the selected date is today
	    const isToday = selectedDate === currentDate;
	    
	 // Generate time slots
	    if (isToday) {
	      const currentTime = new Date().getHours(); // Get the current hour

	      // Create a select element
	      const timeSlotSelect = document.createElement("select");
	      timeSlotSelect.classList.add("time-slot-select");

	      // Generate time slots from the current hour until 10 PM
	      for (let i = currentTime; i < 22; i++) {
	        const startTime = formatTime(i+1); // Format time with AM/PM
	        const endTime = formatTime(i + 2); // Format time with AM/PM

	        // Create an option element for each time slot
	        const option = document.createElement("option");
	        option.value = startTime + " - " + endTime;
	        option.text = startTime + " - " + endTime;

	        // Append the option to the select element
	        timeSlotSelect.appendChild(option);
	      }

	      // Append the select element to the timeSlotsContainer
	      timeSlotsContainer.appendChild(timeSlotSelect);
	    } else {
	      // Create a select element
	      const timeSlotSelect = document.createElement("select");
	      timeSlotSelect.classList.add("time-slot-select");

	      // Generate time slots from 7 AM until 10 PM
	      for (let i = 7; i < 22; i++) {
	        const startTime = formatTime(i); // Format time with AM/PM
	        const endTime = formatTime(i + 1); // Format time with AM/PM

	        // Create an option element for each time slot
	        const option = document.createElement("option");
	        option.value = startTime + " - " + endTime;
	        option.text = startTime + " - " + endTime;

	        // Append the option to the select element
	        timeSlotSelect.appendChild(option);
	      }

	      // Append the select element to the timeSlotsContainer
	      timeSlotsContainer.appendChild(timeSlotSelect);
	    }

	  };
	  
	  const formatTime = (time) => {
	    let formattedTime = time % 12;
	    
	    if (formattedTime === 0) {
	      formattedTime = 12;
	    }
	    
	    const suffix =  time < 12 ? "AM" : "PM";
	    
	    return formattedTime + suffix;
	  };
</script>

</body>
</html>
