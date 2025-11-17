<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Review Detail</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">BookNexus</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/authors/dashboard">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="/authors/reviews">Back to Reviews</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <h2>${review.book.title}</h2>
    <p class="text-muted">Review by ${review.member.name!"Unknown"} — ${review.overallRating!""}★</p>

    <div class="mb-4">
        <h5>Comment</h5>
        <p>${review.comment!""}</p>
    </div>

    <#if review.authorResponse??>
        <div class="mb-4">
            <h5>Your Response (on ${review.authorResponseDate?string('yyyy-MM-dd HH:mm')})</h5>
            <p>${review.authorResponse}</p>
        </div>
    </#if>

    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title">Reply to reviewer</h5>
            <form method="post" action="/authors/reviews/${review.id}/respond">
                <div class="mb-3">
                    <label for="response" class="form-label">Response</label>
                    <textarea class="form-control" id="response" name="response" rows="4" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary">Send Response</button>
            </form>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>