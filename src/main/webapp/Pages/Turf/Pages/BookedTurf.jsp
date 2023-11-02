<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.fssa.creckett.model.User" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booked Turf</title>
    <style>
        body {
            background-color: #f4f4f4;
            text-align: center;
        }

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 60px;
            margin: 150px auto;
            max-width: 430px;
        }

        .success-message {
            color: #4CAF50;
            font-size: 24px;
            font-weight: bold;
            padding:15px;
        }

        .info-message {
            color: #333;
            font-size: 18px;
            padding:15px;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
            padding:15px;
        }
    </style>
</head>
<body>


	<jsp:include page="../../Header/header.jsp"></jsp:include>
	
	<%
	
	User user = (User) session.getAttribute("loggedUser");
	
	%>
    <div class="container">
        <div class="success-message">You have successfully booked the turf.</div>
        <div class="info-message">It will be added to your bookings.</div>
        <a class="button" href="<%=request.getContextPath() %>/TurfBookingList?id=<%=user.getId() %>">View My Bookings</a>
    </div>
</body>
</html>
