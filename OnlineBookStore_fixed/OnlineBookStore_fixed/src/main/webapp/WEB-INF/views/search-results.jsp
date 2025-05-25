<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search Results - Books</title>

    <!-- ✅ Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- ✅ FontAwesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

    <!-- ✅ Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet">

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

        /* 💎 Container for Search Results */
        .results-container {
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

        /* 🌈 Table Styles */
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

        /* 🔘 Action Button Styles */
        .action-btn {
            text-decoration: none;
            color: #6a11cb;
            font-weight: bold;
            padding: 8px 12px;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease-in-out;
        }

        .action-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            color: #8EC5FC;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        /* 🌟 No Results Message */
        .no-results {
            font-size: 18px;
            font-weight: bold;
            color: #ddd;
            text-align: center;
            margin: 20px 0;
        }

        /* 🎨 Back Button Styles */
        .back-btn {
            display: inline-block;
            text-decoration: none;
            font-size: 18px;
            padding: 10px 20px;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.2);
            color: white;
            transition: all 0.3s ease-in-out;
        }

        .back-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

    <div class="results-container">
        <h2><i class="fas fa-search"></i> Book Search Results</h2>

        <c:choose>
            <c:when test="${not empty books}">
                <table>
                    <tr>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                    <c:forEach var="book" items="${books}">
                        <tr>
                            <td>${book.title}</td>
                            <td>${book.author}</td>
                            <td>$${book.price}</td>
                            <td>
                                <a href="/books/${book.bookId}" class="action-btn">
                                    <i class="fas fa-eye"></i> View Details
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <p class="no-results">No books found for your search. <i class="fas fa-book"></i></p>
            </c:otherwise>
        </c:choose>

        <a href="/books" class="back-btn">
            <i class="fas fa-arrow-left"></i> Back to Book List
        </a>
    </div>

</body>
</html>