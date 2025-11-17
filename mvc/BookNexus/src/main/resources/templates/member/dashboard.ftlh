<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookNexus - Member Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">BookNexus</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/members/libraries">Libraries</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="memberDropdown" data-bs-toggle="dropdown">${member.name}</a>
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

    <div class="container">
        <div class="row mb-4">
            <div class="col-12">
                <h1 class="display-5">Welcome, ${member.name}!</h1>
                <p class="text-muted">Your subscriptions and recent activity.</p>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <div class="card mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Your Subscriptions</h5>
                        <#if member.subscriptions?? && (member.subscriptions?size > 0)>
                            <ul class="list-group list-group-flush">
                                <#list member.subscriptions as sub>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <div>
                                            <strong>${sub.library.name}</strong><br>
                                            <small class="text-muted">Active: <#if sub.active>Yes<#else>No</#if></small>
                                        </div>
                                        <a class="btn btn-sm btn-outline-primary" href="/members/libraries/${sub.library.id}">View</a>
                                    </li>
                                </#list>
                            </ul>
                        <#else>
                            <div class="alert alert-info">You have no subscriptions. Browse libraries to subscribe.</div>
                        </#if>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="card mb-3">
                    <div class="card-body">
                        <h5 class="card-title">Recent Reviews</h5>
                        <#if member.reviews?? && (member.reviews?size > 0)>
                            <#list member.reviews as r>
                                <div class="mb-2">
                                    <strong>${r.book.title}</strong>
                                    <div><small class="text-muted">${r.overallRating} ★ — ${r.createdAt?string("yyyy-MM-dd")}</small></div>
                                    <p class="mb-1">${(r.comment! '')}</p>
                                </div>
                            </#list>
                        <#else>
                            <div class="text-muted">No recent reviews.</div>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
