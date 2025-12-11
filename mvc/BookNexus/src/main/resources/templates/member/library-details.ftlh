<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookNexus - ${library.libraryName!'Library'}</title>
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
        .card-title {
            color: #667eea;
            font-weight: 700;
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
        .btn-danger {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            border: none;
        }
        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(231, 76, 60, 0.3);
        }
        h1, h2 {
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
        .library-info {
            background: linear-gradient(135deg, #f8f9ff 0%, #eaf2ff 100%);
            border-left: 4px solid #667eea;
            padding: 1.5rem;
            border-radius: 0.75rem;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">BookNexus</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/members/libraries">Libraries</a></li>
                    <li class="nav-item"><a class="nav-link" href="/members/dashboard">Dashboard</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="greeting-section">
            <div style="display: flex; align-items: center;">
                <i class="bi bi-building" style="font-size: 2rem; margin-right: 1rem;"></i>
                <div>
                    <h1 style="color: white; margin: 0; font-size: 2.5rem;">${library.libraryName!'Library'}</h1>
                    <p style="margin: 0; opacity: 0.95; font-size: 1.1rem;"><i class="bi bi-person-circle"></i> by ${(library.author.name!'Unknown Author')}</p>
                </div>
            </div>
        </div>

        <div class="row mb-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="bi bi-info-circle"></i> Library Details</h5>
                        <div class="library-info">
                            <p class="mb-3">${(library.description!'')}</p>
                        </div>
                        <div class="mt-4">
                            <div class="mb-3">
                                <label class="text-muted small"><i class="bi bi-tag-fill"></i> Subscription Price</label>
                                <p class="mb-0" style="font-size: 1.5rem; font-weight: 700; color: #667eea;">$${library.price}</p>
                            </div>
                            <div class="mb-3">
                                <label class="text-muted small"><i class="bi bi-book"></i> Total Books</label>
                                <p class="mb-0" style="font-size: 1.3rem; font-weight: 700;">${(library.books?size)!0}</p>
                            </div>
                            <div class="mb-0">
                                <label class="text-muted small"><i class="bi bi-check-circle"></i> Status</label>
                                <p class="mb-0">
                                    <span class="badge bg-success" style="font-size: 0.9rem; padding: 0.5rem 0.75rem;">Active</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="bi bi-lightning-fill"></i> Actions</h5>
                        <#if isSubscribed?? && isSubscribed>
                            <div class="alert alert-success mb-3" style="border-radius: 0.75rem;">
                                <i class="bi bi-check-circle"></i> <strong>You are subscribed to this library</strong>
                            </div>
                            <form action="/members/libraries/${library.id}/unsubscribe" method="post" class="mb-3">
                                <button type="submit" class="btn btn-danger btn-lg w-100 mb-2">
                                    <i class="bi bi-x-circle"></i> Cancel Subscription
                                </button>
                            </form>
                        <#else>
                            <form action="/members/libraries/${library.id}/subscribe" method="post" class="mb-3">
                                <button type="submit" class="btn btn-success btn-lg w-100 mb-2">
                                    <i class="bi bi-heart-fill"></i> Subscribe Now - $${library.price}
                                </button>
                            </form>
                        </#if>
                        <a class="btn btn-secondary w-100" href="/members/libraries"><i class="bi bi-arrow-left"></i> Back to Libraries</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <h2 class="mb-4"><i class="bi bi-book-half"></i> Books</h2>
                <#if (library.books?size > 0)>
                    <div class="row">
                        <#list library.books as book>
                            <div class="col-md-4 mb-3">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title"><i class="bi bi-book"></i> ${book.title}</h5>
                                        <p class="card-text text-muted">${(book.description!'')?truncate(100)}</p>
                                    </div>
                                    <div class="card-footer bg-transparent border-top d-flex gap-2">
                                        <form action="/members/books/${book.id}/favorite" method="post" style="flex: 1;">
                                            <button type="submit" class="btn btn-sm btn-outline-warning w-100"><i class="bi bi-heart"></i> Favorite</button>
                                        </form>
                                        <#if member??>
                                            <a class="btn btn-sm btn-primary" href="/members/books/${book.id}/review"><i class="bi bi-star"></i> Review</a>
                                        </#if>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </div>
                <#else>
                    <div class="alert alert-info">No books in this library yet.</div>
                </#if>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
