<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.fssa.creckett.model.*"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/Pages/Turf/Assests/Css/turf.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Alegreya&family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Alegreya:wght@400;700&family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />
<title>Turf</title>
</head>
<body>
	<jsp:include page="../Header/header.jsp"></jsp:include>


	<main>
		<section id="sec-1">
			<div class="content">
				<h1>
					Find your <br />nearest turf
				</h1>
				<p>Don't have a playground?</p>
				<p>Don't worry we are providing you a turf to play.</p>
				<a href="#turf-list"><button>Book venue</button></a>
			</div>
			<div class="content-image">
				<img
					src="<%=request.getContextPath()%>/Pages/Turf/Assests/Images/Image/undraw_current_location_re_j130.svg" />
			</div>
		</section>
		<section id="sec-2">
	<%-- 		<div class="turf-content">
				<p class="find-turf">Find your ground and start playing cricket</p>
				<div class="nearby">
					<p>I want a ground near:</p>
					<form method="post" id="order">
						<select name="sort" id="filter-select">
							<option value="All">All</option>
							<option value="Guduvancherry">Guduvancherry</option>
							<option value="Tambaram">Tambaram</option>
							<option value="Kalvoy">Kalvoy</option>
							<option value="Kandigai">Kandigai</option>
							<option value="Perungudi">Perungudi</option>
							<option value="Chengalpattu">Chengalpattu</option>
							<option value="Vandalur">Vandalur</option>
							<option value="Asthinapuram">Asthinapuram</option>
						</select>
					</form>
					<button>Search</button>
				</div>
			</div>
			<div class="host">
				<p>If you have a turf, You can host here</p>
				<a
					href="<%=request.getContextPath()%>/Pages/Turf/Pages/createTurf.jsp"><button>Host
						a turf</button></a>
			</div> --%>
			<!-- 1st part done -->

			<div class="turf-list" id="turf-list">






				<%
				String error = (String) request.getAttribute("error");

				if (error != null) {
				%>
				<script>
            		alert("<%=error%>");
        		</script>

				<%
				}
				%>

				<%
				@SuppressWarnings("unchecked")
				List<Turf> turflist = (List<Turf>) request.getAttribute("turfList");

				if (turflist == null) {

					out.println("<h1>There are no Turfs </h2>");
				} else {
				%>

				<%
				for (Turf turf : turflist) {
				%>

				<div class="turf-details">
					<div class="details-image">
						<img alt="Turf image" src=<%=turf.getImage()%> />
					</div>
					<div class="details-para">
						<p>
							<%=turf.getMessage()%>
						</p>

					</div>
					<div class="details-book-btn">

						<%
						User user = (User) request.getSession().getAttribute("loggedUser");
						if (user != null && turf.getCreatedBy().getId() == user.getId()) {
						%>
						<div class="icons-and-delete">
							<a
								href="<%=request.getContextPath()%>/UpdateTurfServlet?id=<%=turf.getTurfId()%>">
								<img
								src="https://www.freeiconspng.com/thumbs/edit-icon-png/edit-editor-pen-pencil-write-icon--4.png"
								alt="edit" />
							</a> <a href="javascript:void(0);"
								onclick="confirmDelete(<%=turf.getTurfId()%>)"> <img
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX0INZjIG3A7lLPHl9f5ie-cKkVe74VfbggQ&usqp=CAU"
								alt="delete" />
							</a>
						</div>
						<%
						} else {
						if (user != null) {
						%>
						<a
							href="<%=request.getContextPath()%>/TurfBooking?turfId=
							<%=turf.getTurfId()%>"><button>Book
								now</button></a>
						<%
						} else {
						%>

						<a href="<%=request.getContextPath()%>/Pages/Login/login.jsp"><button>Book
								now</button></a>

						<%
						}
						}
						%>
					</div>
				</div>
				<!-- End of turf item  -->


				<%
				}
				}
				%>


				<!-- <div class="turf-details"> -->
				<!-- <div class="details-image">
              <img
                src="./Assests/Images/Image/Screenshot 2022-12-18 204900.jpg"
              />
            </div>
            <div class="details-para">
              <a href="#">
                <p>
                  KK cricket ground, Knight riders club, Near Nellikuppam,
                  Kandigai.
                </p>
              </a>
            </div>

            <div class="details-book-btn">
              <a href="./Pages/Book.html"><button>Book now</button></a>
              <div class="icons-and-delete">
                <img src="./Assests/Images/icon/pencil.svg" alt="edit" />
                <img src="./Assests/Images/icon/delete.svg" alt="delete" />
              </div>
            </div>
          </div>

          <!-- detail 1 done here -->

				<!-- <div class="turf-details">
            <div class="details-image">
              <img
                src="./Assests/Images/Image/Screenshot 2022-12-18 204835.jpg"
              />
            </div>
            <div class="details-para">
              <a href="#">
                <p>
                  KK cricket ground, Knight riders club, Near Nellikuppam,
                  Kandigai.
                </p>
              </a>
            </div>
            <div class="details-book-btn">
              <a href="./Pages/Book.html"> <button>Book now</button></a>
              <div class="icons-and-delete">
                <img src="./Assests/Images/icon/pencil.svg" alt="edit" />
                <img src="./Assests/Images/icon/delete.svg" alt="delete" />
              </div>
            </div>
          </div>
          detail 2 done here

          <div class="turf-details">
            <div class="details-image">
              <img
                src="./Assests/Images/Image/Screenshot 2022-12-18 204800.jpg"
              />
            </div>
            <div class="details-para">
              <a href="#">
                <p>
                  KK cricket ground, Knight riders club, Near Nellikuppam,
                  Kandigai.
                </p>
              </a>
            </div>
            <div class="details-book-btn">
              <a href="./Pages/Book.html"><button>Book now</button></a>
              <div class="icons-and-delete">
                <img src="./Assests/Images/icon/pencil.svg" alt="edit" />
                <img src="./Assests/Images/icon/delete.svg" alt="delete" />
              </div>
            </div>
          </div>
          <!-- details 3 done -->
				<!-- <div class="turf-details">
            <div class="details-image">
              <img
                src="./Assests/Images/Image/Screenshot 2022-12-18 204642.jpg"
              />
            </div>
            <div class="details-para">
              <a href="#">
                <p>
                  KK cricket ground, Knight riders club, Near Nellikuppam,
                  Kandigai.
                </p>
              </a>
            </div>
            <div class="details-book-btn">
              <a href="./Pages/Book.html"><button>Book now</button></a>
              <div class="icons-and-delete">
                <img src="./Assests/Images/icon/pencil.svg" alt="edit" />
                <img src="./Assests/Images/icon/delete.svg" alt="delete" />
              </div>
            </div> -->
				<!-- </div> -->
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
    function confirmDelete(turfId) {
        const confirmDelete = confirm("Are you sure you want to delete this?");
        if (confirmDelete) {
            // If the user confirms, redirect to the delete servlet
            window.location.href = '<%=request.getContextPath()%>/DeleteTurfServlet?id=' + turfId;
        }
    }
    
   
</script>

	<script src="../../script.js"></script>

	<script src="./turf.js"></script>
</body>
</html>