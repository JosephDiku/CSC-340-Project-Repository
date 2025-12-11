<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Subscriptions</title>
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
        .table {
            border-radius: 1rem;
            overflow: hidden;
        }
        .table thead {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .table th {
            border: none;
            font-weight: 700;
            padding: 1.25rem;
        }
        .table tbody tr {
            border-bottom: 1px solid #e9ecef;
            transition: background-color 0.3s;
        }
        .table tbody tr:hover {
            background-color: #f8f9ff;
        }
        .btn-danger {
            background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
            border: none;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px rgba(231, 76, 60, 0.3);
        }
        h1 {
            color: #667eea;
            font-weight: 700;
            margin-top: 2rem;
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
        <a class="navbar-brand" href="/">BookNexus</a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="/authors/dashboard">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="/authors/reviews">Reviews</a></li>
                <li class="nav-item"><a class="nav-link" href="/authors/logout">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="greeting-section">
        <div style="display: flex; align-items: center;">
            <i class="bi bi-heart-fill" style="font-size: 2rem; margin-right: 1rem;"></i>
            <div>
                <h1 style="color: white; margin: 0; font-size: 2rem;">Active Subscriptions</h1>
                <p style="margin: 0; opacity: 0.95;">Supporters of your work — consider sending occasional thank-you notes</p>
            </div>
        </div>
    </div>

    <#if subscriptions?? && (subscriptions?size > 0)>
        <table class="table mt-3">
            <thead>
            <tr>
                <th><i class="bi bi-person-circle"></i> Member</th>
                <th><i class="bi bi-calendar"></i> Start</th>
                <th><i class="bi bi-calendar"></i> End</th>
                <th><i class="bi bi-check-circle"></i> Active</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <#list subscriptions as s>
                <tr>
                    <td>${s.member.name!"Unknown"}</td>
                    <td>${s.startDate!""}</td>
                    <td><#if s.endDate??>${s.endDate}<#else>—</#if></td>
                    <td>${s.active?string('true','false')}</td>
                    <td>
                        <form method="post" action="/authors/subscriptions/${s.subscriptionId}/cancel" onsubmit="return confirm('Cancel subscription?');">
                            <button class="btn btn-sm btn-danger">Cancel</button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
    <#else>
        <div class="alert alert-info mt-3">No subscriptions yet.</div>
    </#if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>