/* package removed to avoid 'non-project file' error — place this file inside a proper Java project's source folder (e.g. src/main/java)
   and restore the original package declaration when the file is part of that project */

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Positive;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.CSC340.BookNexus.Author.Author;
import com.CSC340.BookNexus.Book.Book;
import com.CSC340.BookNexus.Subscription.Subscription;

@Data
@NoArgsConstructor
@Entity
@Table(name = "libraries")
public class Library {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank
    @Column(nullable = false)
    private String libraryName;

    @OneToOne
    @JoinColumn(name = "author_id", nullable = false)
    @JsonIgnoreProperties("library")
    private Author author;

    @Column(columnDefinition = "TEXT")
    private String description;

    @NotNull
    @Positive
    private BigDecimal price;

    @OneToMany(mappedBy = "library", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("library")
    private List<Subscription> subscriptions = new ArrayList<>();

    @OneToMany(mappedBy = "library", cascade = CascadeType.ALL)
    @JsonIgnoreProperties("library")
    private List<Book> books = new ArrayList<>();

}
