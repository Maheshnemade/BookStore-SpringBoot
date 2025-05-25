package com.Practice.BookStore.Service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.Practice.BookStore.Entity.Role;
import com.Practice.BookStore.Entity.Users;
import com.Practice.BookStore.Repo.UsersRepository;

import jakarta.annotation.PostConstruct;

import java.util.Optional;

@Service
public class UserService {

    private final UsersRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UsersRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    // ✅ Register a User (Default Role: USER)
    public Users registerUser(Users user) {
        if (userRepository.findByUsername(user.getUsername()).isPresent()) {
            throw new RuntimeException("Username already exists!");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword())); // Encrypt password
        user.setRole(Role.USER); // Default role
        return userRepository.save(user);
    }

    // ✅ Register an Admin (Only an Admin can do this)
    public Users registerAdmin(Users newAdmin) {
        // Get the authenticated user
        Users loggedInUser = getLoggedInUser();

        // Ensure the logged-in user is an admin
        if (loggedInUser.getRole() != Role.ADMIN) {
            throw new RuntimeException("Only admins can create new admins!");
        }

        if (userRepository.findByUsername(newAdmin.getUsername()).isPresent()) {
            throw new RuntimeException("Username already exists!");
        }

        newAdmin.setPassword(passwordEncoder.encode(newAdmin.getPassword())); // Encrypt password
        newAdmin.setRole(Role.ADMIN); // Assign ADMIN role
        return userRepository.save(newAdmin);
    }

    // ✅ User Login
    public Users loginUser(String username, String password) {
        Users user = userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found!"));

        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new RuntimeException("Invalid password!");
        }
        return user;
    }

    // ✅ Get Logged-in User
    public Users getLoggedInUser() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        return userRepository.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found!"));
    }
    @Value("${admin.username}")  // ✅ Read from properties file
    private String adminUsername;

    @Value("${admin.password}")
    private String adminPassword;

    @Value("${admin.role}")
    private String adminRole;


    @PostConstruct
    public void createAdminIfNotExists() {
        if (userRepository.findByUsername(adminUsername).isEmpty()) { // ✅ Check if admin exists
            Users admin = new Users();
            admin.setUsername(adminUsername);
            admin.setPassword(passwordEncoder.encode(adminPassword)); // ✅ Encrypt password
            admin.setRole(Role.valueOf(adminRole));
            userRepository.save(admin);
            System.out.println("✅ Admin user created: " + adminUsername);
        }
    }
}
