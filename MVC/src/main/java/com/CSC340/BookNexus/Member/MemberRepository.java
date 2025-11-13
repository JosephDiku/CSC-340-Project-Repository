package com.CSC340.BookNexus.Member;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository; // Importing JpaRepository to enable CRUD operations
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {

    List<Member> findByEmailContaining(String email);
    Optional<Member> findByEmail(String email);
    boolean existsByEmail(String email); // Method to check if a member exists by email
    
}
