<#macro block title="">
    <!DOCTYPE html>
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
        <link rel="stylesheet" href="/styles/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
        <div class="container">
            <a class="navbar-brand" href="/">Ecommerce</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNav" aria-controls="navbarNav"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/">Accueil</a></li>
                    <li class="nav-item"><a class="nav-link" href="/about">À propos</a></li>
                    <#if isAuthenticated>
                        <li class="nav-item"><a class="nav-link" href="/profil">${currentUsername}</a></li>
                        <li class="nav-item">
                            <form action="/logout" class="d-inline" method="post">
                                <button type="submit" class="btn btn-link nav-link">Logout</button>
                            </form>
                        </li>
                    <#else >
                        <li class="nav-item"><a class="nav-link" href="/register">S'inscrire</a></li>
                        <li class="nav-item"><a class="nav-link" href="/login">Se connecter</a></li>
                    </#if>
                </ul>
            </div>
        </div>
    </nav>

    <main class="container">
        <#nested>
    </main>

    <footer class="bg-light text-center text-muted py-3">
        <div class="container">
            <small>&copy; 2025 - Ecommerce GVW-TECH -</small>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
    </html>
</#macro>