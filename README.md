📚 Online Book Store Management System
This is a full-stack Java web application built using Spring Boot. It supports role-based access for users and admins, allowing users to browse and add books to their cart, and admins to manage books and users through a secure dashboard.

🎯 Features
👤 User
Register with name, email, mobile number, password

Login and view personalized user dashboard

Browse available books with details (title, author, publisher, price)

Add books to cart and manage cart items

View and remove books from cart

🛠️ Admin
Secure login

Admin dashboard with total books and users count

Add new books with fields: title, author, publisher, price

Edit and delete existing books

View registered users and delete users if needed

Search books and users

Register new admin

🧱 Tech Stack
Java 17, Spring Boot (MVC, Security)

Hibernate, JPA

JSP, JSTL, HTML, CSS, Bootstrap

MySQL

Maven, Embedded Tomcat

📁 Project Structure
rust
Copy
Edit
controller/      -> Spring MVC Controllers
model/           -> Entity classes (User, Book, Cart)
repository/      -> Spring Data JPA Repositories
service/         -> Service layer (Business logic)
config/          -> Security Configuration
WEB-INF/jsp/     -> JSP views (login, dashboard, cart, admin pages)
🗃️ Database
Ensure you have a MySQL database named bookstore_db.

Update your application.properties file with your own database credentials

🚀 Future Enhancements (Planned)
Implement Buy/Checkout functionality from cart

Add payment integration

Export purchase receipts

Book ratings and reviews by users
