<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.fssa.creckett.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
<link href="<%=request.getContextPath() %>/Pages/Profile/Assests/Css/userprofile.css" rel="stylesheet" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet" />

</head>
<body>

	<jsp:include page="../../../../Pages/Header/header.jsp"></jsp:include>

	<%
	User user = (User) request.getAttribute("profile");

	int id = user.getId();
	System.out.print(id);
	String name = "";
	String email = "";
	String number = "";
	String blood = "";
	String availability = "";
	String category = "";

	if (user != null) {
		name = user.getName();
		email = user.getEmail();
		number = user.getPhonenumber();
		blood = user.getBloodGroup() != null ? user.getBloodGroup() : "None";
		availability = user.getAvailability() != null ? user.getAvailability() : "None";
		category = user.getCategory() != null ? user.getCategory() : "None";
	}
	%>

	<div class="container">
		<div
			class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
			<div class="panel panel-primary">
				<div class="panel-heading">

					<div class="button-div">
						<!-- <button id="add_team">
							<img src="./Assests/icon/plus.png" alt="Add_team" /> My turfs
						</button> -->
						<button id="team">
							<div class="team-div">
								<img alt="Team" id="team-pic" />
								<p id="team-name"></p>
							</div>
						</button>
					
						<!-- 		<button id="favorites">
							<img src="./Assests/icon/heart.png" alt="Favorites" /> My
							Favorites
						</button> -->
					</div>
				</div>
				<form class="panel-body" id="form"
					action="<%=request.getContextPath()%>/RequirementList">
					<div class="row">
						<div class="col-md-3 col-lg-3">
							<img alt="User Pic" id="profile-pic"
								class="img-circle img-responsive"
								src="<%=request.getContextPath()%>/Assests/Images/icon/custom.png" />

							<h3 class="panel-title" id="username"></h3>
						</div>
						<div class="col-md-9 col-lg-9" id="form">
							<div class="main-details">
								<table class="table table-user-information">
									<tbody>
										<tr>
											<td>Name :</td>
											<td><input id="fname" type="text" value="<%=name%>"
												name="name" pattern="[A-Za-z]{4,}"
												title="Username should be greater than 3 letters and without special characters"
												disabled autofocus="autofocus" /></td>

										</tr>

										<tr>
											<td>Email :</td>
											<td><input id="email" type="email" value="<%=email%>"
												disabled /></td>
										</tr>





										<tr>
											<td class="phone">Phone Number :</td>
											<td><input id="phone-number" type="text"
												value="<%=number%>" name="number" pattern="[6789]\d{9}"
												title="Please enter a valid 10-digit indian phone number"
												disabled /></td>
										</tr>
									</tbody>
								</table>
								<table class="table table-user-information">
									<tbody>




										<tr>
											<td>Blood Group :</td>
											<td><select class="blood-group" id="blood-group"
												disabled name="blood">
													<option value="<%=blood%>"><%=blood%></option>
													<option value="A +ve">A +ve</option>
													<option value="B +ve">B +ve</option>
													<option value="O +ve">O +ve</option>
													<option value="AB +ve">AB +ve</option>
													<option value="A -ve">A -ve</option>
													<option value="B +ve">B -ve</option>
													<option value="O +ve">O -ve</option>
													<option value="AB +ve">AB -ve</option>
											</select></td>
										</tr>
										<tr>
											<td class="availability">Your availability :</td>

											<td><select class="avail" id="avail" disabled
												name="avail">
													<option value="<%=availability%>"><%=availability%></option>
													<option value="Saturday">Saturday</option>
													<option value="Sunday">Sunday</option>
													<option value="Saturday and Sunday">Saturday and
														Sunday</option>
											</select></td>


										</tr>


										<tr>
											<td>Category :</td>
											<td><select class="avail" id="category" disabled
												name="category">
													<option value="<%=category%>"><%=category%></option>
													<option value="Left-Handed Batsman">Left-Handed
														Batsman</option>
													<option value="Right-Handed Batsman">Right-Handed
														Batsman</option>
													<option value="Left-Arm Fast Bowler">Left-Arm Fast
														Bowler</option>
													<option value="Right-Arm Fast Bowler">Right-Arm
														Fast Bowler</option>
													<option value="Left-Arm Spin Bowler">Left-Arm Spin
														Bowler</option>
													<option value="Right-Arm Spin Bowler">Right-Arm
														Spin Bowler</option>
													<option value="Wicketkeeper-Batsman">Wicketkeeper-Batsman</option>
													<option value="All-Rounder">All-Rounder</option>
											</select></td>


										</tr>

									</tbody>
								</table>
							</div>
							<div class="edit-delete-div">
								

								<button class="back" id="back">Back</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>



</body>
</html>