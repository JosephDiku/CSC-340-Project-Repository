package com.CSC340.BookNexus.Member;


import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;

import com.CSC340.BookNexus.Subscription.Subscription;

import lombok.Data;
import lombok.NoArgsConstructor;

import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import jakarta.persistence.Column;

@Entity
@Data
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
    private String password;

    @OneToMany(mappedBy = "member") // One member can have many subscriptions
    @JsonIgnoreProperties
    private List<Subscription> subscriptions = new ArrayList<>();

    public Member(Long memberId) {
        this.memberId = memberId;
    }
   


}
