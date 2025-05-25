package com.Practice.BookStore.Entity;

import jakarta.persistence.*;


@Entity
@Table(name = "books") // ✅ Lowercase for DB compatibility
public class Book {   
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bookId; // ✅ Matches primary key name

    private String title;               
    private String author;
    private String publisher;
    private int price;
    private String pdfPath;

    // ✅ Default Constructor
    public Book() {}

    
    public Book(Long bookId, String title, String author, String publisher, int price, String pdfPath) {
		super();
		this.bookId = bookId;
		this.title = title;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.pdfPath = pdfPath;
	}


	// ✅ Getters & Setters      
    
    public Long getBookId() {
        return bookId;                  
    }

    public String getPdfPath() {
		return pdfPath;
	}


	public void setPdfPath(String pdfPath) {
		this.pdfPath = pdfPath;
	}


	public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public String getTitle() {   
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
