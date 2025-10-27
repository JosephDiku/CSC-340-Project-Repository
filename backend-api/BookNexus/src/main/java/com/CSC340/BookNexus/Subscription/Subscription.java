package com.CSC340.BookNexus.Subscription;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

import com.CSC340.BookNexus.Member.Member;
import com.CSC340.BookNexus.Library.Library;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity
@Table(name = "subscriptions")
public class Subscription {
	
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long subscriptionId;

    @ManyToOne // Many subscriptions can belong to one member
    @JoinColumn(name = "member_id", nullable = false)
    @JsonIgnoreProperties("subscriptions")
    private Member member;

    @ManyToOne
    @JoinColumn(name = library_id, nullable = false)
    @JsonIgnoreProperties("subscriptions")
    private Library library;

    @NotNull
    private LocalDateTime startDate;

    private LocalDateTime endDate;

    private Boolean isActive = true; // New subscriptions are active by default

}
