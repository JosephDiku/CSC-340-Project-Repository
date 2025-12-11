<!DOCTYPE html>
<html>

<#-- Member Dashboard Template -->

<head>
    <meta charset="UTF-8">
    <title>BookNexus - Member Dashboard</title>
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
                        <a class="nav-link" href="/members/libraries"><i class="bi bi-building"></i> Libraries</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="memberDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="bi bi-person-circle"></i> ${member.name}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="memberDropdown">
                            <li><a class="dropdown-item" href="/members/profile/edit"><i class="bi bi-pencil-square"></i> Edit Profile</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/members/logout"><i class="bi bi-door-open"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="greeting-section d-flex align-items-center gap-4">
                <#-- Avatar / Greeting -->
                <#if member.avatarUrl??>
                    <img src="${member.avatarUrl}" alt="avatar" class="rounded-circle avatar">
                <#else>
                    <div class="rounded-circle avatar d-flex align-items-center justify-content-center">${(member.name?split(" ")[0])?substring(0,1)!"M"}</div>
                </#if>
                <div>
                    <h1 class="mb-2"><i class="bi bi-hand-thumbs-up"></i> Welcome back, ${member.name}!</h1>
                    <p class="mb-1">Browse libraries, subscribe, and share your reviews with the community</p>
                    <small><i class="bi bi-info-circle"></i> Tip: Explore new libraries and discover great books.</small>
                </div>
            </div>

        <div class="row mb-5">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="card-header-icon">
                            <i class="bi bi-person-check"></i>
                        </div>
                        <h5 class="card-title mb-3">Member Profile</h5>
                        <p class="card-text text-muted">View and edit your profile information</p>
                        <a href="/members/profile/edit" class="btn btn-primary"><i class="bi bi-pencil-square"></i> Edit Profile</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="card-header-icon">
                            <i class="bi bi-building"></i>
                        </div>
                        <h5 class="card-title mb-3">Browse Libraries</h5>
                        <p class="card-text text-muted">Discover and subscribe to libraries</p>
                        <a href="/members/libraries" class="btn btn-primary"><i class="bi bi-search"></i> Browse</a>
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
                            <strong class="h5" style="color: #667eea;">${(activeSubscriptions?size)!0}</strong><br>
                            <small class="text-muted">Active Subscriptions</small>
                        </p>
                        <p class="mb-0">
                            <strong class="h5" style="color: #667eea;">${(memberReviews?size)!0}</strong><br>
                            <small class="text-muted">Books Read</small>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <#-- Subscriptions Section -->
        <div class="dashboard-section">
            <div class="row align-items-center mb-4">
                <div class="col">
                    <h2 class="mb-0"><i class="bi bi-heart-fill"></i> Your Subscriptions</h2>
                </div>
            </div>

            <#if (activeSubscriptions?size > 0)>
                <div class="row">
                    <#list activeSubscriptions as sub>
                        <div class="col-md-6 col-lg-4">
                            <div class="card h-100">
                                <div class="card-body">
                                    <a href="/members/libraries/${sub.library.id}" style="text-decoration: none; color: inherit;">
                                        <h5 class="card-title" style="cursor: pointer; color: #667eea;"><i class="bi bi-building"></i> ${sub.library.libraryName!'Library'}</h5>
                                    </a>
                                    <p class="card-text text-muted">
                                        <small>${(sub.library.description!'')?truncate(100)}</small>
                                    </p>
                                    <div class="mt-3 pt-3 border-top">
                                        <p class="mb-2">
                                            <small class="text-muted">
                                                <i class="bi bi-calendar"></i> <strong>Subscribed:</strong><br>
                                                <#assign subDate = sub.startDate?datetime.iso?date>
                                                ${subDate?string("MMM dd, yyyy")}
                                            </small>
                                        </p>
                                        <p class="mb-0">
                                            <small class="text-muted">
                                                <i class="bi bi-tag"></i> <strong>Price:</strong><br>
                                                $${sub.library.price}
                                            </small>
                                        </p>
                                    </div>
                                </div>
                                <div class="card-footer bg-transparent border-top">
                                    <a href="/members/libraries/${sub.library.id}" class="btn btn-sm btn-outline-primary">
                                        <i class="bi bi-arrow-right"></i> View Library
                                    </a>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            <#else>
                <div class="alert alert-info" role="alert">
                    <strong><i class="bi bi-info-circle"></i> No subscriptions yet!</strong> <a href="/members/libraries">Browse libraries</a> to subscribe to your favorite content.
                </div>
            </#if>
        </div>

        <#-- Reviews Section -->
        <div class="dashboard-section">
            <div class="row align-items-center mb-4">
                <div class="col">
                    <h2 class="mb-0"><i class="bi bi-chat-left-text"></i> Recent Reviews</h2>
                </div>
            </div>

            <#if (memberReviews?size > 0)>
                <div class="row">
                    <#list memberReviews as r>
                        <div class="col-md-6 col-lg-4">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title"><i class="bi bi-book-open"></i> ${r.book.title}</h5>
                                    <p class="card-text">
                                        <small class="text-muted"><i class="bi bi-star-fill"></i> ${r.overallRating} Stars</small>
                                    </p>
                                    <p class="card-text">
                                        <small>${(r.comment!'')?truncate(120)}</small>
                                    </p>
                                </div>
                                <div class="card-footer bg-transparent border-top d-flex justify-content-between align-items-center">
                                    <#assign reviewDate = r.createdAt?datetime.iso?date>
                                    <small class="text-muted"><i class="bi bi-calendar"></i> ${reviewDate?string("MMM dd, yyyy")}</small>
                                    <form action="/members/reviews/${r.id}/delete" method="post" style="display: inline;">
                                        <button type="submit" class="btn btn-sm btn-outline-danger" onclick="return confirm('Delete this review?');">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            <#else>
                <div class="alert alert-info" role="alert">
                    <strong><i class="bi bi-info-circle"></i> No reviews yet!</strong> Subscribe to a library and share your thoughts on books.
                </div>
            </#if>
        </div>

        <#-- Favorite Books Section -->
        <div class="dashboard-section">
            <div class="row align-items-center mb-4">
                <div class="col">
                    <h2 class="mb-0"><i class="bi bi-heart-fill"></i> Your Favorite Books</h2>
                </div>
                <div class="col-auto">
                    <a href="/members/favorites" class="btn btn-sm btn-outline-primary"><i class="bi bi-arrow-right"></i> View All</a>
                </div>
            </div>

            <#if (favoriteBooks?size > 0)>
                <div class="row">
                    <#list favoriteBooks?sort_by("title") as book>
                        <#if book_index lt 3>
                            <div class="col-md-6 col-lg-4">
                                <div class="card h-100">
                                    <div class="card-body">
                                        <h5 class="card-title"><i class="bi bi-book-open"></i> ${book.title}</h5>
                                        <p class="card-text text-muted">
                                            <small><strong>Author:</strong> ${book.author.name}</small>
                                        </p>
                                        <p class="card-text">
                                            <small>${(book.description!'')?truncate(100)}</small>
                                        </p>
                                    </div>
                                    <div class="card-footer bg-transparent border-top">
                                        <a href="/members/favorites" class="btn btn-sm btn-outline-primary">
                                            <i class="bi bi-arrow-right"></i> View
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </#if>
                    </#list>
                </div>
            <#else>
                <div class="alert alert-info" role="alert">
                    <strong><i class="bi bi-info-circle"></i> No favorite books yet!</strong> Browse libraries and click the heart icon to add books to your favorites.
                </div>
            </#if>
        </div>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
