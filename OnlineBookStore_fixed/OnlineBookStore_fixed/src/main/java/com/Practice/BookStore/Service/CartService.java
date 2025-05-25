package com.Practice.BookStore.Service;

import java.util.List;
import org.springframework.stereotype.Service;

import com.Practice.BookStore.Entity.Book;
import com.Practice.BookStore.Entity.Cart;
import com.Practice.BookStore.Entity.Users;
import com.Practice.BookStore.Repo.BookRepository;
import com.Practice.BookStore.Repo.CartRepository;

@Service
public class CartService {

	private final CartRepository cartRepository;
	private final BookRepository bookRepository;
	private final UserService userService; // ✅ Constructor-injected UserService

	public CartService(CartRepository cartRepository, BookRepository bookRepository, UserService userService) {
		this.cartRepository = cartRepository;
		this.bookRepository = bookRepository;
		this.userService = userService;
	}

	public Cart addToCart(Long userId, Long bookId, int quantity) {
		Users user = userService.getLoggedInUser();
		Book book = bookRepository.findById(bookId).orElseThrow(() -> new RuntimeException("Book not found!"));

		Cart cartItem = cartRepository.findByUserAndBook(user, book).orElse(new Cart());

		cartItem.setUser(user);
		cartItem.setBook(book);
		cartItem.setQuantity(cartItem.getQuantity() + quantity);

		return cartRepository.save(cartItem);
	}

	public void removeFromCart(Long bookId) {
		Users user = userService.getLoggedInUser(); // Get logged-in user
		Book book = bookRepository.findById(bookId).orElseThrow(() -> new RuntimeException("Book not found!"));

		Cart cartItem = cartRepository.findByUserAndBook(user, book)
				.orElseThrow(() -> new RuntimeException("Item not in cart!"));

		cartRepository.delete(cartItem);
	}

	public List<Cart> viewCart() {
		Users user = userService.getLoggedInUser(); // Get logged-in user
		return cartRepository.findByUser(user); // Fetch only this user's cart items
	}

	public void clearCart(Long userId) {
		Users user = userService.getLoggedInUser();
		cartRepository.deleteByUser(user);
	}

}
