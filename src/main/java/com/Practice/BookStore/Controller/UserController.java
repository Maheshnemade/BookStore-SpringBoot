package com.Practice.BookStore.Controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Practice.BookStore.Entity.Users;
import com.Practice.BookStore.Repo.BookRepository;
import com.Practice.BookStore.Repo.UsersRepository;

@Controller
public class UserController {

    @Autowired
    private BookRepository bookRepository;
    
    @Autowired
    private UsersRepository usersRepository;
    @GetMapping("/user/dashboard") 
    public String userDashboard(Principal principal, Model model) {
        if (principal == null) {
            return "redirect:/login?error=notAuthenticated"; // ✅ Redirect if not logged in
        }

        String username = principal.getName(); 
        Users user = usersRepository.findByUsername(username).orElse(null);

        if (user == null) {
            return "redirect:/login?error=userNotFound"; // ✅ Redirect if user does not exist
        }

        model.addAttribute("user", user);  // ✅ Pass the user object
        model.addAttribute("userId", user.getUserId());  // ✅ Pass `userId` separately
        model.addAttribute("books", bookRepository.findAll());

        return "user-dashboard"; // ✅ Load user-dashboard.jsp
    }



    @GetMapping("/book/details")
    public String showBookDetails(@RequestParam Long bookId, Principal principal, Model model) {
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
    
    @GetMapping("/user/profile")
    public String userProfile(Principal principal, Model model) {
        if (principal == null) {
            return "redirect:/login?error=notAuthenticated"; // ✅ Redirect if not logged in
        }

        String username = principal.getName(); 
        Users user = usersRepository.findByUsername(username).orElse(null);

        if (user == null) {
            return "redirect:/login?error=userNotFound"; // ✅ Redirect if user is missing
        }

        model.addAttribute("user", user); // ✅ Pass user details to JSP
        return "user-profile"; // ✅ Load user-profile.jsp
    }
}
