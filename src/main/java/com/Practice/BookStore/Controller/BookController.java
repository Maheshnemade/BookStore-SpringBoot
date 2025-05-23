package com.Practice.BookStore.Controller;


import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Practice.BookStore.Entity.Book;
import com.Practice.BookStore.Entity.Users;
import com.Practice.BookStore.Repo.BookRepository;
import com.Practice.BookStore.Repo.UsersRepository;

@Controller
public class BookController {
	
	
	  
    @Autowired
    private BookRepository bookRepository;
    
    @Autowired
    private UsersRepository usersRepository;

    // Show all books for users
    @GetMapping("/books")
    public String showAllBooks(Model model) {
        model.addAttribute("books", bookRepository.findAll());
        return "books"; // books.jsp (User view)
    }

    // Show book details
    @GetMapping("/books/{bookId}")  // ✅ Maps `/books/2`
    public String showBookDetails(@PathVariable Long bookId, Principal principal, Model model) {
        if (principal == null) {
            return "redirect:/login?error=notAuthenticated"; // Redirect if not logged in
        }

        String username = principal.getName();
        Users user = usersRepository.findByUsername(username).orElse(null);
            
        if (user == null) {
            return "redirect:/login?error=userNotFound"; // Redirect if user not found
        }

        model.addAttribute("userId", user.getUserId()); // ✅ Pass userId to JSP
        model.addAttribute("book", bookRepository.findById(bookId).orElse(null));

        return "book-detail"; // ✅ Load book-details.jsp
    }

    // Show book list for admin
    @GetMapping("/admin/books")
    public String showBooksForAdmin(Model model) {
        model.addAttribute("books", bookRepository.findAll());
        return "admin-books"; // admin-books.jsp
    }

    // Show add book form
    @GetMapping("/admin/book/add")
    public String showAddBookPage() {
        return "add-books"; // add-book.jsp
    }

    // Process adding a new book
    @PostMapping("/admin/book/add")
    public String addBook(@ModelAttribute Book book) {
        bookRepository.save(book); // Save new book
        return "redirect:/admin/dashboard?success=bookAdded"; // Redirect to dashboard
    }

    // Show edit book form
    @GetMapping("/admin/book/edit/{id}")
    public String showEditBookPage(@PathVariable Long id, Model model) {
        model.addAttribute("book", bookRepository.findById(id).orElse(null));
        return "edit-books"; // edit-book.jsp
    }

    // Process book edit
    @PostMapping("/admin/book/edit/{id}")
    public String editBook(@PathVariable Long id, @ModelAttribute Book book) {
        book.setBookId(id); // Match the correct parameter name
        bookRepository.save(book);
        return "redirect:/admin/books";
    }

    // Delete book (Confirmation required)
    @PostMapping("/admin/book/delete/{id}")
    public String deleteBook(@PathVariable Long id) {
        bookRepository.deleteById(id);
        return "redirect:/admin/books";
    }
    @Value("${book.pdf.storage.path}")
    private String pdfStoragePath;

    @GetMapping("/books/readPdf")
    public ResponseEntity<Resource> readPdf(@RequestParam Long bookId) {
        try {
            // ✅ Find the book in the database
            Book book = bookRepository.findById(bookId).orElse(null);

            if (book == null || book.getPdfPath() == null) {
                return ResponseEntity.notFound().build(); // No PDF available
            }

            // ✅ Construct the file path
            Path filePath = Paths.get(pdfStoragePath).resolve(book.getPdfPath()).normalize();
            Resource resource = new UrlResource(filePath.toUri());

            if (!resource.exists()) {
                return ResponseEntity.notFound().build(); // PDF file not found
            }
 
            // ✅ Return the PDF as a downloadable file
            return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + book.getPdfPath() + "\"")
                .body(resource);
            
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}
