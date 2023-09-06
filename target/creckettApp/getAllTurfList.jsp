<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.fssa.creckett.model.*"%>
<!DOCTYPE html>
<html>
<head>
<title>List all turf</title>
<link
	href="https://fonts.googleapis.com/css2?family=Alegreya&family=Klee+One&family=Rajdhani&display=swap"
	rel="stylesheet" />
<style>
.turf-list {
	display: flex;
	flex-direction: column;
	gap: 40px;
	margin-top: 25px;
}

.turf-details {
	display: flex;
	align-items: center;
	justify-content: space-evenly;
	box-shadow: rgb(220, 220, 220) 2px 4px 2px 6px;
	border-radius: 8px;
	padding: 30px 0px;
}

.details-image {
	flex: 2;
	display: flex;
	justify-content: center;
}

.details-image img {
	width: 160px;
	height: 160px;
	border-radius: 50%;
}

.details-para {
	flex: 5;
}

.details-para a {
	text-decoration: none;
	color: black;
}

.details-para p {
	font-size: 30px;
}

.details-book-btn {
	flex: 1.3;
	display: flex;
	flex-direction: column;
	gap: 15px;
	align-items: center;
}

.details-book-btn button {
	padding: 12px 29px;
	background-color: #a0ed89;
	font-size: 18px;
	border: none;
	border-radius: 8px;
}

.details-book-btn button:hover {
	opacity: 0.6;
	cursor: pointer;
}

.icons-and-delete {
	display: flex;
	gap: 20px;
}

.icons-and-delete img {
	width: 30px;
}

.icons-and-delete img:hover {
	opacity: 0.5;
	cursor: pointer;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="turf-list" id="turf-list">
		<!-- Turf one by one -->

		<%
		String error = request.getParameter("error");

		@SuppressWarnings("unchecked")
		List<Turf> turflist = (List<Turf>) request.getAttribute("turfList");

		if (error != null || turflist == null) {
			out.println("<h1>" + error + "</h2>");
			out.println("<a href=\"home.jsp\" style=\"margin-left: 50px\">Back</a>");
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
				<a href="./Pages/Book.html"><button>Book now</button></a>
				<%
				User user = (User) request.getSession().getAttribute("loggedUser");
				if (turf.getCreatedBy().getId() == user.getId()) {
				%>
				<div class="icons-and-delete">
					<a href="UpdateTurfServlet?id=<%=turf.getTurfId()%>"> <img
						src="https://www.freeiconspng.com/thumbs/edit-icon-png/edit-editor-pen-pencil-write-icon--4.png"
						alt="edit" />
					</a> 
					<a href="DeleteTurfServlet?id=<%=turf.getTurfId()%>">
					<img
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX0INZjIG3A7lLPHl9f5ie-cKkVe74VfbggQ&usqp=CAU"
						alt="delete" />
						</a>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<!-- End of turf item  -->


		<%
		}
		}
		%>

	</div>

</body>
</html>
