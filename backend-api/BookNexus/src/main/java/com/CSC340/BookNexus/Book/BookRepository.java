package com.CSC340.BookNexus.Book;

import com.CSC340.BookNexus.Library.Library;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findByLibraryAndAvailable(Library library, boolean available);
    List<Book> findByAvailable(boolean available);
}