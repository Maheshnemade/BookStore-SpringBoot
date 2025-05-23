<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Registration</title>

    <!-- ✅ Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- ✅ FontAwesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <script>
        // ✅ Hide success message after 3 seconds
        window.onload = function() {
            setTimeout(function() {
                let message = document.getElementById("successMessage");
                if (message) {
                    message.style.display = "none";
                    window.history.replaceState({}, document.title, window.location.pathname); // Remove query params
                }
            }, 3000);
        };

        // ✅ Toggle Password Visibility
        function togglePassword() {
            let passwordField = document.getElementById("password");
            let toggleIcon = document.getElementById("toggleIcon");

            if (passwordField.type === "password") {
                passwordField.type = "text";
                toggleIcon.classList.remove("fa-eye");
                toggleIcon.classList.add("fa-eye-slash");
            } else {
                passwordField.type = "password";
                toggleIcon.classList.remove("fa-eye-slash");
                toggleIcon.classList.add("fa-eye");
            }
        }
    </script>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 400px;
            margin-top: 50px;
        }
        .card {
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-control {
            border-radius: 8px;
        }
        .btn-custom {
            background: #007bff;
            color: white;
            width: 100%;
            border-radius: 8px;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background: #0056b3;
        }
        .input-group-text {
            cursor: pointer;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="card">
            <h3 class="text-center mb-4"><i class="fas fa-user-plus"></i> Register New Admin</h3>

            <!-- ✅ Show success message if registration was successful -->
            <c:if test="${param.success == 'true'}">
                <div id="successMessage" class="alert alert-success text-center">
                    ✔ Admin registered successfully!
                </div>
            </c:if>

            <form action="/admin/register" method="post">
                <div class="mb-3">
                    <label class="form-label">Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Password</label>
                    <div class="input-group">
                        <input type="password" id="password" name="password" class="form-control" required>
                        <span class="input-group-text" onclick="togglePassword()">
                            <i id="toggleIcon" class="fas fa-eye"></i>
                        </span>
                    </div>
                </div>

                <input type="hidden" name="role" value="ADMIN">  <!-- ✅ Default role for admin -->

                <button type="submit" class="btn btn-custom"><i class="fas fa-user-check"></i> Register Admin</button>
            </form>

            <div class="text-center mt-3">
                <button class="btn btn-outline-secondary" onclick="window.location.href='/admin/dashboard'">
                    <i class="fas fa-home"></i> Go to Dashboard
                </button>
            </div>
        </div>
    </div>

</body>
</html>
