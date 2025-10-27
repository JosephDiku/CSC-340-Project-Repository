package com.CSC340.BookNexus.Subscription;

import com.CSC340.BookNexus.Member.Member;
import com.CSC340.BookNexus.Library.Library;
import com.CSC340.BookNexus.Author.Author;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import lombok.RequiredArgsConstructor;
import jakarta.persistence.EntityNotFoundException;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class SubscriptionService {

    private final SubscriptionRepository subscriptionRepository;

    public Subscription createSubscription(Subscription subscription) {
        return subscriptionRepository.save(subscription);
    }

    public Subscription updateSubscription(Long subscriptionId, Subscription subscriptionDetails) {
        Subscription subscription = subscriptionRepository.findById(subscriptionId)
            .orElseThrow(() -> new EntityNotFoundException("Subscription not found"));

        subscription.setActive(subscriptionDetails.isActive());
        subscription.setStartDate(subscriptionDetails.getStartDate());
        subscription.setEndDate(subscriptionDetails.getEndDate());

        return subscriptionRepository.save(subscription);
    }

    public void cancelSubscription(Long subscriptionId) {
        Subscription subscription = subscriptionRepository.findById(subscriptionId)
            .orElseThrow(() -> new EntityNotFoundException("Subscription not found"));

        subscription.setActive(false);
        subscriptionRepository.save(subscription);
    }

    public List<Subscription> getSubscriptionsByMember(Member member) {
        return subscriptionRepository.findByMemberAndActive(member, true);
    }

    public List<Subscription> getSubscriptionsByLibrary(Library library) {
        return subscriptionRepository.findByLibrary(library);
    }

    public List<Subscription> getSubscriptionsByAuthor(Author author) {
        return subscriptionRepository.findByLibraryAuthor(author);
    }
    
}