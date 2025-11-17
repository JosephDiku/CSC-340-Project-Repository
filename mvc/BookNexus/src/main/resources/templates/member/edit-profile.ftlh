<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookNexus - Edit Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>.small-muted{font-size:.9rem;color:#6c757d;}</style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
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
                <h2 class="mb-4">Edit Profile</h2>

                <#if error??>
                    <div class="alert alert-danger">${error}</div>
                </#if>

                <div class="card">
                    <div class="card-body">
                        <form action="/members/profile/edit" method="post">
                            <div class="mb-3">
                                <label class="form-label" for="name">Full Name</label>
                                <input id="name" name="name" class="form-control" value="${member.name}" required />
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="email">Email</label>
                                <input id="email" name="email" class="form-control" value="${member.email}" required />
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="currentPassword">Current Password</label>
                                <input id="currentPassword" name="currentPassword" type="password" class="form-control" required placeholder="Enter current password to confirm" />
                            </div>
                            <div class="mb-3">
                                <label class="form-label" for="newPassword">New Password (optional)</label>
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
