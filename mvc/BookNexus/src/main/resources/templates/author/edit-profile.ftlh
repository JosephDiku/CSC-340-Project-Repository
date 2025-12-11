<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BookNexus - Edit Profile</title>
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
        .btn-primary, .btn-success {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn-primary:hover, .btn-success:hover {
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
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark mb-4">
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
                        <a class="nav-link" href="/authors/dashboard">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/authors/reviews">Reviews</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/authors/subscriptions">Subscriptions</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
                <div class="col-md-6">
                <div class="greeting-section">
                    <div style="display: flex; align-items: center;">
                        <i class="bi bi-person-circle" style="font-size: 2rem; margin-right: 1rem;"></i>
                        <div>
                            <h2 style="color: white; margin: 0;">Edit Profile</h2>
                            <p style="margin: 0; opacity: 0.95;">Update your information to help readers connect with you</p>
                        </div>
                    </div>
                </div>

                <#if error??>
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${error}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </#if>

                <div class="card">
                    <div class="card-body">
                        <form action="/authors/profile/edit" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label"><i class="bi bi-person"></i> Full Name</label>
                                <input type="text" class="form-control" id="name" name="name" 
                                    value="${author.name}" required>
                                <small class="text-muted">Use a pen name if you prefer — readers will see this.</small>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label"><i class="bi bi-envelope"></i> Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" 
                                    value="${author.email}" required>
                                <small class="text-muted">We'll never share your email with readers.</small>
                            </div>
                            <div class="mb-4">
                                <label for="currentPassword" class="form-label"><i class="bi bi-lock"></i> Current Password</label>
                                <input type="password" class="form-control" id="currentPassword" 
                                    name="currentPassword" required 
                                    placeholder="Enter your current password to confirm changes">
                            </div>
                            <div class="mb-3">
                                <label for="newPassword" class="form-label"><i class="bi bi-key"></i> New Password (Optional)</label>
                                <input type="password" class="form-control" id="newPassword" 
                                    name="newPassword" placeholder="Leave blank to keep current password">
                                <small class="text-muted">Only fill this if you want to change your password</small>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                <a href="/authors/dashboard" class="btn btn-secondary">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
