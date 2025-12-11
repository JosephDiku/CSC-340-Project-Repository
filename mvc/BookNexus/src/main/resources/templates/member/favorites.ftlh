<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BookNexus - Favorite Books</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .navbar {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            box-shadow: 0 2px 8px rgba(102, 126, 234, 0.15);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
        }

        .card {
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            margin-bottom: 1.5rem;
            border: none;
            border-radius: 1rem;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.15);
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(102, 126, 234, 0.4);
        }

        .greeting-section {
            padding: 2rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 1rem;
            margin-bottom: 2rem;
        }

        .greeting-section h1 {
            margin-bottom: 0.5rem;
        }

        .greeting-section p {
            margin: 0;
            opacity: 0.9;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <i class="bi bi-book"></i> BookNexus
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/"><i class="bi bi-house"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/members/libraries"><i class="bi bi-building"></i> Libraries</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/members/dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="memberDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle"></i> ${member.name}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="memberDropdown">
                            <li><a class="dropdown-item" href="/members/profile/edit"><i class="bi bi-pencil-square"></i> Edit Profile</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/members/logout"><i class="bi bi-door-open"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="greeting-section">
            <h1 class="mb-2"><i class="bi bi-heart-fill"></i> Your Favorite Books</h1>
            <p class="mb-0">Books you've marked as favorites for easy access</p>
        </div>

        <#if (favorites?size > 0)>
            <div class="row">
                <#list favorites as book>
                    <div class="col-md-6 col-lg-4">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="d-flex justify-content-between align-items-start mb-2">
                                    <h5 class="card-title mb-0"><i class="bi bi-book-open"></i> ${book.title}</h5>
                                    <span class="badge bg-danger">
                                        <i class="bi bi-heart-fill"></i> Favorited
                                    </span>
                                </div>
                                <p class="card-text text-muted">
                                    <small><strong>Author:</strong> ${book.author.name}</small>
                                </p>
                                <p class="card-text">
                                    <small>${(book.description!'')?truncate(120)}</small>
                                </p>
                                <#assign hasReviewed = false>
                                <#list member.reviews![] as review>
                                    <#if review.book.id == book.id><#assign hasReviewed = true></#if>
                                </#list>
                                <#if hasReviewed>
                                    <p class="card-text mt-2">
                                        <small class="text-success"><i class="bi bi-check-circle-fill"></i> You've reviewed this book</small>
                                    </p>
                                </#if>
                            </div>
                            <div class="card-footer bg-transparent border-top">
                                <div class="d-grid gap-2">
                                    <#if !hasReviewed>
                                        <a href="/members/books/${book.id}/review" class="btn btn-sm btn-primary">
                                            <i class="bi bi-star"></i> Leave Review
                                        </a>
                                    </#if>
                                    <form method="POST" action="/members/books/${book.id}/favorite" style="display: inline;">
                                        <button type="submit" class="btn btn-sm btn-outline-danger w-100">
                                            <i class="bi bi-heart-break"></i> Remove from Favorites
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </#list>
            </div>
        <#else>
            <div class="alert alert-info" role="alert">
                <strong><i class="bi bi-info-circle"></i> No favorite books yet!</strong> Browse libraries and click the heart icon to add books to your favorites.
            </div>
        </#if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
