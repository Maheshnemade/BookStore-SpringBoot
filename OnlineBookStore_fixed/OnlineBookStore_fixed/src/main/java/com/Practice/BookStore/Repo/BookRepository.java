package com.Practice.BookStore.Repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import com.Practice.BookStore.Entity.Book;

public interface BookRepository extends JpaRepository<Book, Long> {

    List<Book> findByTitleContainingIgnoreCase(String title); // Correct method

    void deleteByBookId(Long bookId); // Corrected delete method

	List<Book> findByTitleContainingIgnoreCaseOrAuthorContainingIgnoreCase(String query, String query2);
	
    Optional<Book> findById(Long bookId);

}
