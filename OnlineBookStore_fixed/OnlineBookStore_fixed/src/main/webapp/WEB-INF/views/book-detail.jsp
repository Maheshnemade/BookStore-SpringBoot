<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Book Details</title>

    <!-- ✅ Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- ✅ FontAwesome -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298, #6a11cb);
            background-size: 300% 300%;
            animation: gradientAnimation 10s ease infinite;
            color: white;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .book-details-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            max-width: 600px;
            width: 100%;
            text-align: left;
        }

        h2 {
            font-family: 'Playfair Display', serif;
            font-weight: bold;
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        .book-details p {
            font-size: 18px;
            margin-bottom: 15px;
            color: #ddd;
        }

        .book-details strong {
            color: white;
        }

        .btn-add-to-cart {
            width: 100%;
            padding: 12px;
            font-size: 18px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .btn-add-to-cart:hover {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>

    <div class="book-details-container">
        <h2><i class="fas fa-book"></i> Book Details</h2>

        <div class="book-details">
            <p><strong>Title:</strong> ${book.title}</p>
            <p><strong>Author:</strong> ${book.author}</p>
            <p><strong>Publisher:</strong> ${book.publisher}</p>
            <p><strong>Price:</strong> ₹${book.price}</p>
        </div>

		<form action="/cart/add" method="post" onsubmit="return validateCartRequest()">
		    <input type="hidden" name="bookId" value="${book.bookId}">
		    <input type="hidden" id="userId" name="userId" value="${userId}">
		    <button type="submit" class="btn-add-to-cart">Add to Cart</button>
			<a href="/admin/dashboard" class="btn btn-secondary mt-3">← Back to Dashboard</a>
		</form>

		<script>
		    function validateCartRequest() {
		        let userId = document.getElementById("userId").value;
		        if (!userId || userId.trim() === "") {
		            alert("Error: User ID is missing. Please log in again.");
		            return false;
		        }
		        return true;
		    }
		</script>
    </div>

</body>
</html>
