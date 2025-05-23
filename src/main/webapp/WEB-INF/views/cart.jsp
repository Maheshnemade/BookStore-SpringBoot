<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Your Cart</title>

    <!-- ✅ Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- ✅ FontAwesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <!-- ✅ Custom Styles -->
    <style>
        /* 🌟 Luxurious Background with Gradient Animation */
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72, #2a5298, #6a11cb);
            background-size: 300% 300%;
            animation: gradientAnimation 10s ease infinite;
            color: white;
            padding: 20px;
        }

        @keyframes gradientAnimation {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* 💎 Container for Cart */
        .cart-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            margin: 20px auto;
            max-width: 1000px;
        }

        /* ✨ Heading Style */
        h2 {
            font-family: 'Playfair Display', serif;
            font-weight: bold;
            font-size: 2.5rem;
            margin-bottom: 20px;
            color: white;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
        }

        /* 🌈 Search Bar */
        .search-bar {
            margin-bottom: 20px;
        }

        .search-bar input {
            width: 70%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            font-size: 16px;
        }

        .search-bar button {
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            background: rgba(106, 17, 203, 0.2);
            color: white;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .search-bar button:hover {
            background: rgba(106, 17, 203, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        /* 🌟 Table Styles */
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

        /* 🔘 Button Styles */
        .btn-cart {
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            background: rgba(106, 17, 203, 0.2);
            color: white;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .btn-cart:hover {
            background: rgba(106, 17, 203, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
        }

        /* 🌈 Empty Cart Button */
        .btn-empty-cart {
            background: rgba(220, 53, 69, 0.2);
        }

        .btn-empty-cart:hover {
            background: rgba(220, 53, 69, 0.3);
        }

        /* ✨ Continue Shopping Link */
        .continue-shopping {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: white;
            font-weight: bold;
            transition: color 0.3s ease-in-out;
        }

        .continue-shopping:hover {
            color: #8EC5FC;
        }
    </style>
</head>
<body>

    <div class="cart-container">
        <h2><i class="fas fa-shopping-cart"></i> Your Cart</h2>

        <!-- ✅ Search Books to Add -->
        <div class="search-bar">
            <form action="/search" method="get">
                <input type="text" name="query" placeholder="Search books to add..." required>
                <button type="submit" class="btn-cart">Search</button>
            </form>
        </div>

        <c:if test="${empty cartItems}">
            <p>Your cart is empty.</p>
        </c:if>

        <c:if test="${not empty cartItems}">
            <table>
                <tr>
                    <th>Book</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Action</th>
                </tr>
                <c:set var="totalAmount" value="0"/>
                <c:forEach var="cartItem" items="${cartItems}">
                    <tr>
                        <td>${cartItem.book.title}</td>
                        <td>₹${cartItem.book.price}</td>
                        <td>
                            <form action="/cart/update" method="post">
                                <input type="hidden" name="cartId" value="${cartItem.cartId}">
                                <input type="hidden" name="userId" value="${userId}">
                                <input type="number" name="quantity" value="${cartItem.quantity}" min="1">
                                <button type="submit" class="btn-cart">Update</button>
                            </form>
                        </td>
                        <td>₹${cartItem.book.price * cartItem.quantity}</td>
                        <td>
                            <form action="/cart/remove" method="post">
                                <input type="hidden" name="cartId" value="${cartItem.cartId}">
                                <input type="hidden" name="userId" value="${userId}">
                                <button type="submit" class="btn-cart" onclick="return confirm('Are you sure?')">Remove</button>
                            </form>
                        </td>
                    </tr>
                    <c:set var="totalAmount" value="${totalAmount + (cartItem.book.price * cartItem.quantity)}"/>
                </c:forEach>
            </table>

            <h3>Total: ₹${totalAmount}</h3>

            <form action="/cart/empty" method="post">
                <input type="hidden" name="userId" value="${userId}">
                <button type="submit" class="btn-cart btn-empty-cart">Empty Cart</button>
            </form>
        </c:if>

        <br>
        <a href="/user/dashboard" class="continue-shopping">← Continue Shopping</a>
    </div>

</body>
</html>