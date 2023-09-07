<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>

 <style>
        section {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 89vh;
        }
        .profile-container {
            max-width: 400px;
            padding: 50px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
            background-color: #fff;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .profile-label {
            font-weight: bold;
            margin-top: 10px;
        }
        #name, #email, #phone {
            margin-bottom: 15px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
            background-color: #f9f9f9;
        }
        #name {
            color: #333;
            font-size: 18px;
        }
        #email {
            color: #0073e6;
        }
        #phone {
            color: #1e7e34;
        }
        .back-button {
            display: block;
            text-align: center;
            margin-top: 20px;
        }
        .back-button a {
            text-decoration: none;
            padding: 10px 20px;
            background-color: #94ca65;
            color: #fff;
            border-radius: 5px;
        }
        .back-button a:hover {
            background-color: #555;
        }
    </style>

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

 <section>
 
 <div class="profile-container">
        <h1>My Profile</h1>
        <div class="profile-label">Name:</div>
        <div id="name">${sessionScope.loggedUser.name}</div>
        <div class="profile-label">Email:</div>
        <div id="email">${sessionScope.loggedUser.email}</div>
        <div class="profile-label">Phone Number:</div>
        <div id="phone">${sessionScope.loggedUser.phonenumber}</div>
        
        <div class="back-button">
            <a href="home.jsp">Back</a>
        </div>
    </div>
 
 </section>

</body>
</html>