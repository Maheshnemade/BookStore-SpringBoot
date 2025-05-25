<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>

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
            overflow: hidden;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* 💎 Glassmorphism Dashboard Container */
        .dashboard-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            width: 450px;
            text-align: center;
            color: white;
            position: relative;
            z-index: 2;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .dashboard-container:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.5);
        }

        /* ✨ Dashboard Heading */
        .dashboard-container h2 {
            font-family: 'Playfair Display', serif;
            font-weight: bold;
            font-size: 2.5rem;
            margin-bottom: 30px;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /* 🌈 Dashboard Buttons */
        .dashboard-container a {
            display: block;
            text-decoration: none;
            font-size: 18px;
            padding: 15px;
            margin: 12px 0;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            color: white;
            transition: all 0.3s ease-in-out;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .dashboard-container a:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        /* 🌟 Hover Effect for Buttons */
        .dashboard-container a::before {
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

        .dashboard-container a:hover::before {
            transform: translate(-50%, -50%) scale(1);
        }

        /* 🎨 Special Button Styles */
        .analytics-btn {
            background: rgba(23, 162, 184, 0.2) !important;
        }
        .analytics-btn:hover {
            background: rgba(23, 162, 184, 0.3) !important;
        }

        .logout-btn {
            background: rgba(220, 53, 69, 0.2) !important;
        }
        .logout-btn:hover {
            background: rgba(220, 53, 69, 0.3) !important;
        }

        /* ✨ Floating Icons Animation */
        .floating-icons {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .floating-icons i {
            position: absolute;
            font-size: 24px;
            color: rgba(255, 255, 255, 0.5);
            animation: float 6s infinite ease-in-out;
        }

        @keyframes float {
            0% { transform: translateY(0) translateX(0); }
            50% { transform: translateY(-20px) translateX(20px); }
            100% { transform: translateY(0) translateX(0); }
        }

        .floating-icons i:nth-child(1) { top: 10%; left: 5%; animation-delay: 0s; }
        .floating-icons i:nth-child(2) { top: 20%; left: 80%; animation-delay: 2s; }
        .floating-icons i:nth-child(3) { top: 50%; left: 20%; animation-delay: 4s; }
        .floating-icons i:nth-child(4) { top: 70%; left: 70%; animation-delay: 6s; }
    </style>

    <!-- ✅ JavaScript for Logout Confirmation -->
    <script>
        function confirmLogout(event) {
            event.preventDefault(); // Prevent the default link behavior
            const isConfirmed = confirm("Are you sure you want to logout?");
            if (isConfirmed) {
                window.location.href = "/logout"; // Redirect to logout page
            }
        }
    </script>
</head>
<body>

    <!-- ✨ Floating Icons -->
    <div class="floating-icons">
        <i class="fas fa-book"></i>
        <i class="fas fa-users"></i>
        <i class="fas fa-chart-bar"></i>
        <i class="fas fa-sign-out-alt"></i>
    </div>

    <!-- 💎 Dashboard Container -->
    <div class="dashboard-container">
        <h2><i class="fas fa-user-shield"></i> Admin Dashboard</h2>
        <a href="/admin/books"><i class="fas fa-book"></i> Manage Books</a>
        <a href="/admin/users"><i class="fas fa-users"></i> Manage Users</a>
        <a href="/admin/analytics" class="analytics-btn"><i class="fas fa-chart-bar"></i> View Analytics</a>
        <a href="/admin/register"><i class="fas fa-user-plus"></i> Register Admin</a>
        <a href="/logout" class="logout-btn" onclick="confirmLogout(event)"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>

</body>
</html>