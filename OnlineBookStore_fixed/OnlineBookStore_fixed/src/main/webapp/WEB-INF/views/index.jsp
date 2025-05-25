<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Online Book Store</title>

    <!-- ✅ Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- ✅ Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">

    <!-- ✅ Custom Styles -->
    <style>
        /* 🌟 Luxurious Background with Particles */
        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 20px;
            overflow: hidden;
            background: radial-gradient(circle, #1a1a1a, #000);
            position: relative;
        }

        /* ✨ Particle Animation */
        @keyframes moveParticles {
            0% { transform: translateY(0) translateX(0); }
            100% { transform: translateY(-100vh) translateX(-100vw); }
        }

        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('https://www.transparenttextures.com/patterns/stardust.png');
            animation: moveParticles 60s linear infinite;
            opacity: 0.3;
            z-index: 1;
        }

        /* 💎 Glassmorphism Effect for Box */
        .container {
            max-width: 500px;
            padding: 40px;
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.4);
            text-align: center;
            color: #fff;
            position: relative;
            z-index: 2;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .container:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.6);
        }

        h1 {
            font-family: 'Playfair Display', serif;
            font-weight: 700;
            margin-bottom: 15px;
            color: #fff;
            font-size: 3rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        p {
            font-size: 18px;
            font-weight: 500;
            opacity: 0.9;
            color: #ddd;
        }

        /* 🔘 Button Styles */
        .btn {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 30px;
            transition: all 0.3s ease-in-out;
            margin-bottom: 10px;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .btn-primary {
            background: linear-gradient(135deg, #8EC5FC, #E0C3FC);
            border: none;
            color: white;
            box-shadow: 0px 4px 10px rgba(142, 197, 252, 0.4);
        }

        .btn-primary:hover {
            background: linear-gradient(135deg, #E0C3FC, #8EC5FC);
            transform: scale(1.05);
            box-shadow: 0px 6px 15px rgba(142, 197, 252, 0.6);
        }

        /* 🌈 Hover Effect for Buttons */
        .btn::before {
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

        .btn:hover::before {
            transform: translate(-50%, -50%) scale(1);
        }

        .register-link {
            font-size: 18px;
            font-weight: bold;
            color: #8EC5FC;
            text-decoration: none;
            transition: color 0.3s ease-in-out;
        }

        .register-link:hover {
            color: #E0C3FC;
        }

        /* 🌟 Luxurious Hover Effect for Links */
        .register-link::after {
            content: '';
            display: block;
            width: 0;
            height: 2px;
            background: #E0C3FC;
            transition: width 0.3s ease-in-out;
        }

        .register-link:hover::after {
            width: 100%;
        }

        /* ✨ Floating Books Animation */
        @keyframes float {
            0% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0); }
        }

        .floating-books {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        .floating-books img {
            position: absolute;
            width: 50px;
            animation: float 6s ease-in-out infinite;
        }

        .floating-books img:nth-child(1) { top: 10%; left: 5%; animation-delay: 0s; }
        .floating-books img:nth-child(2) { top: 20%; left: 80%; animation-delay: 2s; }
        .floating-books img:nth-child(3) { top: 50%; left: 20%; animation-delay: 4s; }
        .floating-books img:nth-child(4) { top: 70%; left: 70%; animation-delay: 6s; }
    </style>
</head>
<body>

    <!-- 🌟 Particles Background -->
    <div class="particles"></div>

    <!-- 📚 Floating Books -->
    <div class="floating-books">
        <img src="https://img.icons8.com/color/96/000000/book.png" alt="Book">
        <img src="https://img.icons8.com/color/96/000000/book.png" alt="Book">
        <img src="https://img.icons8.com/color/96/000000/book.png" alt="Book">
        <img src="https://img.icons8.com/color/96/000000/book.png" alt="Book">
    </div>

    <!-- 💎 Main Container -->
    <div class="container">
        <h1>📚 Welcome to Online Book Store </h1>
        <p>Discover, Read, and Buy Your Favorite Books</p>
        <a href="/login" class="btn btn-primary mt-3">Login</a>
        <br>
        <a href="/register" class="register-link">New User? Register Here</a>
    </div>

</body>
</html>