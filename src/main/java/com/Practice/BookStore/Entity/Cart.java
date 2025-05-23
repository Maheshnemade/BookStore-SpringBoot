package com.Practice.BookStore.Entity; 

import jakarta.persistence.*;

@Entity
@Table(name = "carts") // ✅ Consistent table name
public class Cart {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)    
    private Long cartId; // ✅ Matches other entity ID format

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false) // ✅ Matches Users primary key
    private Users user; // ✅ Changed from "users" to "user"

    @ManyToOne
    @JoinColumn(name = "book_id", nullable = false) // ✅ Matches Book primary key
    private Book book;

    private int quantity;

    // ✅ Default Constructor
    public Cart() {}

    // ✅ Parameterized Constructor
    public Cart(Users user, Book book, int quantity) {
        this.user = user;
        this.book = book;
        this.quantity = quantity;
    }

    // ✅ Getters & Setters
    public Long getCartId() {
        return cartId;
    }

    public void setCartId(Long cartId) {
        this.cartId = cartId;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
