<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookNexus - Review ${book.title}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .navbar {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            box-shadow: 0 4px 6px rgba(102, 126, 234, 0.1);
        }
        .navbar-brand {
            font-weight: 700;
            font-size: 1.3rem;
        }
        .card {
            border: none;
            border-radius: 1rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.08);
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.15);
        }
        .btn-primary, .btn-success {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn-primary:hover, .btn-success:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(102, 126, 234, 0.3);
        }
        .form-control, .form-select {
            border: 2px solid #e9ecef;
            border-radius: 0.5rem;
            transition: border-color 0.3s;
        }
        .form-control:focus, .form-select:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.1);
        }
        h2 {
            color: #667eea;
            font-weight: 700;
        }
        .greeting-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.15);
        }
        .book-description {
            background: linear-gradient(135deg, #f8f9ff 0%, #eaf2ff 100%);
            border-left: 4px solid #667eea;
            padding: 1.5rem;
            border-radius: 0.75rem;
            margin-bottom: 1.5rem;
        }
        .rating-option {
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
            transition: background-color 0.3s;
        }
        .rating-option:hover {
            background-color: #eaf2ff;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark mb-4">
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
                <div class="greeting-section">
                    <div style="display: flex; align-items: center;">
                        <i class="bi bi-star-half" style="font-size: 2rem; margin-right: 1rem;"></i>
                        <div>
                            <h2 style="color: white; margin: 0;">Review: ${book.title}</h2>
                            <p style="margin: 0; opacity: 0.95;">Share your thoughts about this book</p>
                        </div>
                    </div>
                </div>

                <div class="book-description">
                    <h6 style="color: #667eea; font-weight: 700; margin-bottom: 0.75rem;"><i class="bi bi-book"></i> About this book</h6>
                    <p style="margin-bottom: 0;">${(book.description!'')}</p>
                </div>

                <div class="card">
                    <div class="card-body">
                        <form action="/members/books/${book.id}/review" method="post">
                            <input type="hidden" name="bookId" value="${book.id}" />
                            <div class="mb-3">
                                <label class="form-label"><i class="bi bi-star-fill" style="color: #ffc107;"></i> Overall Rating</label>
                                <select class="form-select" name="overallRating" required>
                                    <option value="5"><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> 5 - Excellent</option>
                                    <option value="4"><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> 4 - Very good</option>
                                    <option value="3"><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> 3 - Good</option>
                                    <option value="2"><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i> 2 - Fair</option>
                                    <option value="1"><i class="bi bi-star-fill"></i> 1 - Poor</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label"><i class="bi bi-chat-left-text"></i> Comment (optional)</label>
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
