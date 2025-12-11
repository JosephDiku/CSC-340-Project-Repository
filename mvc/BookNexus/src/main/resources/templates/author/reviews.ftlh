<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Author Reviews</title>
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
        .list-group-item {
            border: 1px solid #e9ecef;
            border-radius: 0.5rem;
            margin-bottom: 0.75rem;
            transition: all 0.3s ease;
        }
        .list-group-item:hover {
            background-color: #f8f9ff;
            border-color: #667eea;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.08);
        }
        .list-group-item h5 {
            color: #667eea;
            font-weight: 700;
        }
        h1 {
            color: #667eea;
            font-weight: 700;
            margin-top: 2rem;
        }
        .greeting-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.15);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark mb-4">
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
    <div class="greeting-section">
        <div style="display: flex; align-items: center;">
            <i class="bi bi-chat-left-text" style="font-size: 2rem; margin-right: 1rem;"></i>
            <div>
                <h1 style="color: white; margin: 0; font-size: 2rem;">Reviews for your books</h1>
                <p style="margin: 0; opacity: 0.95;">Reader feedback helps your craft. Reply kindly when appropriate</p>
            </div>
        </div>
    </div>

    <#if reviews?? && (reviews?size > 0)>
        <div class="list-group mt-3">
            <#list reviews as review>
                <a href="/authors/reviews/${review.id}" class="list-group-item list-group-item-action">
                    <div class="d-flex w-100 justify-content-between">
                        <h5 class="mb-1"><i class="bi bi-book"></i> ${review.book.title}</h5>
                        <small><i class="bi bi-star-fill" style="color: #ffc107;"></i> ${review.overallRating!""}</small>
                    </div>
                    <p class="mb-1"><i class="bi bi-person-circle"></i> by ${review.member.name!"Unknown"}</p>
                    <p class="mb-1">${(review.comment!"")?truncate(150)}</p>
                    <#if review.authorResponse??>
                        <small class="text-muted"><i class="bi bi-reply"></i> Your response: ${(review.authorResponse!"")?truncate(100)}</small>
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