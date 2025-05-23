package com.Practice.BookStore.Repo;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.Practice.BookStore.Entity.Role;
import com.Practice.BookStore.Entity.Users;

public interface UsersRepository extends JpaRepository<Users,Long>{

	Optional<Users> findByUsername(String username);
	 List<Users> findByUsernameContainingIgnoreCase(String username);
	 @Query("SELECT COUNT(u) FROM Users u WHERE u.role = 'ADMIN'")
	 long countByRole(Role role);

}
