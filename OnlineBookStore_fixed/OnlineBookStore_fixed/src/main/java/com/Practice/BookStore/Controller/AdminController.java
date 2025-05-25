package com.Practice.BookStore.Controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.Practice.BookStore.Entity.Role;
import com.Practice.BookStore.Entity.Users;
import com.Practice.BookStore.Repo.BookRepository;
import com.Practice.BookStore.Repo.CartRepository;
import com.Practice.BookStore.Repo.UsersRepository;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private BookRepository bookRepository;
    
    @Autowired
    private CartRepository cartRepository;

    @Autowired
    private UsersRepository usersRepository;
    
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/dashboard")
    public String showAdminDashboard(Model model) {
        model.addAttribute("books", bookRepository.findAll());
        model.addAttribute("users", usersRepository.findAll());
        return "admin-dashboard"; // admin-dashboard.jsp
    }
    @GetMapping("/analytics")
    public String showAnalytics(Model model) {
        long totalUsers = usersRepository.count();
        long totalBooks = bookRepository.count();

        model.addAttribute("totalUsers", totalUsers);
        model.addAttribute("totalBooks", totalBooks);
        
        model.addAttribute("users", usersRepository.findAll());  // ✅ Add Users List
        model.addAttribute("books", bookRepository.findAll());  // ✅ Add Books List

        return "admin_analytics"; // admin-analytics.jsp
    }
  

    @GetMapping("/users")
    public String showAllUsers(Model model) {
        model.addAttribute("users", usersRepository.findAll());
        model.addAttribute("totalAdmins", usersRepository.countByRole(Role.ADMIN));
        return "admin-users"; // admin-users.jsp
    }

    @Transactional
    @PostMapping("/user/delete/{id}")
    public String deleteUser(@PathVariable Long id) {
        Optional<Users> userToDelete = usersRepository.findById(id);
        if (userToDelete.isPresent()) {
            Users user = userToDelete.get();

            // Only prevent deletion if this user is an ADMIN and the last one
            if (user.getRole() == Role.ADMIN) {
                long adminCount = usersRepository.countByRole(Role.ADMIN);
                if (adminCount <= 1) {
                    return "redirect:/admin/users?error=lastAdmin";
                }
            }
            cartRepository.deleteByUser(user);
            // Proceed with delete
            usersRepository.deleteById(id);
        }

        return "redirect:/admin/users";
    }


    // Show Admin Registration Page
    @GetMapping("/register")
    public String showAdminRegisterPage() {
        return "admin-register";  // ✅ Show the admin registration form
    }

    // Handle Admin Registration
    @PostMapping("/register")
    public String registerAdmin(@RequestParam String username,
                                @RequestParam String password) {
        if (usersRepository.findByUsername(username).isPresent()) {
            return "redirect:/admin/register?error=exists";  // ✅ Prevent duplicate username
        }

        Users admin = new Users();
        admin.setUsername(username);
        admin.setPassword(passwordEncoder.encode(password));  // ✅ Hash password
        admin.setRole(Role.ADMIN);  // ✅ Assign admin role

        usersRepository.save(admin);
        return "redirect:/admin/register?success=true";   // ✅ Redirect to admin panel after success
    }
   
}
