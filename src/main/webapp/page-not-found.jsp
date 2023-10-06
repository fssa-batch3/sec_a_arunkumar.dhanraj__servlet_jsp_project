<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>404 - Page Not Found</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            padding: 50px;
        }

        .error-container {
            background-color: #fff;
            border-radius: 5px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        h1 {
            font-size: 72px;
            color: #e74c3c;
        }

        p {
            font-size: 18px;
            color: #333;
        }

        a {
            text-decoration: none;
            color: #3498db;
        }
    </style>
</head>
<body>
	 
<div class="error-container">

<jsp:include page="/Pages/Header/header.jsp"></jsp:include>

        <h1>404</h1>
        <p>Oops! The page you're looking for could not be found.</p>
        <p>Go back to <a href="<%=request.getContextPath()%>/index.jsp">home</a>.</p>
    </div>
</body>
</html>