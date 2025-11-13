package com.CSC340.BookNexus.Subscription;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.CSC340.BookNexus.Member.Member;
import com.CSC340.BookNexus.Library.Library;
import com.CSC340.BookNexus.Author.Author;

import java.util.List;

@Repository
public interface SubscriptionRepository extends JpaRepository<Subscription, Long> {

    List<Subscription> findByMemberAndActive(Member member, Boolean isActive);
    List<Subscription> findByLibrary(Library library); // Find subscriptions by library
    List<Subscription> findByLibraryAuthor(Author author); // Find subscriptions by library's author
}    