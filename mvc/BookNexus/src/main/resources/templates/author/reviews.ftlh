<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Author Reviews</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">BookNexus</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/authors/dashboard">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="/authors/subscriptions">Subscriptions</a></li>
                <li class="nav-item"><a class="nav-link" href="/authors/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h1>Reviews for your books</h1>
    <#if reviews?? && (reviews?size > 0)>
        <div class="list-group mt-3">
            <#list reviews as review>
                <a href="/authors/reviews/${review.id}" class="list-group-item list-group-item-action">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1">${review.book.title}</h5>
                        <small>by ${review.member.name!"Unknown"} - ${review.overallRating!""}★</small>
                    </div>
                    <p class="mb-1">${(review.comment!"")?truncate(150)}</p>
                    <#if review.authorResponse??>
                        <small class="text-muted">Your response: ${(review.authorResponse!"")?truncate(100)}</small>
                    </#if>
                </a>
            </#list>
        </div>
    <#else>
        <div class="alert alert-info mt-3">No reviews yet.</div>
    </#if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>