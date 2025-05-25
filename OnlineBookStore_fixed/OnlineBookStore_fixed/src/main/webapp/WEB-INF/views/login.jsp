<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login - Online Book Store</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /* 🌟 Luxurious Background with Gradient Animation */
        body {
            font-family: 'Poppins', sans-serif;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            overflow: hidden;
            background: linear-gradient(135deg, #1e3c72, #2a5298, #6a11cb);
            background-size: 300% 300%;
            animation: gradientAnimation 10s ease infinite;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* 💎 Glassmorphism Effect for Login Container */
        .login-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            width: 400px;
            text-align: center;
            color: white;
            position: relative;
            z-index: 2;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .login-container:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.5);
        }

        .login-container h2 {
            font-family: 'Playfair Display', serif;
            font-weight: bold;
            color: white;
            font-size: 2.5rem;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /* 🌈 Form Input Styles */
        .form-control {
            background: rgba(255, 255, 255, 0.2);
            border: none;
            border-radius: 8px;
            color: white;
            padding: 12px;
            margin-bottom: 15px;
            transition: all 0.3s ease-in-out;
        }

        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.3);
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.5);
        }

        /* 🔘 Button Styles */
        .btn-login {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            border: none;
            color: white;
            font-weight: bold;
            padding: 12px;
            border-radius: 8px;
            width: 100%;
            transition: all 0.3s ease-in-out;
            position: relative;
            overflow: hidden;
        }

        .btn-login:hover {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(106, 17, 203, 0.6);
        }

        /* 🌟 Hover Effect for Buttons */
        .btn-login::before {
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

        .btn-login:hover::before {
            transform: translate(-50%, -50%) scale(1);
        }

        /* 🌈 Forgot Password Link */
        .forgot-password-link {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
        }

        .forgot-password-link:hover {
            color: white;
            text-decoration: underline;
        }

        /* ✨ Floating Particles Animation */
        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .particles span {
            position: absolute;
            width: 4px;
            height: 4px;
            background: rgba(255, 255, 255, 0.7);
            border-radius: 50%;
            animation: float 5s infinite ease-in-out;
        }

        @keyframes float {
            0% { transform: translateY(0) translateX(0); }
            50% { transform: translateY(-20px) translateX(20px); }
            100% { transform: translateY(0) translateX(0); }
        }

        .particles span:nth-child(1) { top: 10%; left: 20%; animation-delay: 0s; }
        .particles span:nth-child(2) { top: 30%; left: 70%; animation-delay: 2s; }
        .particles span:nth-child(3) { top: 50%; left: 40%; animation-delay: 4s; }
        .particles span:nth-child(4) { top: 70%; left: 80%; animation-delay: 6s; }
    </style>
</head>
<body>

    <!-- ✨ Floating Particles -->
    <div class="particles">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>

    <!-- 💎 Login Container -->
    <div class="login-container">
        <h2>Online Book Store</h2>
        <form action="/doLogin" method="post">
            <div class="mb-3">
                <input type="text" class="form-control" name="username" placeholder="Username" required>
            </div>
            <div class="mb-3">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="btn btn-login">Login</button>
        </form>
        <div class="mt-3">
            <a href="/password-reset" class="forgot-password-link">Forgot Password?</a>
        </div>
    </div>

</body>
</html>