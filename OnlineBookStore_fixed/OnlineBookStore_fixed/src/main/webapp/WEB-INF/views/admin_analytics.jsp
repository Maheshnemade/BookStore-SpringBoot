<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Analytics</title>

    <!-- ✅ Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- ✅ FontAwesome for Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            background-color: #f4f6f9;
        }
        .analytics-container {
            max-width: 1100px;
            margin: auto;
            padding: 40px;
            text-align: center;
        }
        .card {
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px;
            margin-bottom: 20px;
            color: white;
            font-weight: bold;
        }
        .users-card {
            background: linear-gradient(to right, #007bff, #00c6ff);
        }
        .books-card {
            background: linear-gradient(to right, #28a745, #6ef196);
        }
        .stat-number {
            font-size: 40px;
            font-weight: bold;
        }
        .list-section {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            text-align: left;
            margin-top: 20px;
            height: 400px;
            overflow-y: auto;
        }
        .back-btn {
            background: #ff5733 !important;
            color: white;
            padding: 10px 15px;
            border-radius: 8px;
            text-decoration: none;
            display: inline-block;
            margin-top: 20px;
        }
        .back-btn:hover {
            background: #e04329 !important;
        }
        .search-bar {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .search-bar input {
            width: 40%;
            padding: 6px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        .search-bar button {
            padding: 6px 10px;
        }
    </style>
</head>
<body>

    <div class="analytics-container">
        <h2><i class="fas fa-chart-line"></i> Admin Analytics</h2>

        <!-- ✅ Search Bar -->
		<form action="/search" method="get" class="search-bar">
		    <input type="text" name="query" placeholder="Search users or books..." required>
		    <button type="submit" class="btn btn-primary"><i class="fas fa-search"></i> Search</button>
		</form>

        <!-- ✅ Statistics Cards (Total Users & Total Books) -->
        <div class="row">
            <div class="col-md-6">
                <div class="card users-card">
                    <h4><i class="fas fa-users"></i> Total Users</h4>
                    <p class="stat-number" id="userCount">${totalUsers}</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card books-card">
                    <h4><i class="fas fa-book"></i> Total Books</h4>
                    <p class="stat-number" id="bookCount">${totalBooks}</p>
                </div>
            </div>
        </div>

        <!-- ✅ Users & Books Side by Side -->
        <div class="row">
            <div class="col-md-6">
                <div class="list-section">
                    <h4><i class="fas fa-users"></i> User List</h4>
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr><th>ID</th><th>Username</th></tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}">
                                <tr><td>${user.userId}</td><td>${user.username}</td></tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="col-md-6">
                <div class="list-section">
                    <h4><i class="fas fa-book"></i> Book List</h4>
                    <table class="table table-bordered table-striped">
                        <thead class="table-dark">
                            <tr><th>ID</th><th>Title</th><th>Author</th></tr>
                        </thead>
                        <tbody>
                            <c:forEach var="book" items="${books}">
                                <tr><td>${book.bookId}</td><td>${book.title}</td><td>${book.author}</td></tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <a href="/admin/dashboard" class="btn btn-warning mt-3"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
    </div>

    
  
</body>
</html>
