
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.creckett.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users List</title>

<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<h1>All Users List</h1>
	<%
	@SuppressWarnings("unchecked")
	ArrayList<User> users = (ArrayList<User>) request.getAttribute("usersList");
	%>

	<table>
		<tr>
			<th>Name</th>
			<th>Email</th>
			<th>Phone number</th>
		</tr>
		<%
		for (User user : users) {
		%>
		<tr>
			<td><%=user.getName()%></td>
			<td><%=user.getEmail()%></td>
			<td><%=user.getPhonenumber()%></td>
		</tr>
		<%
		}
		%>
	</table>


</body>
</html>