package com.Practice.BookStore.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Practice.BookStore.Entity.Role;
import com.Practice.BookStore.Entity.Users;
import com.Practice.BookStore.Repo.UsersRepository;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private UsersRepository usersRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/")
    public String showIndexPage() {
        return "index";  // ✅ Loads index.jsp
    }

    @GetMapping("/login")
    public String showLoginPage(@RequestParam(value = "error", required = false) String error, Model model) {
        model.addAttribute("error", error);
        return "login"; // ✅ Loads login.jsp
    }
    @GetMapping("/logout")
    public String logout() {
        return "index"; // Redirect to login page after logout
    }
    
    @GetMapping("/register")
    public String registerUser() {
        return "register"; 
    }
    
    @PostMapping("/register")
    public String registerUser(@RequestParam String username,
                               @RequestParam String password) {
        if (usersRepository.findByUsername(username).isPresent()) {
            return "redirect:/register?error=exists";  // ✅ Prevent duplicate username
        }

        Users user = new Users();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));  // ✅ Hash password
        user.setRole(Role.USER);  // ✅ Assign USER role

        usersRepository.save(user);
        return "redirect:/login?success=registered";  // ✅ Redirect to login after successful registration
    }

    @GetMapping("/password-reset")
    public String showPasswordResetPage() {
        return "password-reset"; // Password reset page
    }
 
    @PostMapping("/password-reset")
    public String resetPassword(@RequestParam String username, 
                                @RequestParam String newPassword) {
        Users user = usersRepository.findByUsername(username).orElse(null);
        if (user != null) {
            user.setPassword(passwordEncoder.encode(newPassword)); // Encrypt new password
            usersRepository.save(user); // Save updated user
        }
        return "redirect:/login"; // Redirect to login page after password reset
    }
}