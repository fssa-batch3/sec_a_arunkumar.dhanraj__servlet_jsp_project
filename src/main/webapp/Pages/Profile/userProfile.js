
// edit button variable
let edit = document.getElementById("edit");

// done button variable
let done = document.getElementById("done");

// delete button variable
let del = document.getElementById("delete");

// back button variable
let back = document.getElementById("back");

// My booking button variable
let booking = document.getElementById("booking");

// Add team button variable
let add_team = document.getElementById("add_team");

// User team button variable
let loguser_team = document.getElementById("team");
// User name button's image varaible
let loguser_team_pic = document.getElementById("team-pic");
// User name button's para variale
let loguser_team_name = document.getElementById("team-name");

// register details in profile page
const username = document.getElementById("username");
const email = document.getElementById("email");
const phone_number = document.getElementById("phone-number");

// form inputs
let fname = document.getElementById("fname");
let phonenumber = document.getElementById("phone-number");
let blood_group = document.getElementById("blood-group");
let avail = document.getElementById("avail");
let category = document.getElementById("category");
let record = document.getElementById("record");


edit.addEventListener("click", function (ed) {
  ed.preventDefault();
  ed.target.style.display = "none";
  done.style.display = "block";

  // Removing the inputs' disabled attribute
  fname.disabled = false;
  phonenumber.disabled = false;
  blood_group.disabled = false;
  avail.disabled = false;
  category.disabled = false;
});



// Back button function - it will redirect to the previous page in the browser's history
back.addEventListener("click", function (e) {
  e.preventDefault();
  history.back(); // Use history.back() directly
});


