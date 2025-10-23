package com.CSC340.BookNexus.Library;

import jakarta.persistence.EntityNotFoundException;
import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
@Transactional
public class LibraryService {
    private final LibraryRepository libraryRepository;

    public Library createLibrary(Library library) {
        if (libraryRepository.existsByLibraryName(library.getLibraryName())) {
            throw new IllegalStateException("Library name already exists");
        }
        return libraryRepository.save(library);
    }

    public Library updateLibrary(Long id, Library libraryDetails) {
        Library library = libraryRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Library not found"));

        if (!library.getLibraryName().equals(libraryDetails.getLibraryName()) &&
                libraryRepository.existsByLibraryName(libraryDetails.getLibraryName())) {
            throw new IllegalStateException("Library name already exists");
        }

        library.setLibraryName(libraryDetails.getLibraryName());
        library.setDescription(libraryDetails.getDescription());

        return libraryRepository.save(library);
    }

    public void deleteLibrary(Long id) {
        if (!libraryRepository.existsById(id)) {
            throw new EntityNotFoundException("Library not found");
        }
        libraryRepository.deleteById(id);
    }

    public Library getLibraryById(Long id) {
        return libraryRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Library not found"));
    }

    public List<Library> getAllLibraries() {
        return libraryRepository.findAll();
    }
}
