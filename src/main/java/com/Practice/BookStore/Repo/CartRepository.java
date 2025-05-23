package com.Practice.BookStore.Repo;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import com.Practice.BookStore.Entity.Book;
import com.Practice.BookStore.Entity.Cart;
import com.Practice.BookStore.Entity.Users;

public interface CartRepository extends JpaRepository<Cart, Long> {
	Optional<Cart> findByUserAndBook(Users user, Book book);
	List<Cart> findByUser(Users user);
	void deleteByUser(Users user);
	List<Cart> findByUserUserId(Long userId);
	@Transactional 
	void deleteByUserUserId(Long userId);

}
