<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BookNexus - Create New Book</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
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
                        <a class="nav-link" href="/authors/dashboard">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/authors/reviews">Reviews</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/authors/subscriptions">Subscriptions</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4">Publish New Book</h2>
                <p class="lead text-muted mb-4">Add a new book to your library</p>

                <div class="card">
                    <div class="card-body">
                        <form action="/authors/books/new" method="post">
                            <div class="mb-3">
                                <label for="title" class="form-label">Book Title</label>
                                <input type="text" class="form-control" id="title" name="title" 
                                    placeholder="Enter your book title" required>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Book Description</label>
                                <textarea class="form-control" id="description" name="description" 
                                    rows="6" placeholder="Tell readers what your book is about..." required></textarea>
                            </div>
                            <div class="alert alert-info" role="alert">
                                <strong>Publishing to:</strong> ${author.library.libraryName}
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-success">Publish Book</button>
                                <a href="/authors/dashboard" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
