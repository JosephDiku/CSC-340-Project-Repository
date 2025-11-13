package com.CSC340.BookNexus.Author;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional
public class AuthorService {
    private final AuthorRepository authorRepository;

    public Author createAuthor(Author author) {
        if (authorRepository.existsByEmail(author.getEmail())) {
            throw new IllegalStateException("Email already registered");
        }
        return authorRepository.save(author);
    }

    public Author updateAuthor(Long id, Author authorDetails) {
        Author author = authorRepository.findById(id)
            .orElseThrow(() -> new EntityNotFoundException("Author not found"));

        author.setName(authorDetails.getName());
        if (!author.getEmail().equals(authorDetails.getEmail()) &&
            authorRepository.existsByEmail(authorDetails.getEmail())) {
            throw new IllegalStateException("Email already registered");
        }
        author.setEmail(authorDetails.getEmail());

        return authorRepository.save(author);
    }

    public Author getAuthorById(Long id) {
        return authorRepository.findById(id)
            .orElseThrow(() -> new EntityNotFoundException("Author not found"));
    }

    public Author getAuthorByEmail(String email) {
        return authorRepository.findByEmail(email)
            .orElseThrow(() -> new EntityNotFoundException("Author not found"));
    }

    public Author authenticate(String email, String password) {
        Author author = authorRepository.findByEmail(email)
                .orElseThrow(() -> new IllegalArgumentException("Invalid email or password"));
        if (!author.getPassword().equals(password)) {
            throw new IllegalArgumentException("Invalid email or password");
        }
        return author;
    }
}
