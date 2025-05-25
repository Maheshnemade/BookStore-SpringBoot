package com.Practice.BookStore.Controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class RoleRedirectController {

    @GetMapping("/redirect-after-login")
    public void redirectBasedOnRole(Authentication authentication, HttpServletResponse response) throws IOException {
        if (authentication == null || !authentication.isAuthenticated()) {
            response.sendRedirect("/login?error=true"); // Redirect to login if not authenticated
            return;
        }

        for (GrantedAuthority authority : authentication.getAuthorities()) {
            String role = authority.getAuthority();
            System.out.println("Redirecting user with role: " + role); // Debugging

            if ("ROLE_ADMIN".equals(role)) {
                response.sendRedirect("/admin/dashboard"); // Redirect Admin
                return;
            } else if ("ROLE_USER".equals(role)) {
                response.sendRedirect("/user/dashboard"); // Redirect User
                return;
            }
        }
 
        response.sendRedirect("/"); // If no valid role, go back to login
    }
}