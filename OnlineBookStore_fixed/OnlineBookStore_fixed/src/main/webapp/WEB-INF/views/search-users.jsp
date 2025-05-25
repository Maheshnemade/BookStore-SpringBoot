<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Search Results - Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #28a745;
            color: white;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .no-results {
            text-align: center;
            color: #777;
            font-size: 18px;
            margin-bottom: 20px;
        }
        .actions {
            text-align: center;
        }
        button {
            background-color: #dc3545;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }
        button:hover {
            background-color: #c82333;
        }
        a {
            display: inline-block;
            margin-top: 10px;
            color: #28a745;
            text-decoration: none;
            font-size: 16px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>User Search Results</h2>
    <c:choose>
        <c:when test="${not empty users}">
            <table>
                <tr>
                    <th>Username</th>
                    <th class="actions">Actions</th>
                </tr>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.username}</td>
                        <td class="actions">
                            <form action="/admin/user/delete/${user.userId}" method="post" onsubmit="return confirm('Are you sure you want to delete this user?');">
                                <button type="submit">Delete User</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:when>
        <c:otherwise>
            <p class="no-results">No users found for your search.</p>
        </c:otherwise>
    </c:choose>
    <a href="/admin/users">Back to User List</a>
</body>
</html>