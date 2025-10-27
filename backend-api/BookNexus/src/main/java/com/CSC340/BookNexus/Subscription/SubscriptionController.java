package com.CSC340.BookNexus.Subscription;

import com.CSC340.BookNexus.Member.MemberService;
import com.CSC340.BookNexus.Library.LibraryService;
import com.CSC340.BookNexus.Author.AuthorService;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/subscriptions")
@RequiredArgsConstructor
public class SubscriptionController {

    private final SubscriptionService subscriptionService;
    private final MemberService memberService;
    private final LibraryService libraryService;
    private final AuthorService authorService;

    @PostMapping
    public ResponseEntity<Subscription> createSubscription(@Valid @RequestBody Subscription subscription) {
        return ResponseEntity.ok(subscriptionService.createSubscription(subscription));
    }

    @PostMapping("/{id}/cancel")
    public ResponseEntity<Subscription> cancelSubscription(@PathVariable Long id) {
        subscriptionService.cancelSubscription(id);
        return ResponseEntity.ok().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Subscription> updateSubscription(@PathVariable Long id, @Valid @RequestBody Subscription subscriptionDetails) {
        return ResponseEntity.ok(subscriptionService.updateSubscription(id, subscriptionDetails));
    }


    @GetMapping("/member/{memberId}")
    public ResponseEntity<List<Subscription>> getMemberSubscriptions(@PathVariable Long memberId) {
        return ResponseEntity.ok(subscriptionService.getSubscriptionsByMember(memberService.getMemberById(memberId)));
    }

    @GetMapping("/library/{libraryId}")
    public ResponseEntity<List<Subscription>> getLibrarySubscriptions(@PathVariable Long libraryId) {
        return ResponseEntity.ok(subscriptionService.getSubscriptionsByLibrary(libraryService.getLibraryById(libraryId)));
    }

    @GetMapping("/author/{authorId}")
    public ResponseEntity<List<Subscription>> getAuthorSubscriptions(@PathVariable Long authorId) { 
        return ResponseEntity.ok(subscriptionService.getSubscriptionsByAuthor(authorService.getAuthorById(authorId)));
    }

}