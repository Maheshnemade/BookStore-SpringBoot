package com.Practice.BookStore.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Practice.BookStore.Repo.BookRepository;
import com.Practice.BookStore.Repo.UsersRepository;

@Controller
public class SearchController {

	@Autowired
	private BookRepository bookRepository;

	@Autowired
	private UsersRepository usersRepository;

	// ✅ General Search Handler (Redirects to Books or Users based on Results)
	@GetMapping("/search")
	public String search(@RequestParam String query, Model model) {
		var books = bookRepository.findByTitleContainingIgnoreCase(query);
		var users = usersRepository.findByUsernameContainingIgnoreCase(query);

		model.addAttribute("books", books);
		model.addAttribute("users", users);

		// ✅ If books exist, show books page
		if (!books.isEmpty()) {
			return "search-results"; // search-results.jsp (For books)
		}

		// ✅ If users exist, show users page
		if (!users.isEmpty()) {
			return "search-users"; // search-users.jsp (For users)
		}

		// ✅ If nothing is found, redirect to a general "no results" page
		return "search-no-results"; // Create a simple page that says "No results found"
	}
}
