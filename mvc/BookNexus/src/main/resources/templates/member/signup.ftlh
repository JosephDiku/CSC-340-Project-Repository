<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookNexus - Member Signup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">BookNexus</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/signin">Sign In</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="mb-4">Create a Member Account</h2>

                <div class="card">
                    <div class="card-body">
                        <form action="/members/signup" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label">Full Name</label>
                                <input id="name" name="name" class="form-control" type="text" required />
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input id="email" name="email" class="form-control" type="email" required />
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input id="password" name="password" class="form-control" type="password" required />
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-success">Sign Up</button>
                                <a class="btn btn-secondary" href="/signin">Cancel</a>
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
