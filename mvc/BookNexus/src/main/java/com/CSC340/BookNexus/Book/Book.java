package com.CSC340.BookNexus.Book;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.util.ArrayList;
import java.util.List;

import com.CSC340.BookNexus.Library.Library;
import com.CSC340.BookNexus.Review.Review;
import com.CSC340.BookNexus.Author.Author;
import com.CSC340.BookNexus.Member.Member;

@Data
@NoArgsConstructor
@Entity
@Table(name = "books")
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "library_id", nullable = false)
    @JsonIgnoreProperties({"books", "subscriptions"})
    private Library library;

    @NotBlank
    @Column(nullable = false)
    private String title;

    @Column(columnDefinition = "TEXT")
    private String description;

    @ManyToOne
    @JoinColumn(name = "author_id", nullable = false)
    @JsonIgnoreProperties("library")
    private Author author;

    @OneToMany(mappedBy = "book", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("book")
    private List<Review> reviews = new ArrayList<>();

    @ManyToMany
    @JoinTable(
        name = "favorite_books",
        joinColumns = @JoinColumn(name = "book_id"),
        inverseJoinColumns = @JoinColumn(name = "member_id")
    )
    @JsonIgnoreProperties("favoriteBooks")
    private List<Member> favoritedByMembers = new ArrayList<>();
}
