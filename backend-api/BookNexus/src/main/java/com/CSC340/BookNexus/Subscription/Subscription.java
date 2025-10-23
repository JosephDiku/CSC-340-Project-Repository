package com.CSC340.BookNexus.Subscription;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

import java.time.LocalDateTime;

import com.CSC340.BookNexus.Member.Member;

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

    // DO NOT FORGET TO MAP SUBSCRIPTION TO LIBRARY AS WELL

    @NotNull
    @Enumerated(EnumType.STRING) // Limits the values to those defined in the enum
    private SubscriptionType subscriptionType;

    @NotNull
    private LocalDateTime startDate;

    private LocalDateTime endDate;

    private Boolean isActive = true; // New subscriptions are active by default

}
