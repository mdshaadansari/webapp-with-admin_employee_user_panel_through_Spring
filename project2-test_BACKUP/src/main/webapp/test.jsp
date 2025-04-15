<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up Button Example</title>
    <style>
        /* Internal CSS for styling the button */
        .signup-button {
            background-color: rgb(75, 204, 0, 1); /* Green background color */
            color: white; /* White text color */
            padding: 10px 20px; /* Vertical and horizontal padding */
            text-align: center; /* Centered text */
            text-decoration: none; /* Remove underline from text */
            display: inline-block; /* Inline-block element */
            font-size: 16px; /* Font size */
            font-weight: bold; /* Bold text */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor on hover */
            transition: background-color 0.3s ease; /* Smooth transition for background color */
            
        }

        /* Hover effect */
        .signup-button:hover {
            background-color: #00b864; /* Darker green on hover */
        }
    </style>
</head>
<body>

    <!-- Button element -->
    <button class="signup-button" onclick="window.location.href='signup.jsp'">Sign Up</button>
</body>
</html>
