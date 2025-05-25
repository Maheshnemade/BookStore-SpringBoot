<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Users</title>

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
            margin-top: 50px;
        }
        .table th {
            background: #007bff;
            color: white;
            text-align: center;
        }
        .role-badge {
            font-size: 14px;
            padding: 5px 10px;
            border-radius: 8px;
        }
        .admin-badge {
            background: #dc3545;
            color: white;
        }
        .user-badge {
            background: #28a745;
            color: white;
        }
        .delete-btn {
            background: #dc3545;
            color: white;
            border: none;
            padding: 6px 12px;
            border-radius: 6px;
            transition: 0.3s;
        }
        .delete-btn:hover {
            background: #b52a37;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2 class="text-center mb-4"><i class="fas fa-users"></i> Manage Users</h2>

        <!-- Show warning if trying to delete the last admin -->
        <c:if test="${param.error == 'lastAdmin'}">
            <div class="alert alert-danger text-center">⚠ At least one admin must be there!</div>
        </c:if>

        <table class="table table-hover text-center">
            <thead>
                <tr>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td>${user.username}</td>
                        <td>
                            <span class="role-badge ${user.role == 'ADMIN' ? 'admin-badge' : 'user-badge'}">
                                ${user.role}
                            </span>
                        </td>
                        <td>
                            <!-- Allow deleting users and admins only if at least one admin remains -->
                            <c:if test="${!(user.role == 'ADMIN' && totalAdmins == 1)}">
                                <form action="/admin/user/delete/${user.userId}" method="post" onsubmit="return confirm('Are you sure?');">
                                    <button type="submit" class="delete-btn"><i class="fas fa-trash"></i> Delete</button>
                                </form>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <div class="text-center mt-4">
            <button class="btn btn-primary" onclick="window.location.href='/admin/dashboard'">
                <i class="fas fa-home"></i> Go to Dashboard
            </button>
        </div>
    </div>

</body>
</html>
