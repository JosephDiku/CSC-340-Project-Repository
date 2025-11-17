<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BookNexus - Author Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card {
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
            margin-bottom: 1.5rem;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .dashboard-section {
            margin-bottom: 3rem;
        }

        .btn-group-vertical {
            width: 100%;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                BookNexus
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/authors/reviews">Reviews</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/authors/subscriptions">Subscriptions</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            ${author.name}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
                            <li><a class="dropdown-item" href="/authors/profile/edit">Edit Profile</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/authors/logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row mb-4">
            <div class="col-12">
                <h1 class="display-4">Welcome, ${author.name}!</h1>
                <p class="lead text-muted">Manage your books, library, and author profile</p>
            </div>
        </div>

        <div class="row mb-5">
            <div class="col-md-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title mb-3">Author Profile</h5>
                        <p class="card-text text-muted">View and edit your profile information</p>
                        <a href="/authors/profile/edit" class="btn btn-primary">Edit Profile</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-body text-center">
                        <#if author.library??>
                            <h5 class="card-title mb-3">Library Settings</h5>
                            <p class="card-text text-muted">Manage your library and settings</p>
                            <a href="/authors/library/edit" class="btn btn-primary">Edit Library</a>
                        <#else>
                            <h5 class="card-title mb-3">Set Up Library</h5>
                            <p class="card-text text-muted">Create your library to start publishing</p>
                            <a href="/authors/library/setup" class="btn btn-success">Create Library</a>
                        </#if>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title mb-3">Quick Stats</h5>
                        <p class="mb-2">
                            <strong>Books Published:</strong><br>
                            <#if author.library??>
                                ${(author.library.books?size)!0}
                            <#else>
                                0
                            </#if>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <#if author.library??>
            <div class="dashboard-section">
                <div class="row align-items-center mb-4">
                    <div class="col">
                        <h2 class="mb-0">Your Books</h2>
                    </div>
                    <div class="col-auto">
                        <a href="/authors/books/new" class="btn btn-success">+ Add New Book</a>
                    </div>
                </div>

                <#if author.library.books?? && (author.library.books?size > 0)>
                    <div class="row">
                        <#list author.library.books as book>
                            <div class="col-md-6 col-lg-4">
                                <div class="card h-100 border-0 shadow-sm">
                                    <div class="card-body">
                                        <h5 class="card-title">${book.title}</h5>
                                        <p class="card-text text-muted">
                                            <small>${(book.description!'')?truncate(100)}</small>
                                        </p>
                                    </div>
                                    <div class="card-footer bg-transparent border-top">
                                        <a href="/authors/books/${book.id}/edit" class="btn btn-sm btn-outline-primary">
                                            Edit
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </div>
                <#else>
                    <div class="alert alert-info" role="alert">
                        <strong>No books yet!</strong> <a href="/authors/books/new">Create your first book</a>
                    </div>
                </#if>
            </div>
        <#else>
            <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading">Set Up Your Library First</h4>
                <p>Before you can publish books, you need to set up your author library. This is where all your books will be
                    stored and managed.</p>
                <hr>
                <p class="mb-0">
                    <a href="/authors/library/setup" class="btn btn-warning">Set Up Library</a>
                </p>
            </div>
        </#if>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
