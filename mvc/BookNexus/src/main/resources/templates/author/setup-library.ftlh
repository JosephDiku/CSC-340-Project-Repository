<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BookNexus - Set Up Library</title>
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
                <h2 class="mb-4">Create Your Author Library</h2>
                <p class="lead text-muted mb-4">Set up your library to start publishing books and sharing your work with readers.</p>

                <div class="card">
                    <div class="card-body">
                        <form action="/authors/library/setup" method="post">
                            <div class="mb-3">
                                <label for="libraryName" class="form-label">Library Name</label>
                                <input type="text" class="form-control" id="libraryName" name="libraryName" 
                                    placeholder="e.g., John Smith's Book Collection" required>
                                <small class="text-muted">This is the name readers will see</small>
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Base Price (USD)</label>
                                <input type="number" class="form-control" id="price" name="price" 
                                    placeholder="0.00" step="0.01" required>
                                <small class="text-muted">This can be adjusted per book</small>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Library Description (Optional)</label>
                                <textarea class="form-control" id="description" name="description" 
                                    rows="4" placeholder="Tell readers about your library and writing style..."></textarea>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-success">Create Library</button>
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
