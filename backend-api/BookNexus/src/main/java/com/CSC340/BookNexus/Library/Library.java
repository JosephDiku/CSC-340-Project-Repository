package com.CSC340.BookNexus.Library;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import com.CSC340.BookNexus.Author.Author;

@Data
@NoArgsConstructor
@Entity
@Table(name = "libraries")
public class Library {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "author_id", nullable = false)
    @JsonIgnoreProperties("library")
    private Author author;

    @NotBlank
    @Column(nullable = false)
    private String libraryName;

    @Column(columnDefinition = "TEXT")
    private String description;


    //have to map the library to subscriptions later
    //also have to map the books class to the library later
}
