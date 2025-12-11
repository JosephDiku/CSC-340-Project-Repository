<!DOCTYPE html>
<html>

<#--
    Member Dashboard Template
    - Shows active subscriptions, reviews, and quick stats
    - CSS is externalized to css/dashboard.css for better maintainability
    -->

<head>
    <meta charset="UTF-8">
    <title>BookNexus - Member Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="/css/member/dashboard.css" rel="stylesheet">
</head>

<body>
    <#-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark navbar-custom mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">BookNexus</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/members/libraries">Libraries</a></li>
                    <!-- Removed primary CTA from navbar to avoid redundancy -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="memberDropdown" role="button" data-bs-toggle="dropdown">
                            <span class="nav-user-pill">${member.name}</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="memberDropdown">
                            <li><a class="dropdown-item" href="/members/profile/edit">Edit Profile</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="/members/logout">Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <#-- Welcome Header -->
    <div class="dashboard-header">
        <div class="container">
            <h1>Welcome, ${member.name}!</h1>
            <p class="lead" style="color: #e6eef5;">Explore libraries, subscribe, and share your reviews</p>
            <a href="/members/libraries" class="btn-welcome-cta">Browse Libraries</a>
        </div>
    </div>

    <div class="container">
        <#-- Stat Cards -->
        <div class="quick-stats">
            <div class="quick-stats-card accent-blue">
                <h5>Active Subscriptions</h5>
                <div class="quick-stats-value">${(activeSubscriptions?size)!0}</div>
                <small>libraries you follow</small>
            </div>
            <div class="quick-stats-card accent-green">
                <h5>Reviews Given</h5>
                <div class="quick-stats-value">${(member.reviews?size)!0}</div>
                <small>total reviews</small>
            </div>
            <div class="quick-stats-card accent-gold">
                <h5>Member Since</h5>
                <div class="quick-stats-value">
                    <#if member.createdAt??>${member.createdAt?string('MMM yyyy')}<#else>--</#if>
                </div>
                <small>
                    <#if member.createdAt??>${member.createdAt?string('MMMM d, yyyy')}<#else>active member</#if>
                </small>
            </div>
        </div>

        <#-- Subscriptions Section -->
        <div class="dashboard-section">
            <h2>Your Subscriptions</h2>
            <#if activeSubscriptions?? && (activeSubscriptions?size > 0)>
                <div class="row">
                    <#list activeSubscriptions as sub>
                        <div class="col-md-6 col-lg-4">
                            <div class="card h-100">
                                <div class="card-body">
                                    <a href="/members/libraries/${sub.library.id}" style="text-decoration: none; color: inherit;">
                                        <h5 class="card-title" style="cursor: pointer; color: #2c3e50;">
                                            ${sub.library.libraryName!'Library'}
                                        </h5>
                                    </a>
                                    <p class="card-text"><small>${(sub.library.description!'')?truncate(100)}</small></p>
                                    <div style="margin-top: 1rem; padding-top: 1rem; border-top: 1px solid #eee;">
                                        <p style="margin: 0.5rem 0; font-size: 0.9rem;">
                                            <small style="color: #999;"><strong>Subscribed:</strong></small><br>
                                            <small style="color: #555;">
                                                <#assign subDate = sub.startDate?datetime.iso?date>
                                                ${subDate?string("MMM dd, yyyy")}
                                            </small>
                                        </p>
                                        <p style="margin: 0.5rem 0; font-size: 0.9rem;">
                                            <small style="color: #999;"><strong>Price:</strong></small><br>
                                            <small style="color: #555;">$${sub.library.price}</small>
                                        </p>
                                    </div>
                                </div>
                                <div style="border-top: 1px solid #eee; padding: 1rem; background: #fafafa;">
                                    <a href="/members/libraries/${sub.library.id}" class="btn btn-sm btn-outline-primary" style="width: 100%; text-align: center;">
                                        View Library
                                    </a>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            <#else>
                <div class="empty-state-block">
                    <div class="empty-state-icon">📚</div>
                    <h4>No Subscriptions Yet</h4>
                    <p>Start exploring libraries and subscribe to your favorite collections today.</p>
                    <!-- Removed secondary CTA button to keep hero as primary CTA -->
                </div>
            </#if>
        </div>

        <#-- Reviews Section -->
        <div class="dashboard-section">
            <h2>Recent Reviews</h2>
            <#if member.reviews?? && (member.reviews?size > 0)>
                <div class="row">
                    <#list member.reviews as r>
                        <div class="col-md-6 col-lg-4">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title">${r.book.title}</h5>
                                    <p class="card-text"><small style="color: #3a505e; font-weight: 500;">${r.overallRating} ★</small></p>
                                    <p class="card-text"><small>${(r.comment!'')?truncate(120)}</small></p>
                                </div>
                                <div style="border-top: 1px solid #eee; padding: 1rem; background: #fafafa;">
                                    <small style="color: #999;">${r.createdAt?string("MMM dd, yyyy")}</small>
                                </div>
                            </div>
                        </div>
                    </#list>
                </div>
            <#else>
                <div class="empty-state-block">
                    <div class="empty-state-icon">⭐</div>
                    <h4>No Reviews Yet</h4>
                    <p>Subscribe to libraries and share your honest reviews to help the community.</p>
                    <a href="/members/libraries" class="btn btn-primary btn-lg">Explore Libraries</a>
                </div>
            </#if>
        </div>

        </div>
    </div>
</body>

</html>
