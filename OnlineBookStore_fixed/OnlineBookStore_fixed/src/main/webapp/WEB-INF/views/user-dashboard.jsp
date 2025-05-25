<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Dashboard</title>

    <!-- ✅ Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- ✅ FontAwesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <!-- ✅ Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">

    <style>
        /* 🌟 Animated Gradient Background */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298, #6a11cb);
            background-size: 300% 300%;
            animation: gradientAnimation 10s ease infinite;
            color: white;
            padding: 20px;
            margin: 0;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* 💎 Dashboard Container */
        .dashboard-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            margin: 20px auto;
            max-width: 1000px;
        }

        /* ✨ Heading */
        h2 {
            font-family: 'Playfair Display', serif;
            font-weight: bold;
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /* 🌈 Profile & Cart Buttons */
        .profile-btn, .cart-btn {
            display: inline-block;
            text-decoration: none;
            font-size: 18px;
            padding: 12px 24px;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            transition: all 0.3s ease-in-out;
            margin-bottom: 20px;
            margin-right: 10px;
        }

        .profile-btn:hover, .cart-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        /* 🔘 Book Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        th {
            background: rgba(255, 255, 255, 0.2);
            font-weight: bold;
            color: white;
        }

        td {
            color: #ddd;
        }

        /* ✨ Add to Cart Button */
        .add-to-cart-btn {
            background: rgba(106, 17, 203, 0.2);
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .add-to-cart-btn:hover {
            background: rgba(106, 17, 203, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>

    <!-- 💎 Dashboard Container -->
    <div class="dashboard-container">
        <h2>Welcome, ${user.username}! <i class="fas fa-smile"></i></h2>

        <!-- 🌈 Profile and Cart Buttons -->
        <div>
            <a href="/user/profile" class="profile-btn"><i class="fas fa-user"></i> View Profile</a>
            <a href="/cart/view?userId=${user.userId}" class="cart-btn"><i class="fas fa-shopping-cart"></i> View Cart</a>
        </div>

        <!-- 🌟 Book List -->
        <h2>Available Books</h2>
        <table>
            <tr>
                <th>Title</th><th>Author</th><th>Price</th><th>Add to Cart</th><th>Read</th>
            </tr>
			<c:forEach var="book" items="${books}">
			    <tr>
			        <td>${book.title}</td>
			        <td>${book.author}</td>
			        <td>$${book.price}</td>

			        <!-- ✅ Add to Cart Button -->
			        <td>
			            <form action="/cart/add" method="post">
			                <input type="hidden" name="bookId" value="${book.bookId}">
			                <input type="hidden" name="userId" value="${userId}">
			                <button type="submit" class="add-to-cart-btn">
			                    <i class="fas fa-cart-plus"></i> Add to Cart
			                </button>
			            </form>
			        </td>

			        <!-- ✅ Read PDF Button (Only if PDF Exists) -->
					<td>
					    <c:choose>
					        <c:when test="${not empty book.pdfPath}">
					            <a href="/books/readPdf?bookId=${book.bookId}" class="btn btn-outline-light">📖 Read PDF</a>
					        </c:when>
					        <c:otherwise>
					            <span class="text-warning">No PDF Available</span>
					        </c:otherwise>
					    </c:choose>
					</td>

			    </tr>
				<td>
				    <a href="/books/${book.bookId}" class="btn btn-outline-info">
				        <i class="fas fa-info-circle"></i> View Details
				    </a>
				</td>

			</c:forEach>
        </table>
    </div>

</body>
</html>
