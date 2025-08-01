## 📚 Online Book Store Management System

This is a full-stack Java web application built using **Spring Boot**. It supports **role-based access** for users and admins — allowing users to browse and add books to their cart, and admins to manage books and users through a secure dashboard.

---

### 🎯 Features

#### 👤 User

- Register with name, email, mobile number, password  
- Login and view personalized user dashboard  
- Browse available books with details: title, author, publisher, price  
- Add books to cart and manage cart items  
- View and remove books from cart  

#### 🛠️ Admin

- Secure login  
- Admin dashboard showing total books and total users  
- Add new books (title, author, publisher, price)  
- Edit and delete existing books  
- View registered users and delete if needed  
- Search books and users  
- Register new admin accounts  

---

### 🧱 Tech Stack

- Java 17  
- Spring Boot (MVC, Spring Security)  
- Hibernate, JPA  
- JSP, JSTL, HTML, CSS, Bootstrap  
- MySQL  
- Maven, Embedded Tomcat  

---

### 📁 Project Structure

```
controller/      -> Spring MVC Controllers  
model/           -> Entity classes (User, Book, Cart)  
repository/      -> Spring Data JPA Repositories  
service/         -> Business logic layer  
config/          -> Spring Security Configuration  
WEB-INF/jsp/     -> JSP views (login, dashboard, cart, admin pages)  
```

---

### 🗃️ Database

Make sure you have a MySQL database named:

```
bookstore_db
```

Update your `application.properties` file with your database credentials:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/bookstore_db  
spring.datasource.username=your_username  
spring.datasource.password=your_password  
spring.jpa.hibernate.ddl-auto=update  
```

---

### 🚀 Future Enhancements (Planned)

- Implement Buy/Checkout functionality from the cart   
- Allow book ratings and reviews by users  
- Integrate an AI chatbot for book recommendations and queries  
