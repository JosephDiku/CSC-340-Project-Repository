<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>${title!"BookNexus - Sign In"}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
        <div class="container">
            <a class="navbar-brand" href="/">
                BookNexus
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="/">Home</a>
                    </li>
                    <#if authorId?? || memberId??>
                        <#if memberId??>
                            <li class="nav-item">
                                <a class="nav-link" href="/members/dashboard">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/members/logout">Logout</a>
                            </li>
                            <#else>
                                <li class="nav-item">
                                    <a class="nav-link" href="/authors/dashboard">Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/authors/logout">Logout</a>
                                </li>
                        </#if>
                        <#else>
                            <li class="nav-item">
                                <a class="nav-link" href="/signin">Sign In</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/signup">Sign Up</a>
                            </li>
                    </#if>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs">
                            <li class="nav-item">
                                <a class="nav-link active" id="customer-tab" data-bs-toggle="tab"
                                    href="#customer">Customer</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="farmer-tab" data-bs-toggle="tab" href="#farmer">Author</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="customer">
                                <h3 class="card-title mb-4">Member Sign In</h3>
                                <form action="/members/signin" method="post">
                                    <div class="mb-3">
                                        <label for="memberEmail" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="memberEmail" name="email"
                                            required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="memberPassword" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="memberPassword"
                                            name="password" required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Sign In</button>
                                </form>
                                <div class="mt-3">
                                    <a href="/members/signup">Need an account? Sign up as a member</a>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="farmer">
                                <h3 class="card-title mb-4">Author Sign In</h3>
                                <form action="/authors/signin" method="post">
                                    <div class="mb-3">
                                        <label for="authorEmail" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="authorEmail" name="email" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="authorPassword" class="form-label">Password</label>
                                        <input type="password" class="form-control" id="authorPassword" name="password"
                                            required>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Sign In</button>
                                </form>
                                <div class="mt-3">
                                    <a href="/authors/signup">Need an account? Sign up as an author</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>