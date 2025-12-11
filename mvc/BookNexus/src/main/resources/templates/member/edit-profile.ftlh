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
        .form-control, .form-select {
            border: 2px solid #e9ecef;
            border-radius: 0.5rem;
            transition: border-color 0.3s;
        }
        .form-control:focus, .form-select:focus {
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
        .small-muted{font-size:.9rem;color:#6c757d;}
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">BookNexus</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/members/dashboard">Dashboard</a></li>
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
                            <p style="margin: 0; opacity: 0.95;">Update your information</p>
                        </div>
                    </div>
                </div>

                <#if error??>
                    <div class="alert alert-danger">${error}</div>
                </#if>

                <div class="card">
                    <div class="card-body">
                        <form action="/members/profile/edit" method="post">
                            <div class="mb-3">
                                <label class="form-label" for="name"><i class="bi bi-person"></i> Full Name</label>
                                <input id="name" name="name" class="form-control" value="${member.name}" required />
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="email"><i class="bi bi-envelope"></i> Email</label>
                                <input id="email" name="email" class="form-control" value="${member.email}" required />
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="currentPassword"><i class="bi bi-lock"></i> Current Password</label>
                                <input id="currentPassword" name="currentPassword" type="password" class="form-control" required placeholder="Enter current password to confirm" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="newPassword"><i class="bi bi-key"></i> New Password (optional)</label>
                                <input id="newPassword" name="newPassword" type="password" class="form-control" placeholder="Leave blank to keep current password" />
                                <div class="small-muted">Only fill this to change your password</div>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                                <a class="btn btn-secondary" href="/members/dashboard">Cancel</a>
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
