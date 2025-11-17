package com.CSC340.BookNexus.Review;

import com.CSC340.BookNexus.Member.MemberService;
import com.CSC340.BookNexus.Author.AuthorService;
import com.CSC340.BookNexus.Book.Book;
import com.CSC340.BookNexus.Book.BookService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

@RestController
@RequestMapping("/api/reviews")
@RequiredArgsConstructor
public class ReviewController {

    private final ReviewService reviewService;
    private final BookService bookService;
    private final MemberService memberService;
    private final AuthorService authorService;

    @PostMapping
    public ResponseEntity<Review> createReview(@Valid @RequestBody Review review) {
        return ResponseEntity.ok(reviewService.createReview(review));
    }

    @PostMapping("/{id}/author-response")
    public ResponseEntity<Review> addAuthorResponse(@PathVariable Long id, @RequestBody String response) {
        return ResponseEntity.ok(reviewService.addAuthorResponse(id, response));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteReview(@PathVariable Long id) {
        reviewService.deleteReview(id);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/book/{bookId}")
    public ResponseEntity<List<Review>> getBookReviews(@PathVariable Long bookId) {
        return ResponseEntity.ok(reviewService.getReviewsByBook(bookService.getBookById(bookId)));
    }

    @GetMapping("/member/{memberId}")
    public ResponseEntity<List<Review>> getMemberReviews(@PathVariable Long memberId) {
         return ResponseEntity.ok(reviewService.getReviewsByMember(memberService.getMemberById(memberId)));
    }

    @GetMapping("/author/{authorId}")
    public ResponseEntity<List<Review>> getAuthorReviews(@PathVariable Long authorId) {
        return ResponseEntity.ok(reviewService.getReviewsByAuthor(authorService.getAuthorById(authorId)));
    }

    @GetMapping("/book/{bookId}/ratings")
    public ResponseEntity<Map<String, Double>> getBookRatings(@PathVariable Long bookId) {
        Book book = bookService.getBookById(bookId);
        Map<String, Double> ratings = new HashMap<>();
        ratings.put("overall", reviewService.getAverageOverallRating(book));
        return ResponseEntity.ok(ratings);
    }
}