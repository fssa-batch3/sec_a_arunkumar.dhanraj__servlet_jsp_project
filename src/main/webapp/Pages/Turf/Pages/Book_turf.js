/*For jsp*/
const currentDate = new Date().toISOString().split("T")[0];
document.getElementById("date").setAttribute("min", currentDate);

function getTimes(turfId, date) {
	// Return a promise from the function
	const response = axios.get(
		`/creckettApp/GetTimeByDateServlet?turfId=${turfId}&date=${date}`
	);
	return response;
}

async function generateTimeSlots() {
	const dateInput = document.getElementById("date");
	const selectedDate = dateInput.value;
	const timeSlotsContainer = document.getElementById("time-slots-container");

	const turdId = document.getElementById("turfId").value;

	let times = await getTimes(turdId, selectedDate).then(
		(response) => response.data,
	);

	// Clear previously generated time slots
	timeSlotsContainer.innerHTML = "";

	// Check if the selected date is today
	const isToday = selectedDate === currentDate;

	const slots = document.getElementById("avail");

	slots.style.display = "block";

	document.querySelector(".popup-body").style.marginTop = "-10px";

	// Generate time slots
	if (isToday) {
		const currentTime = new Date().getHours(); // Get the current hour

		// Create a select element
		const timeSlotSelect = document.createElement("select");
		timeSlotSelect.classList.add("time-slot-select");
		timeSlotSelect.name = "time";
		timeSlotSelect.required = true;

		// Generate time slots from the current hour until 10 PM
		for (let i = currentTime; i < 22; i++) {
			const startTime = formatTime(i + 1); // Format time with AM/PM
			const endTime = formatTime(i + 2); // Format time with AM/PM

			// Create an option element for each time slot

			const option = document.createElement("option");
			option.value = startTime + " - " + endTime;
			option.text = startTime + " - " + endTime;

			// disabling the time if already someones book it
			if (times.some((item) => item.includes(startTime + " - " + endTime))) {
				option.disabled = true;
			}

			// Append the option to the select element
			timeSlotSelect.appendChild(option);
		}

		// Append the select element to the timeSlotsContainer
		timeSlotsContainer.appendChild(timeSlotSelect);
	} else {
		// Create a select element
		const timeSlotSelect = document.createElement("select");
		timeSlotSelect.classList.add("time-slot-select");
		timeSlotSelect.name = "time";
		timeSlotSelect.required = true;

		// Generate time slots from 7 AM until 10 PM
		for (let i = 7; i < 22; i++) {
			const startTime = formatTime(i); // Format time with AM/PM
			const endTime = formatTime(i + 1); // Format time with AM/PM

			// Create an option element for each time slot
			const option = document.createElement("option");
			option.value = startTime + " - " + endTime;
			option.text = startTime + " - " + endTime;

			// disabling the time if already someones book it
			if (times.some((item) => item.includes(startTime + " - " + endTime))) {
				option.disabled = true;
			}

			// Append the option to the select element
			timeSlotSelect.appendChild(option);
		}

		// Append the select element to the timeSlotsContainer
		timeSlotsContainer.appendChild(timeSlotSelect);
	}
}

function formatTime(time) {
	let formattedTime = time % 12;

	if (formattedTime === 0) {
		formattedTime = 12;
	}

	const suffix = time < 12 ? "AM" : "PM";

	return formattedTime + suffix;
};

/*For pop up */
document.getElementById("book").addEventListener("click", function(event) {
	event.preventDefault();
	document.querySelector(".popup").classList.add("active");
});

document.querySelector(".close-icon").addEventListener("click", function() {
	document.querySelector(".popup").classList.remove("active");
});

// JavaScript for showing the user details popup
const contactButton = document.getElementById("contact-button");
const userDetailsPopup = document.querySelector(".user-details-popup");
const closeIcon = userDetailsPopup.querySelector(".close-icon");

contactButton.addEventListener("click", () => {
	userDetailsPopup.style.display = "flex";
});

closeIcon.addEventListener("click", () => {
	userDetailsPopup.style.display = "none";
});
