package com.CSC340.BookNexus.Review;

import com.CSC340.BookNexus.Author.Author;
import com.CSC340.BookNexus.Book.Book;
import com.CSC340.BookNexus.Member.Member;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findByBook(Book book);
    List<Review> findByMember(Member member);
    List<Review> findByBookAuthor(Author author);
}