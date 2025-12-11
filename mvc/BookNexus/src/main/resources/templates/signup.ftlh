<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>${title!"BookNexus - Sign Up"}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .signup-container {
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
            padding: 2.5rem 2rem;
            text-align: center;
        }

        .card-header h3 {
            color: white;
            margin: 0;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.75rem;
            font-size: 1.75rem;
        }

        .card-body {
            padding: 2.5rem;
        }

        .account-type-card {
            border: 2px solid #e9ecef;
            border-radius: 1rem;
            padding: 2rem;
            text-align: center;
            transition: all 0.3s ease-in-out;
            cursor: pointer;
            background: white;
            height: 100%;
        }

        .account-type-card:hover {
            border-color: #667eea;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.15);
            transform: translateY(-5px);
        }

        .account-type-card h5 {
            color: #667eea;
            font-weight: 700;
            margin-bottom: 1rem;
        }

        .account-type-icon {
            font-size: 3rem;
            color: #667eea;
            margin-bottom: 1rem;
        }

        .account-type-card p {
            color: #666;
            margin-bottom: 1.5rem;
            font-size: 0.95rem;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
            width: 100%;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 16px rgba(102, 126, 234, 0.4);
        }

        .signin-link {
            text-align: center;
            margin-top: 2rem;
            padding-top: 2rem;
            border-top: 2px solid #e9ecef;
        }

        .signin-link a {
            color: #667eea;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
        }

        .signin-link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .feature-list {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
        }

        .feature-list ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .feature-list li {
            padding: 0.5rem 0;
            color: #666;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .feature-list i {
            color: #667eea;
            font-weight: 700;
        }
    </style>
</head>

<body>
    <div class="container signup-container">
        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="bi bi-rocket-fill"></i> Join BookNexus</h3>
                        <p class="text-white-50 mb-0 mt-2">Choose your account type and get started today!</p>
                    </div>
                    <div class="card-body">
                        <div class="row mb-4">
                            <div class="col-md-6 mb-3 mb-md-0">
                                <div class="account-type-card">
                                    <div class="account-type-icon">
                                        <i class="bi bi-person-circle"></i>
                                    </div>
                                    <h5>Member</h5>
                                    <p>Discover books, join libraries, and share your reading reviews with the community.</p>
                                    <div class="feature-list">
                                        <ul>
                                            <li><i class="bi bi-check-circle-fill"></i> Browse thousands of books</li>
                                            <li><i class="bi bi-check-circle-fill"></i> Join libraries & collections</li>
                                            <li><i class="bi bi-check-circle-fill"></i> Share your reviews</li>
                                        </ul>
                                    </div>
                                    <a href="/members/signup" class="btn btn-primary"><i class="bi bi-person-plus"></i> Sign Up as Member</a>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="account-type-card">
                                    <div class="account-type-icon">
                                        <i class="bi bi-pencil-square"></i>
                                    </div>
                                    <h5>Author</h5>
                                    <p>Publish your works, manage your library, and connect with passionate readers worldwide.</p>
                                    <div class="feature-list">
                                        <ul>
                                            <li><i class="bi bi-check-circle-fill"></i> Publish your books</li>
                                            <li><i class="bi bi-check-circle-fill"></i> Manage your library</li>
                                            <li><i class="bi bi-check-circle-fill"></i> Track reader engagement</li>
                                        </ul>
                                    </div>
                                    <a href="/authors/signup" class="btn btn-primary"><i class="bi bi-pencil-square"></i> Sign Up as Author</a>
                                </div>
                            </div>
                        </div>
                        <div class="signin-link">
                            <p class="mb-0 text-muted">Already have an account? <a href="/signin"><i class="bi bi-door-open"></i> Sign In</a></p>
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