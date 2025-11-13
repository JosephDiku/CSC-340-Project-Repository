package com.CSC340.BookNexus.Library;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.CSC340.BookNexus.Author.Author;

import java.util.Optional;

@Repository
public interface LibraryRepository extends JpaRepository<Library, Long> {
    Optional<Library> findByAuthor(Author author);

    boolean existsByLibraryName(String libraryName);
}