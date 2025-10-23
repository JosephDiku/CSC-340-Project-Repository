package com.CSC340.BookNexus.Library;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/libraries")
@RequiredArgsConstructor
public class LibraryController {
     private final LibraryService libraryService;

    @GetMapping("/{id}")
    public ResponseEntity<Library> getLibrary(@PathVariable Long id) {
        return ResponseEntity.ok(libraryService.getLibraryById(id));
    }

    @GetMapping
    public ResponseEntity<List<Library>> getAllLibraries() {
        return ResponseEntity.ok(libraryService.getAllLibraries());
    }

    @PostMapping
    public ResponseEntity<Library> createLibrary(@Valid @RequestBody Library library) {
        return ResponseEntity.ok(libraryService.createLibrary(library));
    }

    @PutMapping("/{id}")
    public ResponseEntity<Library> updateLibrary(@PathVariable Long id, @Valid @RequestBody Library libraryDetails) {
        return ResponseEntity.ok(libraryService.updateLibrary(id, libraryDetails));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteLibrary(@PathVariable Long id) {
        libraryService.deleteLibrary(id);
        return ResponseEntity.ok().build();
    }
}
