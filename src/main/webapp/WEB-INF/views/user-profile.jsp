<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Profile</title>

    <!-- ✅ Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- ✅ FontAwesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <!-- ✅ Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">

    <style>
        /* 🌟 Luxurious Background with Gradient Animation */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298, #6a11cb);
            background-size: 300% 300%;
            animation: gradientAnimation 10s ease infinite;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* 💎 Profile Container */
        .profile-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            width: 400px;
            text-align: center;
            color: white;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .profile-container:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.5);
        }

        /* ✨ Heading Style */
        h2 {
            font-family: 'Playfair Display', serif;
            font-weight: bold;
            font-size: 2rem;
            margin-bottom: 20px;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        h3 {
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /* 🌈 Profile Info */
        .profile-info {
            font-size: 18px;
            margin-bottom: 20px;
            color: #ddd;
        }

        /* 🌟 Reset Password Form */
        .reset-password-form {
            text-align: left;
        }

        .reset-password-form label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: white;
        }

        .reset-password-form input {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            font-size: 16px;
            margin-bottom: 15px;
            transition: all 0.3s ease-in-out;
        }

        .reset-password-form input:focus {
            background: rgba(255, 255, 255, 0.3);
            outline: none;
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.5);
        }

        /* 🔘 Reset Password Button */
        .reset-password-btn {
            width: 100%;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .reset-password-btn:hover {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        /* 🌟 Hover Effect for Buttons */
        .reset-password-btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 300%;
            height: 300%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0));
            transform: translate(-50%, -50%) scale(0);
            transition: transform 0.5s ease-in-out;
            z-index: -1;
        }

        .reset-password-btn:hover::before {
            transform: translate(-50%, -50%) scale(1);
        }
    </style>
</head>
<body>

    <!-- 💎 Profile Container -->
    <div class="profile-container">
        <h2><i class="fas fa-user-circle"></i> User Profile</h2>
        <div class="profile-info">
            <p><strong>Username:</strong> ${user.username}</p>
        </div>

        <h3><i class="fas fa-key"></i> Reset Password</h3>
        <form action="/user/password-reset" method="post" class="reset-password-form">
            <input type="hidden" name="username" value="${user.username}">
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
            <button type="submit" class="reset-password-btn">Reset Password</button>
        </form>
    </div>

</body>
</html>