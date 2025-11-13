package com.CSC340.BookNexus.Review;

import com.CSC340.BookNexus.Author.Author;
import com.CSC340.BookNexus.Book.Book;
import com.CSC340.BookNexus.Member.Member;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.OptionalDouble;

@Service
@RequiredArgsConstructor
@Transactional
public class ReviewService {
    private final ReviewRepository reviewRepository;

    // Fix errors in the createReview method to not do it based on freshness and delivery ratings

    public double getAverageOverallRating(Book book) {
        List<Review> reviews = reviewRepository.findByBook(book);
        OptionalDouble average = reviews.stream()
                .mapToDouble(review -> review.getOverallRating() != null ? review.getOverallRating() : 0.0)
                .average();
        return average.orElse(0.0);
    }


    public Review createReview(Review review) {
        review.setCreatedAt(LocalDateTime.now());
        return reviewRepository.save(review);
    }

    public Review addAuthorResponse(Long id, String response) {
        Review review = reviewRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Review not found"));

        review.setAuthorResponse(response);
        review.setAuthorResponseDate(LocalDateTime.now());
        return reviewRepository.save(review);
    }

    public void deleteReview(Long id) {
        if (!reviewRepository.existsById(id)) {
            throw new EntityNotFoundException("Review not found");
        }
        reviewRepository.deleteById(id);
    }

    public List<Review> getReviewsByBook(Book book) {
        return reviewRepository.findByBook(book);
    }

    public List<Review> getReviewsByMember(Member member) {
        return reviewRepository.findByMember(member);
    }

    public List<Review> getReviewsByAuthor(Author author) {
        return reviewRepository.findByBookAuthor(author);
    }
    
}
