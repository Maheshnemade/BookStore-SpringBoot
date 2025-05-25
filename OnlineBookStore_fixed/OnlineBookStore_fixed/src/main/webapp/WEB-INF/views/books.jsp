<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Available Books</title>
</head>
<body>

    <h2>Available Books</h2>

    <!-- ✅ Search Bar -->
    <form action="/search" method="get">
        <input type="text" name="query" placeholder="Search books..." required>
        <button type="submit">Search</button>
    </form>

    <table border="1">
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
                <td>${book.price}</td>
                <td>
                    <!-- ✅ Corrected View Details Link -->
                    <a href="/books/${book.bookId}">View Details</a>
                    
                    <!-- ✅ Fixed Add to Cart: Changed from GET to POST -->
                    <form action="/cart/add" method="post" style="display:inline;">
                        <input type="hidden" name="bookId" value="${book.bookId}">
                        <input type="hidden" name="userId" value="${userId}"> 
                        <button type="submit">Add to Cart</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
