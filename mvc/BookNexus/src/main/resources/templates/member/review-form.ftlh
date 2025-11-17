<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookNexus - Review ${book.title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">BookNexus</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/members/dashboard">Dashboard</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <h2 class="mb-3">Review: ${book.title}</h2>
                <p class="text-muted">${(book.description!'')}</p>

                <div class="card">
                    <div class="card-body">
                        <form action="/members/books/${book.id}/review" method="post">
                            <input type="hidden" name="bookId" value="${book.id}" />
                            <div class="mb-3">
                                <label class="form-label">Overall Rating</label>
                                <select class="form-select" name="overallRating" required>
                                    <option value="5">5 - Excellent</option>
                                    <option value="4">4 - Very good</option>
                                    <option value="3">3 - Good</option>
                                    <option value="2">2 - Fair</option>
                                    <option value="1">1 - Poor</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Comment (optional)</label>
                                <textarea name="comment" class="form-control" rows="4"></textarea>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Submit Review</button>
                                <a class="btn btn-secondary" href="/members/dashboard">Cancel</a>
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
