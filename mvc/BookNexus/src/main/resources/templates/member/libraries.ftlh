<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BookNexus - Libraries</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">BookNexus</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/members/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="/members/logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row mb-4">
            <div class="col-12">
                <h1>Available Libraries</h1>
                <p class="text-muted">Browse libraries and subscribe to follow their new releases.</p>
            </div>
        </div>

        <div class="row">
            <#if libraries?? && (libraries?size > 0)>
                <#list libraries as lib>
                    <div class="col-md-4 mb-3">
                        <div class="card h-100 border-0 shadow-sm">
                            <div class="card-body">
                                <h5 class="card-title">${lib.libraryName!'Unnamed Library'}</h5>
                                <p class="card-text text-muted">${(lib.description!'')?truncate(120)}</p>
                            </div>
                            <div class="card-footer bg-transparent border-top">
                                <a href="/members/libraries/${lib.id}" class="btn btn-primary btn-sm">View</a>
                            </div>
                        </div>
                    </div>
                </#list>
            <#else>
                <div class="col-12">
                    <div class="alert alert-info">No libraries available.</div>
                </div>
            </#if>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
