<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookNexus - ${library.libraryName!'Library'}</title>
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
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
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
        <div class="row mb-4">
            <div class="col-12">
                <h1 class="display-4">${library.libraryName!'Library'}</h1>
                <p class="lead text-muted">${(library.description!'')}</p>
            </div>
        </div>

        <div class="row mb-5">
            <div class="col-md-6">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title mb-4">Library Details</h5>
                        <div class="mb-3">
                            <label class="text-muted small">Author</label>
                            <p class="mb-0"><strong>${(library.author.name!'Unknown Author')}</strong></p>
                        </div>
                        <div class="mb-3">
                            <label class="text-muted small">Subscription Price</label>
                            <p class="mb-0"><strong class="text-primary">$${library.price}</strong></p>
                        </div>
                        <div class="mb-3">
                            <label class="text-muted small">Total Books</label>
                            <p class="mb-0"><strong>${(library.books?size)!0}</strong></p>
                        </div>
                        <div class="mb-0">
                            <label class="text-muted small">Status</label>
                            <p class="mb-0">
                                <span class="badge bg-success">Active</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card border-0 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title mb-4">Actions</h5>
                        <#if isSubscribed?? && isSubscribed>
                            <div class="alert alert-success mb-3">
                                <strong>✓ You are subscribed to this library</strong>
                            </div>
                            <form action="/members/libraries/${library.id}/unsubscribe" method="post" class="mb-3">
                                <button type="submit" class="btn btn-danger btn-lg w-100 mb-2">
                                    Cancel Subscription
                                </button>
                            </form>
                        <#else>
                            <form action="/members/libraries/${library.id}/subscribe" method="post" class="mb-3">
                                <button type="submit" class="btn btn-success btn-lg w-100 mb-2">
                                    Subscribe Now - $${library.price}
                                </button>
                            </form>
                        </#if>
                        <a class="btn btn-secondary w-100" href="/members/libraries">Back to Libraries</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <h2 class="mb-4">Books</h2>
                <#if library.books?? && (library.books?size > 0)>
                    <div class="row">
                        <#list library.books as book>
                            <div class="col-md-4 mb-3">
                                <div class="card h-100 border-0 shadow-sm">
                                    <div class="card-body">
                                        <h5 class="card-title">${book.title}</h5>
                                        <p class="card-text text-muted">${(book.description!'')?truncate(100)}</p>
                                    </div>
                                    <div class="card-footer bg-transparent border-top">
                                        <a class="btn btn-sm btn-outline-primary" href="/books/${book.id}">Details</a>
                                        <#if member??>
                                            <a class="btn btn-sm btn-primary" href="/members/books/${book.id}/review">Review</a>
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
