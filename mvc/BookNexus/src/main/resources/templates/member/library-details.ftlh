<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookNexus - ${library.name}</title>
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
        <div class="row mb-3">
            <div class="col-12">
                <h1>${library.name}</h1>
                <p class="text-muted">${(library.description!'')}</p>
            </div>
        </div>

        <div class="row mb-4">
            <div class="col-12">
                <form action="/members/libraries/${library.id}/subscribe" method="post">
                    <button type="submit" class="btn btn-success">Subscribe</button>
                    <a class="btn btn-secondary" href="/members/libraries">Back</a>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="col-12">
                <h3>Books</h3>
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
