<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>${title!"BookNexus"}</title>
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

        body {
            background-color: #f8f9fa;
        }

        .hero-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 4rem 0;
            position: relative;
            overflow: hidden;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -10%;
            width: 500px;
            height: 500px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }

        .hero-section::after {
            content: '';
            position: absolute;
            bottom: -30%;
            left: -5%;
            width: 400px;
            height: 400px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
        }

        .hero-content {
            position: relative;
            z-index: 1;
        }

        .hero-image-container {
            position: relative;
            overflow: hidden;
            border-radius: 1.5rem;
            box-shadow: 0 1rem 3rem rgba(0, 0, 0, .175);
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .hero-image-container:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 2rem 4rem rgba(0, 0, 0, .25);
        }

        .featured-section {
            position: relative;
            z-index: 1;
            padding: 4rem 0;
        }

        .featured-section::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(180deg, #ffffff 0%, #f0f2f5 100%);
            transform: skewY(-2deg);
            z-index: -1;
        }

        .section-title {
            position: relative;
            display: inline-block;
            padding-bottom: 1rem;
        }

        .section-title::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            border-radius: 2px;
        }

        .card {
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            border: none;
            border-radius: 1rem;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.15);
        }

        .card-header-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .btn-lg {
            padding: 0.8rem 2.5rem;
            font-weight: 600;
            border-radius: 0.5rem;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(102, 126, 234, 0.4);
        }

        .btn-outline-primary:hover {
            transform: translateY(-2px);
        }

        .cta-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 1.5rem;
            position: relative;
            overflow: hidden;
        }

        .cta-section::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -10%;
            width: 300px;
            height: 300px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }

        .cta-section-content {
            position: relative;
            z-index: 1;
        }

        .feature-badge {
            display: inline-block;
            background: rgba(255, 255, 255, 0.2);
            padding: 0.5rem 1rem;
            border-radius: 2rem;
            font-size: 0.875rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark mb-4">
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
                        <a class="nav-link" href="/"><i class="bi bi-house-fill"></i> Home</a>
                    </li>
                    <#if authorId?? || memberId??>
                        <#if memberId??>
                            <li class="nav-item">
                                <a class="nav-link" href="/members/dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/members/logout"><i class="bi bi-door-left"></i> Logout</a>
                            </li>
                            <#else>
                                <li class="nav-item">
                                    <a class="nav-link" href="/authors/dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/authors/logout"><i class="bi bi-door-left"></i> Logout</a>
                                </li>
                        </#if>
                        <#else>
                            <li class="nav-item">
                                <a class="nav-link" href="/signin"><i class="bi bi-door-left"></i> Sign In</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/signup"><i class="bi bi-person-plus"></i> Sign Up</a>
                            </li>
                        </#if>
                </ul>
            </div>
        </div>
    </nav>

    <div class="hero-section">
        <div class="container">
            <div class="row align-items-center py-5">
                <div class="col-lg-6 hero-content">
                    <div class="feature-badge">
                        <i class="bi bi-star-fill"></i> Welcome to BookNexus
                    </div>
                    <h1 class="display-4 fw-bold mb-4">Discover Your Next Great Read</h1>
                    <p class="lead mb-4">
                        Connect with thousands of readers, explore curated collections from libraries, and discover hidden gems from independent authors. Your reading journey starts here.
                    </p>
                    <div class="d-grid gap-3 d-sm-flex justify-content-lg-start justify-content-center">
                        <a href="/signup" class="btn btn-light btn-lg px-4"><i class="bi bi-rocket-takeoff"></i> Get Started</a>
                        <a href="/signin" class="btn btn-outline-light btn-lg px-4"><i class="bi bi-door-open"></i> Sign In</a>
                    </div>
                </div>
                <div class="col-lg-6 mt-5 mt-lg-0 hero-content">
                    <div class="hero-image-container">
                        <img src="static/images/BookNexusImage.jpg" class="img-fluid"
                            alt="Collection of books"
                            style="width: 100%; max-height: 450px; object-fit: cover;">
                        <div class="position-absolute bottom-0 start-0 w-100 p-4 text-white"
                            style="background: linear-gradient(transparent, rgba(0,0,0,0.8));">
                            <p class="mb-0 fw-semibold"><i class="bi bi-book"></i> Explore thousands of books, one story at a time</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

        <div class="featured-section">
            <div class="row mb-5">
                <div class="col-12">
                    <h2 class="text-center section-title mb-4"><i class="bi bi-building"></i> Featured Libraries</h2>
                    <p class="text-center text-muted mb-5">Discover libraries offering curated collections and exclusive content from around the world</p>
                    <div class="row">
                        <#list libraries as library>
                            <div class="col-md-4 mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="card-header-icon text-primary">
                                            <i class="bi bi-library"></i>
                                        </div>
                                        <h5 class="card-title">${library.libraryName}</h5>
                                        <p class="card-text text-muted">${(library.description!'')?truncate(150)}</p>
                                        <div class="mt-3">
                                            <small class="text-muted"><i class="bi bi-arrow-right"></i> Explore</small>
                                        </div>
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
                    <h2 class="text-center section-title mb-4"><i class="bi bi-book-fill"></i> Featured Books</h2>
                    <p class="text-center text-muted mb-5">Browse our collection of bestsellers and hidden gems from talented authors</p>
                    <div class="row">
                        <#list books as book>
                            <div class="col-md-4 mb-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <div class="card-header-icon text-success">
                                            <i class="bi bi-book-open"></i>
                                        </div>
                                        <h5 class="card-title">${book.title}</h5>
                                        <p class="card-text"><small class="text-muted"><i class="bi bi-pen"></i> By: ${(book.author.name)!''}</small></p>
                                        <p class="card-text text-muted small">${(book.description!'')?truncate(150)}</p>
                                        <div class="mt-3">
                                            <span class="badge bg-light text-dark"><i class="bi bi-star"></i> Featured</span>
                                        </div>
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

        <div class="cta-section py-5 mb-5">
            <div class="cta-section-content text-center">
                <div class="col-lg-8 mx-auto">
                    <h2 class="display-5 fw-bold mb-3"><i class="bi bi-rocket-fill"></i> Ready to Start Your Journey?</h2>
                    <p class="lead mb-4">
                        Join thousands of readers and authors on BookNexus. Discover thousands of books, connect with passionate readers,
                        and grow your reading community today.
                    </p>
                    <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                        <a href="/signup" class="btn btn-light btn-lg px-5 fw-bold"><i class="bi bi-person-plus"></i> Sign Up Now</a>
                        <a href="/signin" class="btn btn-outline-light btn-lg px-5 fw-bold"><i class="bi bi-person-check"></i> Already a Member?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>