<!DOCTYPE html>
<html>

<#--
    Member Dashboard Template
    - Shows member-specific quick actions, active subscriptions, and recent reviews
    - Sections are annotated with FreeMarker comments for developer clarity
    -->

<head>
    <meta charset="UTF-8">
    <title>BookNexus - Member Dashboard</title>
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

        .dashboard-section {
            margin-bottom: 3rem;
        }

        .btn-group-vertical {
            width: 100%;
        }
    </style>
</head>

<body>
    <#-- Navigation: main site nav for members -->
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
                        <a class="nav-link" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/members/libraries">Libraries</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="memberDropdown" role="button"
                            data-bs-toggle="dropdown" aria-expanded="false">
                            ${member.name}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="memberDropdown">
                            <li><a class="dropdown-item" href="/members/profile/edit">Edit Profile</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="/members/logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

        <div class="container">
            <#-- Welcome: greeting and short description -->
        <div class="row mb-4">
            <div class="col-12">
                <h1 class="display-4">Welcome, ${member.name}!</h1>
                <p class="lead text-muted">Browse libraries, subscribe, and share your reviews</p>
            </div>
        </div>

        <#-- Quick Actions: profile, browse libraries, quick stats -->
        <div class="row mb-5">
            <div class="col-md-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title mb-3">Member Profile</h5>
                        <p class="card-text text-muted">View and edit your profile information</p>
                        <a href="/members/profile/edit" class="btn btn-primary">Edit Profile</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title mb-3">Browse Libraries</h5>
                        <p class="card-text text-muted">Discover and subscribe to libraries</p>
                        <a href="/members/libraries" class="btn btn-primary">Browse</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-0 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title mb-3">Quick Stats</h5>
                        <p class="mb-2">
                            <strong>Active Subscriptions:</strong><br>
                            ${(activeSubscriptions?size)!0}
                        </p>
                        <p class="mb-0">
                            <strong>Reviews Given:</strong><br>
                            ${(member.reviews?size)!0}
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <#-- Subscriptions Section: lists active subscriptions with metadata -->
        <div class="dashboard-section">
            <div class="row align-items-center mb-4">
                <div class="col">
                    <h2 class="mb-0">Your Subscriptions</h2>
                </div>
            </div>

            <#if activeSubscriptions?? && (activeSubscriptions?size > 0)>
                <div class="row">
                    <#list activeSubscriptions as sub>
                        <div class="col-md-6 col-lg-4">
                            <div class="card h-100 border-0 shadow-sm">
                                <div class="card-body">
                                    <a href="/members/libraries/${sub.library.id}" style="text-decoration: none; color: inherit;">
                                        <h5 class="card-title" style="cursor: pointer; color: #0d6efd;">
                                            ${sub.library.libraryName!'Library'}
                                        </h5>
                                    </a>
                                    <p class="card-text text-muted">
                                        <small>${(sub.library.description!'')?truncate(100)}</small>
                                    </p>
                                    <div class="mt-3 pt-3 border-top">
                                        <p class="mb-2">
                                            <small class="text-muted">
                                                <strong>Subscribed:</strong><br>
                                                <#assign subDate = sub.startDate?datetime.iso?date>
                                                ${subDate?string("MMM dd, yyyy")}
                                            </small>
                                        </p>
                                        <p class="mb-0">
                                            <small class="text-muted">
                                                <strong>Price:</strong><br>
                                                $${sub.library.price}
                                            </small>
                                        </p>
                                    </div>
                                </div>
                                <div class="card-footer bg-transparent border-top">
                                    <a href="/members/libraries/${sub.library.id}" class="btn btn-sm btn-outline-primary">
                                        View Library
                                    </a>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            <#else>
                <div class="alert alert-info" role="alert">
                    <strong>No subscriptions yet!</strong> <a href="/members/libraries">Browse libraries</a> to subscribe to your favorite content.
                </div>
            </#if>
        </div>

        <#-- Reviews Section: shows recent reviews by the member -->
        <div class="dashboard-section">
            <div class="row align-items-center mb-4">
                <div class="col">
                    <h2 class="mb-0">Recent Reviews</h2>
                </div>
            </div>

            <#if member.reviews?? && (member.reviews?size > 0)>
                <div class="row">
                    <#list member.reviews as r>
                        <div class="col-md-6 col-lg-4">
                            <div class="card h-100 border-0 shadow-sm">
                                <div class="card-body">
                                    <h5 class="card-title">${r.book.title}</h5>
                                    <p class="card-text">
                                        <small class="text-muted">${r.overallRating} ★</small>
                                    </p>
                                    <p class="card-text">
                                        <small>${(r.comment!'')?truncate(120)}</small>
                                    </p>
                                </div>
                                <div class="card-footer bg-transparent border-top">
                                    <small class="text-muted">${r.createdAt?string("MMM dd, yyyy")}</small>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            <#else>
                <div class="alert alert-info" role="alert">
                    <strong>No reviews yet!</strong> Subscribe to a library and share your thoughts on books.
                </div>
            </#if>
        </div>
    </div>

    <#-- Footer scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
