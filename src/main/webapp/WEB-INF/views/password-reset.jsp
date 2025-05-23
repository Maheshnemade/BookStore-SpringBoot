<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Password Reset</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        h2 {
            color: #333;
            text-align: center;
        }
        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover {
            background-color: #218838;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
            display: none;
        }
    </style>
</head>
<body>
	<form action="/user/password-reset" method="post" onsubmit="return validatePasswords()">
        <h2>Reset Password</h2>
        <label>Username:</label>
        <input type="text" name="username" required><br>

        <label>New Password:</label>
        <input type="password" id="newPassword" name="newPassword" required><br>

        <label>Confirm Password:</label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br>

        <div id="errorMessage" class="error-message">Passwords do not match.</div>

        <button type="submit">Reset Password</button>
    </form>

    <script>
        function validatePasswords() {
            const newPassword = document.getElementById("newPassword").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const errorMessage = document.getElementById("errorMessage");

            if (newPassword !== confirmPassword) {
                errorMessage.style.display = "block"; // Show error message
                return false; // Prevent form submission
            } else {
                errorMessage.style.display = "none"; // Hide error message
                return true; // Allow form submission
            }
        }
    </script>
</body>
</html>