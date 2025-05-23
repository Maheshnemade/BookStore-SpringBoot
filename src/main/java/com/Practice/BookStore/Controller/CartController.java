package com.Practice.BookStore.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Practice.BookStore.Entity.Book;
import com.Practice.BookStore.Entity.Cart;
import com.Practice.BookStore.Entity.Users;
import com.Practice.BookStore.Repo.BookRepository;
import com.Practice.BookStore.Repo.CartRepository;
import com.Practice.BookStore.Repo.UsersRepository;
import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private UsersRepository userRepository;

    @Autowired
    private BookRepository bookRepository;

    // ✅ View cart items for a specific user
    @GetMapping("/view")
    public String viewCart(@RequestParam(required = false) Long userId, HttpSession session, Model model) {
        if (userId == null) {
            userId = (Long) session.getAttribute("userId"); // ✅ Use session-stored userId if missing
        }

        if (userId == null) {
            return "redirect:/user/dashboard?error=missingUserId"; // ✅ Redirect if still missing
        }

        List<Cart> cartItems = cartRepository.findByUserUserId(userId);
        model.addAttribute("cartItems", cartItems);
        model.addAttribute("userId", userId);
        return "cart";
    }

    // ✅ Add a book to the cart
    @PostMapping("/add")
    public String addToCart(@RequestParam(required = false) Long userId, @RequestParam Long bookId, HttpSession session) {
        if (userId == null) {
            userId = (Long) session.getAttribute("userId"); // ✅ Get userId from session if missing
        }

        if (userId == null) {
            System.out.println("🚨 ERROR: userId is NULL!");
            return "redirect:/user/dashboard?error=missingUserId";
        }

        Users user = userRepository.findById(userId).orElse(null);
        Book book = bookRepository.findById(bookId).orElse(null);

        if (user == null || book == null) {
            return "redirect:/user/dashboard?error=invalidRequest";
        }

        Optional<Cart> existingCartItem = cartRepository.findByUserAndBook(user, book);
        if (existingCartItem.isPresent()) {
            Cart cartItem = existingCartItem.get();
            cartItem.setQuantity(cartItem.getQuantity() + 1);
            cartRepository.save(cartItem);
        } else {
            Cart newCartItem = new Cart(user, book, 1);
            cartRepository.save(newCartItem);
        }

        return "redirect:/cart/view?userId=" + userId;
    }

    // ✅ Update quantity of a cart item
    @PostMapping("/update")
    public String updateCart(@RequestParam Long cartId, @RequestParam int quantity, @RequestParam Long userId, HttpSession session) {
        if (userId == null) {
            userId = (Long) session.getAttribute("userId"); // ✅ Get userId from session if missing
        }

        Cart cartItem = cartRepository.findById(cartId).orElse(null);
        if (cartItem != null) {
            cartItem.setQuantity(quantity);
            cartRepository.save(cartItem);
        }
        return "redirect:/cart/view?userId=" + userId;
    }

    // ✅ Remove an item from the cart
    @PostMapping("/remove")
    public String removeFromCart(@RequestParam Long cartId, @RequestParam Long userId, HttpSession session) {
        if (userId == null) {
            userId = (Long) session.getAttribute("userId"); // ✅ Get userId from session if missing
        }

        cartRepository.deleteById(cartId);
        return "redirect:/cart/view?userId=" + userId;
    }

    // ✅ Empty the entire cart for a user
    @PostMapping("/empty")
    @Transactional 
    public String emptyCart(@RequestParam Long userId, HttpSession session) {
        if (userId == null) {
            userId = (Long) session.getAttribute("userId"); // ✅ Get userId from session if missing
        }

        if (userId == null) {
            return "redirect:/user/dashboard?error=missingUserId"; // ✅ Redirect if still missing
        }

        cartRepository.deleteByUserUserId(userId); // ✅ Delete all cart items for the user
        return "redirect:/cart/view?userId=" + userId;
    }
}
