<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Match List</title>

<style>
.table {
	width: 100%;
	border-collapse: collapse;
	border: 1px solid #ccc;
	margin-top: 20px;
}

.table th {
	background-color: #f2f2f2;
	border: 1px solid #ccc;
	padding: 10px;
	text-align: left;
}

.table tr {
	border: 1px solid #ccc;
}

.table tr:nth-child(even) {
	background-color: #f2f2f2;
}

.table td {
	padding: 10px;
	border: 1px solid #ccc;
}
</style>


</head>
<body>


	<h1>Display Matches</h1>

	<table class="table table-bordered">
		<thead>
			<tr>
				<th>S No</th>
				<th>Date</th>
				<th>Place</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="match" items="${matches}" varStatus="loop">


				<tr>
					<td><c:out value="${loop.index + 1}" /></td>
					<td><c:out value="${match.matchDate}" /></td>
					<td><c:out value="${match.matchPlace}" /></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>