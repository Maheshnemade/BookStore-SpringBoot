<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Book</title>

    <!-- ✅ Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- ✅ FontAwesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 450px;
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
    </style>
</head>
<body>

    <div class="container">
        <div class="card">
            <h3 class="text-center mb-4"><i class="fas fa-edit"></i> Edit Book</h3>

            <form action="/admin/book/edit/${book.bookId}" method="post">
                <div class="mb-3">
                    <label class="form-label">Title</label>
                    <input type="text" name="title" class="form-control" value="${book.title}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Author</label>
                    <input type="text" name="author" class="form-control" value="${book.author}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Publisher</label>
                    <input type="text" name="publisher" class="form-control" value="${book.publisher}" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Price</label>
                    <input type="number" name="price" step="0.01" class="form-control" value="${book.price}" required>
                </div>

                <button type="submit" class="btn btn-custom"><i class="fas fa-save"></i> Save Changes</button>
            </form>

            <div class="text-center mt-3">
                <button class="btn btn-outline-secondary" onclick="window.location.href='/admin/books'">
                    <i class="fas fa-arrow-left"></i> Back to Books
                </button>
            </di
