package com.CSC340.BookNexus.mvc.controller;

import com.CSC340.BookNexus.Author.Author;
import com.CSC340.BookNexus.Author.AuthorService;
import com.CSC340.BookNexus.Book.Book;
import com.CSC340.BookNexus.Book.BookService;
import com.CSC340.BookNexus.Library.Library;
import com.CSC340.BookNexus.Library.LibraryService;
import com.CSC340.BookNexus.Review.ReviewService;
import com.CSC340.BookNexus.Review.Review;
import com.CSC340.BookNexus.Subscription.SubscriptionService;

//import java.util.List;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.List;
import com.CSC340.BookNexus.Subscription.Subscription;
//import java.time.LocalDateTime;


@Controller
@RequestMapping("/authors")
public class AuthorMvcController {
    private final AuthorService authorService;
    private final BookService bookService;
    private final LibraryService libraryService;
    private final ReviewService reviewService;
    private final SubscriptionService subscriptionService;

    public AuthorMvcController(AuthorService authorService, BookService bookService, LibraryService libraryService, ReviewService reviewService, SubscriptionService subscriptionService) {
        this.authorService = authorService;
        this.bookService = bookService;
        this.libraryService = libraryService;
        this.reviewService = reviewService;
        this.subscriptionService = subscriptionService;
    }

    @GetMapping("/signup")
    public String signupForm(Model model) {
        model.addAttribute("author", new Author());
        return "author/signup";
    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute Author author) {
        authorService.createAuthor(author);
        return "redirect:/signin";
    }

    @PostMapping("/signin")
    public String signin(@RequestParam String email, @RequestParam String password, HttpSession session) {
        try {
            Author author = authorService.authenticate(email, password);
            session.setAttribute("authorId", author.getId());
            return "redirect:/authors/dashboard";
        } catch (Exception e) {
            return "redirect:/signin?error";
        }
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }
        Author author = authorService.getAuthorById(authorId);
        model.addAttribute("author", author);

        // Load recent reviews and subscriptions for a richer dashboard
        List<Review> allReviews = reviewService.getReviewsByAuthor(author);
        int reviewsCount = allReviews == null ? 0 : allReviews.size();
        List<Review> recentReviews = (allReviews != null && allReviews.size() > 3) ? allReviews.subList(0, 3) : allReviews;
        model.addAttribute("reviewsCount", reviewsCount);
        model.addAttribute("reviewsRecent", recentReviews);

        List<Subscription> allSubs = subscriptionService.getSubscriptionsByAuthor(author);
        int subsCount = allSubs == null ? 0 : allSubs.size();
        List<Subscription> recentSubs = (allSubs != null && allSubs.size() > 3) ? allSubs.subList(0, 3) : allSubs;
        model.addAttribute("subscriptionsCount", subsCount);
        model.addAttribute("subscriptionsRecent", recentSubs);
        return "author/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("authorId");
        return "redirect:/";
    }

    @GetMapping("/library/setup")
    public String setupFarmForm(HttpSession session, Model model) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        if (author.getLibrary() != null) {
            return "redirect:/authors/dashboard";
        }

        return "author/setup-library";
    }

    @PostMapping("/library/setup")
    public String setupLibrary(@RequestParam String libraryName,
                          @RequestParam BigDecimal price,
                          @RequestParam(required = false) String description,
                          HttpSession session) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        if (author.getLibrary() != null) {
            return "redirect:/authors/dashboard";
        }

        Library library = new Library();
        library.setLibraryName(libraryName);
        library.setPrice(price);
        library.setDescription(description);
        library.setAuthor(author);

        libraryService.createLibrary(library);

        return "redirect:/authors/dashboard";
    }

    @GetMapping("/profile/edit")
    public String editProfileForm(HttpSession session, Model model) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        model.addAttribute("author", author);
        return "author/edit-profile";
    }

    @PostMapping("/profile/edit")
    public String updateProfile(@RequestParam String name,
                              @RequestParam String email,
                              @RequestParam String currentPassword,
                              @RequestParam(required = false) String newPassword,
                              HttpSession session,
                              Model model) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        try {
            Author author = authorService.getAuthorById(authorId);
            authorService.authenticate(author.getEmail(), currentPassword);

            Author updatedAuthor = new Author();
            updatedAuthor.setName(name);
            updatedAuthor.setEmail(email);
            updatedAuthor.setPassword(newPassword != null && !newPassword.trim().isEmpty()
                ? newPassword : author.getPassword());

            authorService.updateAuthor(authorId, updatedAuthor);
            return "redirect:/authors/dashboard";
        } catch (Exception e) {
            model.addAttribute("author", authorService.getAuthorById(authorId));
            model.addAttribute("error", "Invalid current password");
            return "author/edit-profile";
        }
    }

    @GetMapping("/library/edit")
    public String editLibraryForm(HttpSession session, Model model) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        if (author.getLibrary() == null) {
            return "redirect:/authors/dashboard";
        }

        model.addAttribute("author", author);
        return "author/edit-library";
    }

    @PostMapping("/library/edit")
    public String updateLibrary(@RequestParam String libraryName,
                           @RequestParam BigDecimal price,
                           @RequestParam(required = false) String description,
                           HttpSession session) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        if (author.getLibrary() == null) {
            return "redirect:/authors/dashboard";
        }

        Library library = author.getLibrary();
        library.setLibraryName(libraryName);
        library.setPrice(price);
        library.setDescription(description);
        libraryService.updateLibrary(library.getId(), library);

        return "redirect:/authors/dashboard";
    }

    @PostMapping("/library/delete")
    public String deleteLibrary(HttpSession session) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        if (author.getLibrary() == null) {
            return "redirect:/authors/dashboard";
        }

        Long libraryId = author.getLibrary().getId();
        
        // First, clear the reference from author to library
        author.setLibrary(null);
        authorService.updateAuthor(authorId, author);
        
        // Then delete the library
        libraryService.deleteLibrary(libraryId);

        return "redirect:/authors/dashboard";
    }

    @GetMapping("/books/{id}/edit")
    public String editBookForm(@PathVariable Long id, HttpSession session, Model model) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        Book book = bookService.getBookById(id);
        // Verify that this book belongs to the author
        if (book.getAuthor().getId() != author.getId()) {
            return "redirect:/authors/dashboard";
        }

        model.addAttribute("book", book);
        return "author/edit-book";
    }

    @PostMapping("/books/{id}/edit")
    public String updateBook(@PathVariable Long id,
                                @RequestParam String title,
                                @RequestParam String description,
                                HttpSession session) {
            Long authorId = (Long) session.getAttribute("authorId");
            if (authorId == null) {
                return "redirect:/signin";
            }
    
            Author author = authorService.getAuthorById(authorId);
            Book book = bookService.getBookById(id);

            // Verify that this book belongs to the author
            if (book.getAuthor().getId() != author.getId()) {
                return "redirect:/authors/dashboard";
            }
    
            book.setTitle(title);
            book.setDescription(description);
            bookService.updateBook(id, book);
    
            return "redirect:/authors/dashboard";
    }
    
    @GetMapping("/books/new")
    public String newBookForm(HttpSession session, Model model) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        if (author.getLibrary() == null) {
            return "redirect:/authors/dashboard";
        }

        model.addAttribute("author", author);
        return "author/new-book";
    }
    
    @PostMapping("/books/new")
    public String createBook(@RequestParam String title,
                             @RequestParam String description,
                             HttpSession session) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        if (author.getLibrary() == null) {
            return "redirect:/authors/dashboard";
        }

        Book book = new Book();
        book.setTitle(title);
        book.setDescription(description);
        book.setAuthor(author);
        book.setLibrary(author.getLibrary());
        
        bookService.createBook(book);

        return "redirect:/authors/dashboard";
    }

    @GetMapping("/reviews")
    public String listReviews(HttpSession session, Model model) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        model.addAttribute("author", author);
        model.addAttribute("reviews", reviewService.getReviewsByAuthor(author));
        return "author/reviews";
    }

    @GetMapping("/reviews/{id}")
    public String viewReview(@PathVariable Long id, HttpSession session, Model model) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        model.addAttribute("author", author);

        Review review = reviewService.getReviewById(id);
        // ensure the review belongs to one of the author's books
        if (review.getBook().getAuthor() == null || !review.getBook().getAuthor().getId().equals(author.getId())) {
            return "redirect:/authors/dashboard";
        }

        model.addAttribute("review", review);
        return "author/review-detail";
    }

    @PostMapping("/reviews/{id}/respond")
    public String respondToReview(@PathVariable Long id, @RequestParam String response, HttpSession session) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        Review review = reviewService.getReviewById(id);
        if (review.getBook().getAuthor() == null || !review.getBook().getAuthor().getId().equals(author.getId())) {
            return "redirect:/authors/dashboard";
        }

        reviewService.addAuthorResponse(id, response);
        return "redirect:/authors/reviews";
    }

    @GetMapping("/subscriptions")
    public String listSubscriptions(HttpSession session, Model model) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        model.addAttribute("author", author);
        model.addAttribute("subscriptions", subscriptionService.getSubscriptionsByAuthor(author));
        return "author/subscriptions";
    }

    @PostMapping("/subscriptions/{id}/cancel")
    public String cancelSubscriptionMvc(@PathVariable Long id, HttpSession session) {
        Long authorId = (Long) session.getAttribute("authorId");
        if (authorId == null) {
            return "redirect:/signin";
        }

        Author author = authorService.getAuthorById(authorId);
        // verify ownership: subscription's library must belong to this author
        try {
            com.CSC340.BookNexus.Subscription.Subscription subscription = subscriptionService.getSubscriptionById(id);
            if (subscription.getLibrary() == null || subscription.getLibrary().getAuthor() == null || !subscription.getLibrary().getAuthor().getId().equals(author.getId())) {
                return "redirect:/authors/dashboard";
            }
            subscriptionService.cancelSubscription(id);
        } catch (Exception e) {
            // ignore/not found => redirect
        }

        return "redirect:/authors/subscriptions";
    }

}
