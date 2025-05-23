<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add New Book</title>
    
    <!-- ✅ Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- ✅ FontAwesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

</head>
<body class="bg-light">

    <div class="container mt-5">
        <!-- Form Card -->
        <div class="card shadow-lg">
            <div class="card-header bg-primary text-white text-center">
                <h2><i class="fas fa-book"></i> Add New Book</h2>
            </div>
            <div class="card-body">
                <!-- Add Book Form -->
                <form action="/admin/book/add" method="post" class="needs-validation" novalidate>

                    <!-- Title -->
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="title" name="title" placeholder="Title" required>
                        <label for="title"><i class="fas fa-heading"></i> Title</label>
                        <div class="invalid-feedback">Please enter the book title.</div>
                    </div>

                    <!-- Author -->
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="author" name="author" placeholder="Author" required>
                        <label for="author"><i class="fas fa-user-edit"></i> Author</label>
                        <div class="invalid-feedback">Please enter the author's name.</div>
                    </div>

                    <!-- Publisher -->
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="publisher" name="publisher" placeholder="Publisher" required>
                        <label for="publisher"><i class="fas fa-building"></i> Publisher</label>
                        <div class="invalid-feedback">Please enter the publisher's name.</div>
                    </div>

                    <!-- Price -->
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" id="price" name="price" step="0.01" placeholder="Price" required>
                        <label for="price"><i class="fas fa-dollar-sign"></i> Price</label>
                        <div class="invalid-feedback">Please enter a valid price.</div>
                    </div>

                    <!-- Submit Button -->
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-success btn-lg"><i class="fas fa-plus-circle"></i> Add Book</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Back to Dashboard -->
        <div class="text-center mt-4">
            <a href="/admin/dashboard" class="btn btn-secondary"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>

    <!-- ✅ Bootstrap Form Validation Script -->
    <script>
        (function () {
            'use strict';
            var forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>

</body>
</html>
