<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Library Subscriptions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
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
    <h1>Active Subscriptions</h1>
    <#if subscriptions?? && (subscriptions?size > 0)>
        <table class="table mt-3">
            <thead>
            <tr>
                <th>Member</th>
                <th>Start</th>
                <th>End</th>
                <th>Active</th>
                <th></th>
            </tr>
            </thead>
            <tbody>
            <#list subscriptions as s>
                <tr>
                    <td>${s.member.name!"Unknown"}</td>
                    <td>${s.startDate?string('yyyy-MM-dd')}</td>
                    <td><#if s.endDate??>${s.endDate?string('yyyy-MM-dd')}<#else>—</#if></td>
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