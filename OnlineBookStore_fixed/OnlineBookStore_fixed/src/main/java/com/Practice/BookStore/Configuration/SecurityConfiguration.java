package com.Practice.BookStore.Configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.Practice.BookStore.Service.CustomUserDetailsService;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {

	@Autowired
	private CustomUserDetailsService customUserDetailsService;
	
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http 
        .userDetailsService(customUserDetailsService) 
            .authorizeHttpRequests(auth -> auth
                .requestMatchers("/books/**", "/index", "/register", "/password-reset", "/redirect-after-login","/WEB-INF/views/**").permitAll()
                .requestMatchers("/login").permitAll() // ✅ Ensure login page is accessible
                .requestMatchers("/cart/add", "/cart/view", "/cart/update", "/cart/remove", "/cart/clear").hasRole("USER") 
                .requestMatchers("/WEB-INF/**").denyAll() // ❌ Prevent direct access to JSP files
                .requestMatchers("/admin/**").hasRole("ADMIN")
                .requestMatchers("/user/**", "/cart/**", "/books/**").hasRole("USER")
                .anyRequest().authenticated()
            )
            .formLogin(login -> login
                .loginPage("/login") // ✅ Use custom login page
                .loginProcessingUrl("/doLogin") // ✅ Ensure form submits to this
                .defaultSuccessUrl("/redirect-after-login", true)
                .failureUrl("/login?error=true")
                .permitAll()
            )
            .logout(logout -> logout
                .logoutUrl("/logout")
                .logoutSuccessUrl("/")
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID")
                .permitAll()
            )
            .csrf(csrf -> csrf.ignoringRequestMatchers("/books","/user/password-reset","cart/empty","/books","/cart/add","/cart/update", "/cart/remove", "/cart/clear","/admin/**","/admin/book/add","/doLogin", "/logout", "/register"));
 
        return http.build();
    } 

    @Bean   
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }  
}
