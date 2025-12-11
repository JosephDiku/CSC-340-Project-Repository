<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>BookNexus - Author Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            padding: 2rem 0;
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

        .card-header p {
            color: rgba(255, 255, 255, 0.9);
            margin-top: 0.75rem;
            margin-bottom: 0;
            font-size: 0.95rem;
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

        .info-section {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 1rem;
            margin-bottom: 2rem;
        }

        .info-section h5 {
            color: #667eea;
            font-weight: 700;
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .info-section ul {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .info-section li {
            padding: 0.5rem 0;
            color: #666;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            font-size: 0.95rem;
        }

        .info-section i {
            color: #667eea;
            font-weight: 700;
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

        .back-home {
            text-align: center;
            margin-top: 2rem;
        }

        .back-home a {
            color: white;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease-in-out;
        }

        .back-home a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="container signup-container">
        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-8">
                <div class="card">
                    <div class="card-header">
                        <h3><i class="bi bi-pencil-square"></i> Create Author Account</h3>
                        <p>Publish your works and connect with passionate readers worldwide</p>
                    </div>
                    <div class="card-body">
                        <div class="info-section">
                            <h5><i class="bi bi-star-fill"></i> Why Join as an Author?</h5>
                            <ul>
                                <li><i class="bi bi-check-circle-fill"></i> Publish and share your books with readers</li>
                                <li><i class="bi bi-check-circle-fill"></i> Manage your library and track engagement</li>
                                <li><i class="bi bi-check-circle-fill"></i> Connect with your audience directly</li>
                                <li><i class="bi bi-check-circle-fill"></i> Grow your author brand</li>
                            </ul>
                        </div>

                        <form action="/authors/signup" method="post">
                            <div class="mb-3">
                                <label for="name" class="form-label"><i class="bi bi-person"></i> Full Name</label>
                                <input type="text" class="form-control" id="name" name="name" required placeholder="Your full name">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label"><i class="bi bi-envelope"></i> Email Address</label>
                                <input type="email" class="form-control" id="email" name="email" required placeholder="your@email.com">
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label"><i class="bi bi-lock"></i> Password</label>
                                <input type="password" class="form-control" id="password" name="password" required placeholder="Create a strong password">
                            </div>
                            <div class="mb-4">
                                <label for="confirmPassword" class="form-label"><i class="bi bi-lock-check"></i> Confirm Password</label>
                                <input type="password" class="form-control" id="confirmPassword" 
                                    name="confirmPassword" required placeholder="Confirm your password">
                            </div>
                            <button type="submit" class="btn btn-primary w-100"><i class="bi bi-person-plus"></i> Create Account</button>
                        </form>
                        <div class="signin-link">
                            <p class="mb-0 text-muted">Already have an account? <a href="/signin"><i class="bi bi-door-open"></i> Sign In</a></p>
                        </div>
                    </div>
                </div>
                <div class="back-home">
                    <a href="/"><i class="bi bi-house"></i> Back to Home</a>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
