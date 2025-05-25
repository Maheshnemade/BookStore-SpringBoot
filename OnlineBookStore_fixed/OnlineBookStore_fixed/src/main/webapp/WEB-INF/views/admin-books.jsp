<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Books</title>
    
    <!-- ✅ Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body class="bg-light">

    <div class="container mt-5">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="text-primary">📚 Manage Books</h2>
            <a href="/admin/book/add" class="btn btn-success">➕ Add New Book</a>
        </div>

        <!-- Book Table -->
        <div class="card shadow">
            <div class="card-body">
                <table class="table table-hover table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Price</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="book" items="${books}">
                            <tr>
                                <td>${book.title}</td>
                                <td>${book.author}</td>
                                <td>₹${book.price}</td>
                                <td>
                                    <!-- Action Buttons -->
                                    <a href="/admin/book/edit/${book.bookId}" class="btn btn-warning btn-sm">✏ Edit</a>
                                    <form action="/admin/book/delete/${book.bookId}" method="post" class="d-inline"
                                          onsubmit="return confirm('Are you sure you want to delete this book?');">
                                        <button type="submit" class="btn btn-danger btn-sm">🗑 Delete</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Dashboard Button -->
        <div class="text-center mt-4">
            <button onclick="window.location.href='/admin/dashboard'" class="btn btn-secondary">🏠 Go to Dashboard</button>
        </div>
    </div>

</body>
</html>
