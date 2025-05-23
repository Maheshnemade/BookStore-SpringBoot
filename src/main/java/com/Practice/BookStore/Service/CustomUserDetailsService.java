package com.Practice.BookStore.Service;

import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.Practice.BookStore.Entity.Users;
import com.Practice.BookStore.Repo.UsersRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UsersRepository usersRepository;
    private final PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(); // ✅ Ensure BCrypt is used

    public CustomUserDetailsService(UsersRepository usersRepository) {
        this.usersRepository = usersRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Users user = usersRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        System.out.println("🔄 Loading User: " + username + " with Role: " + user.getRole()); // Debugging

        return User.builder()
                .username(user.getUsername())
                .password(user.getPassword()) // ✅ Uses stored hashed password
                .roles(user.getRole().name().replace("ROLE_", "")) // ✅ Fix: Removes extra "ROLE_"
                .build();
    }
}
