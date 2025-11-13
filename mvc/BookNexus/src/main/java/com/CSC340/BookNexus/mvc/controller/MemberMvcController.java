package com.CSC340.BookNexus.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;
import com.CSC340.BookNexus.Member.Member;
import com.CSC340.BookNexus.Member.MemberService;
import com.CSC340.BookNexus.Book.Book;
import com.CSC340.BookNexus.Book.BookService;
import com.CSC340.BookNexus.Review.Review;
import com.CSC340.BookNexus.Review.ReviewService;
import com.CSC340.BookNexus.Subscription.Subscription;
import com.CSC340.BookNexus.Subscription.SubscriptionService;

@Controller
@RequestMapping("/members")
public class MemberMvcController {
    private final MemberService memberService;
    private final BookService bookService;
    private final SubscriptionService subscriptionService;
    private final ReviewService reviewService;
    
    public MemberMvcController(MemberService memberService, BookService bookService,
                               SubscriptionService subscriptionService, ReviewService reviewService) {
        this.memberService = memberService;
        this.bookService = bookService;
        this.subscriptionService = subscriptionService;
        this.reviewService = reviewService;
    }

    @GetMapping("/signup")
    public String showSignupForm(Model model) {
        model.addAttribute("member", new Member());
        return "member/signup";
    }

    @PostMapping("/signup")
    public String processSignup(@ModelAttribute Member member) {
        memberService.createMember(member);
        return "redirect:/signin";
    }

    


}
