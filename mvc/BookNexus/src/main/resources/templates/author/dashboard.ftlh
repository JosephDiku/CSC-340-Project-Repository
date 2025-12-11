<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BookNexus - Author Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .navbar {
            background: linear-gradient(90deg, #667eea 0%, #764ba2 100%);
            box-shadow: 0 2px 8px rgba(102, 126, 234, 0.15);
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 1.5rem;
        }

        .card {
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
            margin-bottom: 1.5rem;
            border: none;
            border-radius: 1rem;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.15);
        }

        .card-header-icon {
            font-size: 2.5rem;
            color: #667eea;
            margin-bottom: 1rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(102, 126, 234, 0.4);
        }

        .btn-success {
            background: #10b981;
            border: none;
            transition: all 0.3s ease-in-out;
        }

        .btn-success:hover {
            background: #059669;
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(16, 185, 129, 0.3);
        }

        .dashboard-section {
            margin-bottom: 3rem;
        }

        .btn-group-vertical {
            width: 100%;
        }

        .greeting-section {
            padding: 2rem;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border-radius: 1rem;
            margin-bottom: 2rem;
        }

        .greeting-section h1 {
            margin-bottom: 0.5rem;
        }

        .greeting-section p {
            margin: 0;
            opacity: 0.9;
        }

        .avatar {
            width: 80px;
            height: 80px;
            font-weight: 700;
            font-size: 1.75rem;
            background: rgba(255, 255, 255, 0.3);
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">
                <i class="bi bi-book"></i> BookNexus
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/"><i class="bi bi-house"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/authors/reviews"><i class="bi bi-chat-dots"></i> Reviews</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/authors/subscriptions"><i class="bi bi-heart"></i> Subscriptions</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle"></i> ${author.name}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
                            <li><a class="dropdown-item" href="/authors/profile/edit"><i class="bi bi-pencil-square"></i> Edit Profile</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/authors/logout"><i class="bi bi-door-open"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="greeting-section d-flex align-items-center gap-4">
                <#-- avatar / greeting -->
                <#if author.avatarUrl??>
                    <img src="${author.avatarUrl}" alt="avatar" class="rounded-circle avatar">
                <#else>
                    <div class="rounded-circle avatar d-flex align-items-center justify-content-center">${(author.name?split(" ")[0])?substring(0,1)!"A"}</div>
                </#if>
                <div>
                    <h1 class="mb-2"><i class="bi bi-hand-thumbs-up"></i> Welcome back, ${author.name}!</h1>
                    <p class="mb-1">Ready to share your next chapter? Manage books, library, and profile below.</p>
                    <small><i class="bi bi-info-circle"></i> Tip: click <strong>+ Add New Book</strong> to publish something new.</small>
                </div>
            </div>

        <div class="row mb-5">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="card-header-icon">
                            <i class="bi bi-person-check"></i>
                        </div>
                        <h5 class="card-title mb-3">Author Profile</h5>
                        <p class="card-text text-muted">View and edit your profile information</p>
                        <a href="/authors/profile/edit" class="btn btn-primary"><i class="bi bi-pencil-square"></i> Edit Profile</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <#if author.library??>
                            <div class="card-header-icon">
                                <i class="bi bi-building"></i>
                            </div>
                            <h5 class="card-title mb-3">Library Settings</h5>
                            <p class="card-text text-muted">Manage your library and settings</p>
                            <a href="/authors/library/edit" class="btn btn-primary"><i class="bi bi-gear"></i> Edit Library</a>
                        <#else>
                            <div class="card-header-icon">
                                <i class="bi bi-plus-circle"></i>
                            </div>
                            <h5 class="card-title mb-3">Set Up Library</h5>
                            <p class="card-text text-muted">Create your library to start publishing</p>
                            <a href="/authors/library/setup" class="btn btn-success"><i class="bi bi-rocket-takeoff"></i> Create Library</a>
                        </#if>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="card-header-icon">
                            <i class="bi bi-bar-chart"></i>
                        </div>
                        <h5 class="card-title mb-3">Quick Stats</h5>
                        <p class="mb-2">
                            <strong class="h4" style="color: #667eea;">
                                <#if author.library??>
                                    ${(author.library.books?size)!0}
                                <#else>
                                    0
                                </#if>
                            </strong><br>
                            <small class="text-muted">Books Published</small>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent activity: reviews & subscriptions -->
        <div class="row mb-4">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="bi bi-chat-left-text"></i> Recent Reviews</h5>
                        <p class="text-muted mb-2">
                            <strong class="h5" style="color: #667eea;">
                                <#if reviewsCount??>
                                    ${reviewsCount}
                                <#else>
                                    —
                                </#if>
                            </strong> reviews
                        </p>
                        <#if reviewsRecent?? && (reviewsRecent?size > 0)>
                            <ul class="list-unstyled small">
                                <#list reviewsRecent as r>
                                    <li class="mb-2">
                                        <strong>${r.book.title}</strong>
                                        <div class="text-truncate text-muted">${(r.comment!"")?truncate(120)}</div>
                                    </li>
                                </#list>
                            </ul>
                        <#else>
                            <p class="small text-muted">No recent reviews. Check the full reviews page for more.</p>
                        </#if>
                        <a href="/authors/reviews" class="btn btn-sm btn-outline-primary"><i class="bi bi-arrow-right"></i> View All Reviews</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><i class="bi bi-heart-fill"></i> Subscriptions</h5>
                        <p class="text-muted mb-2">
                            <strong class="h5" style="color: #667eea;">
                                <#if subscriptionsCount??>
                                    ${subscriptionsCount}
                                <#else>
                                    —
                                </#if>
                            </strong> active
                        </p>
                        <#if subscriptionsRecent?? && (subscriptionsRecent?size > 0)>
                            <ul class="list-unstyled small">
                                <#list subscriptionsRecent as s>
                                    <li class="mb-2">
                                        <strong><i class="bi bi-person-circle"></i> ${s.member.name!"Member"}</strong>
                                        <div class="text-muted">Started: <#if s.startDate??>${s.startDate}<#else>—</#if></div>
                                    </li>
                                </#list>
                            </ul>
                        <#else>
                            <p class="small text-muted">No recent subscriptions. Encourage readers to subscribe.</p>
                        </#if>
                        <a href="/authors/subscriptions" class="btn btn-sm btn-outline-primary"><i class="bi bi-arrow-right"></i> Manage Subscriptions</a>
                    </div>
                </div>
            </div>
        </div>

        <#if author.library??>
            <div class="dashboard-section">
                <div class="row align-items-center mb-4">
                    <div class="col">
                        <h2 class="mb-0"><i class="bi bi-book-fill"></i> Your Books</h2>
                    </div>
                    <div class="col-auto">
                        <a href="/authors/books/new" class="btn btn-success"><i class="bi bi-plus-circle"></i> Add New Book</a>
                    </div>
                </div>

                <#if author.library.books?? && (author.library.books?size > 0)>
                    <div class="row">
                        <#list author.library.books as book>
                            <div class="col-md-6 col-lg-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title"><i class="bi bi-book-open"></i> ${book.title}</h5>
                                        <p class="card-text text-muted">
                                            <small>${(book.description!'')?truncate(100)}</small>
                                        </p>
                                    </div>
                                    <div class="card-footer bg-transparent border-top">
                                        <a href="/authors/books/${book.id}/edit" class="btn btn-sm btn-outline-primary">
                                            <i class="bi bi-pencil-square"></i> Edit
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </#list>
                    </div>
                <#else>
                    <div class="alert alert-info" role="alert">
                        <strong><i class="bi bi-info-circle"></i> No books yet!</strong> <a href="/authors/books/new">Create your first book</a>
                    </div>
                </#if>
            </div>
        <#else>
            <div class="alert alert-warning" role="alert">
                <h4 class="alert-heading"><i class="bi bi-exclamation-triangle"></i> Set Up Your Library First</h4>
                <p>Before you can publish books, you need to set up your author library. This is where all your books will be
                    stored and managed.</p>
                <hr>
                <p class="mb-0">
                    <a href="/authors/library/setup" class="btn btn-warning"><i class="bi bi-rocket-takeoff"></i> Set Up Library</a>
                </p>
            </div>
        </#if>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
