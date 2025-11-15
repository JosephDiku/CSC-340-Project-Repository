<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BookNexus - Edit Library</title>
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
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4">Edit Library Settings</h2>

                <div class="card">
                    <div class="card-body">
                        <form action="/authors/library/edit" method="post">
                            <div class="mb-3">
                                <label for="libraryName" class="form-label">Library Name</label>
                                <input type="text" class="form-control" id="libraryName" name="libraryName" 
                                    value="${author.library.libraryName}" required>
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Base Price (USD)</label>
                                <input type="text" class="form-control" id="price" name="price" 
                                    value="${author.library.price}" required>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Library Description</label>
                                <textarea class="form-control" id="description" name="description" 
                                    rows="4">${(author.library.description)!''}</textarea>
                            </div>
                            <div class="alert alert-info" role="alert">
                                <strong>Library Info:</strong><br>
                                <small>
                                    Total Books: ${(author.library.books?size)!0}<br>
                                    Created: ${author.library.createdAt!"N/A"}
                                </small>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Save Changes</button>
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
