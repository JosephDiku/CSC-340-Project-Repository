<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>${title!"BookNexus - Sign In"}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .signin-container {
            position: relative;
            z-index: 1;
        }

        .card {
            border: none;
            border-radius: 1.5rem;
            box-shadow: 0 1rem 3rem rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            padding: 2rem;
        }

        .card-header h3 {
            color: white;
            margin: 0;
            font-weight: 700;
        }

        .nav-tabs {
            border: none;
        }

        .nav-tabs .nav-link {
            color: rgba(255, 255, 255, 0.7);
            border: none;
            font-weight: 600;
            position: relative;
            transition: all 0.3s ease-in-out;
        }

        .nav-tabs .nav-link:hover {
            color: white;
        }

        .nav-tabs .nav-link.active {
            color: white;
            background: none;
            border: none;
        }

        .nav-tabs .nav-link.active::after {
            content: '';
            position: absolute;
            bottom: -12px;
            left: 0;
            right: 0;
            height: 3px;
            background: white;
            border-radius: 3px;
        }

        .card-body {
            padding: 2.5rem;
        }

        .form-label {
            font-weight: 600;
            color: #333;
            margin-bottom: 0.75rem;
        }

        .form-control {
            border: 2px solid #e9ecef;
            border-radius: 0.75rem;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease-in-out;
        }

        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.15);
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(102, 126, 234, 0.4);
        }

        .tab-pane h3 {
            color: #667eea;
            margin-bottom: 1.5rem;
            font-weight: 700;
        }

        .tab-pane .mt-3 a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
        }

        .tab-pane .mt-3 a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .signin-icon {
            font-size: 1.25rem;
            margin-right: 0.5rem;
        }

        .badge {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 0.5rem 1rem;
            border-radius: 2rem;
        }
    </style>
</head>

<body>
    <div class="container signin-container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card">
                    <div class="card-header text-center">
                        <h3><i class="bi bi-door-open"></i> Sign In to BookNexus</h3>
                    </div>
                    <div class="card-header" style="padding: 0.5rem 0;">
                        <ul class="nav nav-tabs card-header-tabs justify-content-center">
                            <li class="nav-item">
                                <a class="nav-link active" id="member-tab" data-bs-toggle="tab"
                                    href="#member"><i class="bi bi-person"></i> Member</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="farmer-tab" data-bs-toggle="tab" href="#farmer"><i class="bi bi-pencil-square"></i> Author</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="member">
                                <h3><i class="bi bi-person-circle"></i> Member Sign In</h3>
                                <form action="/members/signin" method="post">
                                    <div class="mb-3">
                                        <label for="memberEmail" class="form-label"><i class="bi bi-envelope"></i> Email Address</label>
                                        <input type="email" class="form-control" id="memberEmail" name="email"
                                            required placeholder="your@email.com">
                                    </div>
                                    <div class="mb-3">
                                        <label for="memberPassword" class="form-label"><i class="bi bi-lock"></i> Password</label>
                                        <input type="password" class="form-control" id="memberPassword"
                                            name="password" required placeholder="Enter your password">
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100"><i class="bi bi-door-open"></i> Sign In</button>
                                </form>
                                <div class="mt-4 text-center">
                                    <p class="mb-0 text-muted">Don't have an account?</p>
                                    <a href="/members/signup"><i class="bi bi-person-plus"></i> Sign up as a member</a>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="farmer">
                                <h3><i class="bi bi-pencil-square"></i> Author Sign In</h3>
                                <form action="/authors/signin" method="post">
                                    <div class="mb-3">
                                        <label for="authorEmail" class="form-label"><i class="bi bi-envelope"></i> Email Address</label>
                                        <input type="email" class="form-control" id="authorEmail" name="email" required placeholder="your@email.com">
                                    </div>
                                    <div class="mb-3">
                                        <label for="authorPassword" class="form-label"><i class="bi bi-lock"></i> Password</label>
                                        <input type="password" class="form-control" id="authorPassword" name="password"
                                            required placeholder="Enter your password">
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100"><i class="bi bi-door-open"></i> Sign In</button>
                                </form>
                                <div class="mt-4 text-center">
                                    <p class="mb-0 text-muted">Don't have an account?</p>
                                    <a href="/authors/signup"><i class="bi bi-pencil-square"></i> Sign up as an author</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <a href="/" class="text-white text-decoration-none"><i class="bi bi-house"></i> Back to Home</a>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>