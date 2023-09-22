// setting the turf booking details in the local storage
/*let book = document.getElementById("book");

book.addEventListener("click", function (e) {
  e.preventDefault();

  const date = document.getElementById("date").value;
  const fromTime = document.getElementById("from-time").value;
  const toTime = document.getElementById("to-time").value;
  const login_user = JSON.parse(localStorage.getItem("details"));
  // turf card id
  const turf_book_id = JSON.parse(localStorage.getItem("turf_book_id"));
  const booking_id = Date.now();

  let turf_arr = [];

  let turt_obj = {
    date,
    fromTime,
    toTime,
    login_user,
    turf_book_id,
    booking_id,
  };

  if (localStorage.getItem("turf_booking") != null) {
    turf_arr = JSON.parse(localStorage.getItem("turf_booking"));
  }

  turf_arr.push(turt_obj);

  localStorage.setItem("turf_booking", JSON.stringify(turf_arr));

  alert("You have booked this turf and It will be added to your bookings");

  window.location.href = "../Turf.html";
});
*/

/*For jsp*/

const currentDate = new Date().toISOString().split("T")[0];
  document.getElementById("date").setAttribute("min", currentDate);
  
  
const getTimes = (turfId, date) => {
  // Return a promise from the function
  return axios.get(`/creckettApp/GetTimeByDateServlet?turfId=${turfId}&date=${date}`);
};
  

  const generateTimeSlots = async () => {
	    const dateInput = document.getElementById("date");
	    const selectedDate = dateInput.value;
	    const timeSlotsContainer = document.getElementById("time-slots-container");
	    
	    const turdId = document.getElementById("turfId").value;
	    let times =await getTimes(turdId,selectedDate).then((response)=>response.data);
	    console.log(times);

	    
	    
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
	      timeSlotSelect.name = "time";
	      timeSlotSelect.required = true;
	      
          
	      // Generate time slots from the current hour until 10 PM
	      for (let i = currentTime; i < 22; i++) {
	        const startTime = formatTime(i+1); // Format time with AM/PM
	        const endTime = formatTime(i + 2); // Format time with AM/PM

	        // Create an option element for each time slot
	        
	        const option = document.createElement("option");
	         option.value = startTime + " - " + endTime;
	        option.text = startTime + " - " + endTime;
	        
	        
	         // disabling the time if already someones book it	
	   if (times.some(item => item.includes(startTime + " - " + endTime))) {
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
	           if (times.some(item => item.includes(startTime + " - " + endTime))) {
    option.disabled = true;
}

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



