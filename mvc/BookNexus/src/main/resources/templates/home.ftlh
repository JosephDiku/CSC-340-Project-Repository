<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>${title!"BookNexus"}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero-image-container {
            position: relative;
            overflow: hidden;
            border-radius: 1rem;
            box-shadow: 0 1rem 3rem rgba(0, 0, 0, .175);
            transition: transform 0.3s ease-in-out;
        }

        .hero-image-container:hover {
            transform: translateY(-5px);
        }

        .featured-section {
            position: relative;
            z-index: 1;
        }

        .featured-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #f8f9fa;
            transform: skewY(-3deg);
            z-index: -1;
        }

        .card {
            transition: transform 0.2s ease-in-out;
        }

        .card:hover {
            transform: translateY(-5px);
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
        <div class="container">
            <a class="navbar-brand" href="/">
                BookNexus
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/">Home</a>
                    </li>
                    <#if authorId?? || memberId??>
                        <#if memberId??>
                            <li class="nav-item">
                                <a class="nav-link" href="/members/dashboard">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/members/logout">Logout</a>
                            </li>
                            <#else>
                                <li class="nav-item">
                                    <a class="nav-link" href="/authors/dashboard">Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/authors/logout">Logout</a>
                                </li>
                        </#if>
                        <#else>
                            <li class="nav-item">
                                <a class="nav-link" href="/signin">Sign In</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/signup">Sign Up</a>
                            </li>
                    </#if>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="px-4 py-5 my-5">
            <div class="row align-items-center">
                <div class="col-lg-6 text-center text-lg-start">
                    <h1 class="display-5 fw-bold text-body-emphasis mb-4">Welcome to BookNexus</h1>
                    <p class="lead mb-4">
                        Discover a world of books, connect with fellow readers, and explore curated collections
                        from libraries and independent authors.
                    </p>
                    <div class="d-grid gap-2 d-sm-flex justify-content-lg-start justify-content-center">
                        <a href="/signup" class="btn btn-primary btn-lg px-4 gap-3">Get Started</a>
                        <a href="/signin" class="btn btn-outline-secondary btn-lg px-4">Sign In</a>
                    </div>
                </div>
                <div class="col-lg-6 mt-5 mt-lg-0">
                    <div class="position-relative">
                        <img src="/images/books.jpg" class="img-fluid rounded-3 shadow-lg"
                            alt="Collection of books"
                            style="width: 100%; max-height: 400px; object-fit: cover;">
                        <div class="position-absolute bottom-0 start-0 w-100 p-3 text-white"
                            style="background: linear-gradient(transparent, rgba(0,0,0,0.7));">
                            <p class="mb-0"><small>Explore thousands of books, one story at a time</small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="featured-section py-5 mb-5">
            <div class="row mb-5">
                <div class="col-12">
                    <h2 class="text-center mb-4">Featured Libraries</h2>
                    <p class="text-center text-muted mb-5">Discover libraries offering curated collections and exclusive content</p>
                    <div class="row">
                        <#list libraries as library>
                            <div class="col-md-4 mb-4">
                                <div class="card h-100 border-0 shadow-sm">
                                    <div class="card-body">
                                        <h5 class="card-title">${library.libraryName}</h5>
                                        <p class="card-text">${(library.description!'')?truncate(150)}</p>
                                    </div>
                                </div>
                            </div>
                            <#else>
                                <div class="col-12">
                                    <p class="text-center">No libraries available at the moment.</p>
                                </div>
                        </#list>
                    </div>
                </div>
            </div>

            <div class="row mb-5">
                <div class="col-12">
                    <h2 class="text-center mb-4">Featured Books</h2>
                    <p class="text-center text-muted mb-5">Browse our collection of bestsellers and hidden gems</p>
                    <div class="row">
                        <#list books as book>
                            <div class="col-md-4 mb-4">
                                <div class="card h-100 border-0 shadow-sm">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-start mb-2">
                                            <h5 class="card-title mb-0">${book.title}</h5>
                                        </div>
                                        <p class="card-text"><small class="text-muted">By: ${(book.author.name)!''}</small></p>
                                        <p class="card-text">${(book.description!'')?truncate(150)}</p>
                                    </div>
                                </div>
                            </div>
                            <#else>
                                <div class="col-12">
                                    <p class="text-center">No books available at the moment.</p>
                                </div>
                        </#list>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center py-5 mb-5" style="background-color: #f8f9fa; border-radius: 1rem;">
            <div class="col-lg-8 mx-auto">
                <h2 class="display-6 mb-3">Ready to Explore BookNexus?</h2>
                <p class="lead mb-4">
                    Join BookNexus to discover thousands of books, connect with authors and libraries,
                    and share your reading journey with the community.
                </p>
                <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                    <a href="/signup" class="btn btn-primary btn-lg px-5 gap-3">Sign Up Now</a>
                    <a href="/signin" class="btn btn-outline-primary btn-lg px-5">Sign In</a>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>