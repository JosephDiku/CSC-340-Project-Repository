package com.CSC340.BookNexus.mvc.controller;

import java.util.List;
import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import jakarta.servlet.http.HttpSession;

import com.CSC340.BookNexus.Member.Member;
import com.CSC340.BookNexus.Member.MemberService;
import com.CSC340.BookNexus.Library.Library;
import com.CSC340.BookNexus.Library.LibraryService;
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
    private final LibraryService libraryService;
    private final BookService bookService;
    private final SubscriptionService subscriptionService;
    private final ReviewService reviewService;
    
    public MemberMvcController(MemberService memberService, LibraryService libraryService,
                               BookService bookService, SubscriptionService subscriptionService,
                               ReviewService reviewService) {
        this.memberService = memberService;
        this.libraryService = libraryService;
        this.bookService = bookService;
        this.subscriptionService = subscriptionService;
        this.reviewService = reviewService;
    }

    @GetMapping("/signup")
    public String signupForm(Model model) {
        model.addAttribute("member", new Member());
        return "member/signup";
    }

    @PostMapping("/signup")
    public String signup(@ModelAttribute Member member) {
        memberService.createMember(member);
        return "redirect:/signin";
    }

    @PostMapping("/signin")
    public String signin(@RequestParam String email, @RequestParam String password, HttpSession session) {
        try{
            Member member = memberService.authenticate(email, password);
            session.setAttribute("memberId", member.getMemberId());
            return "redirect:/members/dashboard";
        } catch (Exception e) {
            return "redirect:/signin?error";
        }
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        Long memberId = (Long) session.getAttribute("memberId");
        if (memberId == null) {
            return "redirect:/signin";
        }
        Member member = memberService.getMemberById(memberId);
        model.addAttribute("member", member);
        return "member/dashboard";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("memberId");
        return "redirect:/";
    }

    @GetMapping("/profile/edit")
    public String editProfileForm(HttpSession session, Model model) {
        Long memberId = (Long) session.getAttribute("memberId");
        if (memberId == null) {
            return "redirect:/signin";
        }

        Member member = memberService.getMemberById(memberId);
        model.addAttribute("member", member);
        return "member/edit-profile";
    }

    @PostMapping("/profile/edit")
    public String updateProfile(@RequestParam String name, @RequestParam String email,
                              @RequestParam String currentPassword,
                              @RequestParam(required = false) String newPassword,
                              HttpSession session,
                              Model model) {
        Long memberId = (Long) session.getAttribute("memberId");
        if (memberId == null) {
            return "redirect:/signin";
        }

        Member member = memberService.getMemberById(memberId);

        try {
            memberService.authenticate(member.getEmail(), currentPassword);

            Member updatedMember = new Member();
            updatedMember.setName(name);
            updatedMember.setEmail(email);
            updatedMember.setPassword(newPassword != null && !newPassword.trim().isEmpty() 
                ? newPassword : member.getPassword());

            memberService.updateMember(memberId, updatedMember);

            return "redirect:/members/dashboard";
        } catch (Exception e) {
            Member originalMember = memberService.getMemberById(memberId);
            model.addAttribute("member", originalMember);
            model.addAttribute("error", "Current password is incorrect.");
            return "member/edit-profile";
        }
    }

    @GetMapping("/libraries")
    public String browseLibraries(Model model) {
        List<Library> availablelibraries = libraryService.getAllLibraries();
        model.addAttribute("libraries", availablelibraries);
        return "member/libraries";
    }

    @GetMapping("/libraries/{libraryId}")
    public String libraryDetails(@PathVariable Long libraryId, Model model, HttpSession session) {
        Long memberId = (Long) session.getAttribute("memberId");
        if (memberId == null) {
            return "redirect:/signin";
        }

        Library library = libraryService.getLibraryById(libraryId);
        model.addAttribute("library", library);
        return "member/library-details";
    }

    @PostMapping("/libraries/{libraryId}/subscribe")
    public String subscribe(@PathVariable Long libraryId, HttpSession session) {
        Long memberId = (Long) session.getAttribute("memberId");
        if (memberId == null) {
            return "redirect:/signin";
        }

        Member member = memberService.getMemberById(memberId);
        Library library = libraryService.getLibraryById(libraryId);

        Subscription subscription = new Subscription();
        subscription.setMember(member);
        subscription.setLibrary(library);
        subscription.setStartDate(LocalDateTime.now());
        subscription.setActive(true);
        subscriptionService.createSubscription(subscription);

        return "redirect:/members/dashboard";
    }

    @GetMapping("/books/{bookId}/review")
    public String reviewForm(@PathVariable Long bookId, HttpSession session, Model model) {
        Long memberId = (Long) session.getAttribute("memberId");
        if (memberId == null) {
            return "redirect:/signin";
        }

        Member member = memberService.getMemberById(memberId);
        Book book = bookService.getBookById(bookId);

        //Check if member is subscribed to the library that book belongs to
        Library library = book.getLibrary();
        boolean hasSubscription = member.getSubscriptions().stream()
            .anyMatch(sub -> sub.getLibrary().getId().equals(library.getId()));

        if (!hasSubscription) {
            return "redirect:/members/dashboard";
        }

        Review review = new Review();
        review.setMember(member);
        review.setBook(book);
        model.addAttribute("review", review);
        model.addAttribute("book", book);
        
        return "member/review-form";
    }

    @PostMapping("/books/{bookId}/review")
    public String submitReview(@PathVariable Long bookId, @ModelAttribute Review review,
                               @RequestParam Double overallRating, @RequestParam(required = false) String comment,
                               HttpSession session) {
        Long memberId = (Long) session.getAttribute("memberId");
        if (memberId == null) {
            return "redirect:/signin";
        }

        Member member = memberService.getMemberById(memberId);
        Book book = bookService.getBookById(bookId);

        review.setMember(member);
        review.setBook(book);
        review.setOverallRating(overallRating);
        review.setComment(comment);
        review.setCreatedAt(LocalDateTime.now());

        reviewService.createReview(review);
        return "redirect:/members/dashboard";
    }
}
