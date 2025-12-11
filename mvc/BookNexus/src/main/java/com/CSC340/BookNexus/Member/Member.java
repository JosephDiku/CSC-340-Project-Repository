package com.CSC340.BookNexus.Member;


import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

import com.CSC340.BookNexus.Subscription.Subscription;

import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.CSC340.BookNexus.Review.Review;
import com.CSC340.BookNexus.Book.Book;

import jakarta.persistence.Column;

@Entity
@Data // Generates getters, setters, toString, etc. at compile time; no need to manually write them
@NoArgsConstructor
@Table(name = "members")
public class Member {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long memberId;

    @NotBlank
    @Column(nullable = false)
    private String name;

    @Email
    @NotBlank
    @Column(unique = true, nullable = false)
    private String email;

    @NotBlank
    @Column(nullable = false)
    @JsonIgnore
    private String password;

    @OneToMany(mappedBy = "member") // One member can have many subscriptions
    @JsonIgnoreProperties("member")
    private List<Subscription> subscriptions = new ArrayList<>();

    @OneToMany(mappedBy = "member") // One member can have many reviews
    @JsonIgnoreProperties("member")
    private List<Review> reviews = new ArrayList<>();

    @ManyToMany(mappedBy = "favoritedByMembers")
    @JsonIgnoreProperties("favoritedByMembers")
    private List<Book> favoriteBooks = new ArrayList<>();

    public Member(Long memberId) {
        this.memberId = memberId;
    }

}