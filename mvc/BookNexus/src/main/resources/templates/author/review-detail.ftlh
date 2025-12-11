<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Review Detail</title>
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
        .card {
            border: none;
            border-radius: 1rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.08);
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.15);
        }
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(102, 126, 234, 0.3);
        }
        .form-control {
            border: 2px solid #e9ecef;
            border-radius: 0.5rem;
            transition: border-color 0.3s;
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.1);
        }
        h2 {
            color: #667eea;
            font-weight: 700;
        }
        .greeting-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 2rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 12px rgba(102, 126, 234, 0.15);
        }
        .review-content {
            background-color: #f8f9ff;
            padding: 1.5rem;
            border-radius: 0.75rem;
            border-left: 4px solid #667eea;
            margin-bottom: 1.5rem;
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
                <li class="nav-item"><a class="nav-link" href="/authors/reviews">Back to Reviews</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="greeting-section">
        <div style="display: flex; align-items: center;">
            <i class="bi bi-chat-left-text" style="font-size: 2rem; margin-right: 1rem;"></i>
            <div>
                <h2 style="color: white; margin: 0; font-size: 1.8rem;"><i class="bi bi-book"></i> ${review.book.title}</h2>
                <p style="margin: 0; opacity: 0.95;"><i class="bi bi-person-circle"></i> Review by ${review.member.name!"Unknown"} | <i class="bi bi-star-fill" style="color: #ffc107;"></i> ${review.overallRating!""}</p>
            </div>
        </div>
    </div>

    <div class="review-content">
        <h5><i class="bi bi-quote"></i> Reader Comment</h5>
        <p>${review.comment!""}</p>
    </div>

    <#if review.authorResponse??>
        <div class="review-content" style="border-left-color: #27ae60; background-color: #eafaf1;">
            <h5><i class="bi bi-check-circle"></i> Your Response</h5>
            <p style="margin-bottom: 0;">${review.authorResponse}</p>
            <small style="color: #666;">Sent on ${review.authorResponseDate?string('yyyy-MM-dd HH:mm')}</small>
        </div>
    </#if>

    <div class="card mb-4">
        <div class="card-body">
            <h5 class="card-title"><i class="bi bi-reply"></i> Reply to Reviewer</h5>
            <p class="text-muted">Thank them for their time — a thoughtful response builds goodwill.</p>
            <form method="post" action="/authors/reviews/${review.id}/respond">
                <div class="mb-3">
                    <label for="response" class="form-label"><i class="bi bi-pencil"></i> Response</label>
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