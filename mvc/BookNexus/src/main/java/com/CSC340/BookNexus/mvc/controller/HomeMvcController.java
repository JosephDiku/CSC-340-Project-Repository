package com.CSC340.BookNexus.mvc.controller;

import com.CSC340.BookNexus.Book.Book;
import com.CSC340.BookNexus.Book.BookService;
import com.CSC340.BookNexus.Library.Library;
import com.CSC340.BookNexus.Library.LibraryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomeMvcController {
    private final LibraryService libraryService;
    private final BookService bookService;

    public HomeMvcController(LibraryService libraryService, BookService bookService) {
        this.libraryService = libraryService;
        this.bookService = bookService;
    }
    @GetMapping("/")
    public String home(Model model) {
        List<Library> featuredLibraries = libraryService.getAllLibraries().stream()
                .limit(3)
                .toList();
        List<Book> featuredBooks = bookService.getAllBooks().stream()
                .limit(3)
                .toList();

        model.addAttribute("libraries", featuredLibraries);
        model.addAttribute("books", featuredBooks);
        return "home";
    }

    @GetMapping("/signup")
    public String signup() {
        return "signup";
    }

    @GetMapping("/signin")
    public String signin() {
        return "signin";
    }
}