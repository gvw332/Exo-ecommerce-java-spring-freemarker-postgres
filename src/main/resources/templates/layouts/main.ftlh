<#macro block title="">
    <!DOCTYPE html>
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Ton CSS personnalisé -->
        <link rel="stylesheet" href="/styles/style.css">
    </head>
    <body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
        <div class="container">
            <a class="navbar-brand fw-bold" href="/">Ecommerce</a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarNav" aria-controls="navbarNav"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">

                    <li class="nav-item">
                        <a class="nav-link" href="/">Accueil</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="/about">À propos</a>
                    </li>

                    <#if isAuthenticated>
                        <!-- Lien vers le profil avec nom -->
                        <li class="nav-item">
                            <a class="nav-link" href="/profil">
                                <i class="bi bi-person-circle me-1"></i>${currentUsername}
                            </a>
                        </li>

                        <!-- Bouton logout en tant que formulaire inline -->
                        <li class="nav-item">
                            <form action="/logout" method="post" class="d-inline">
                                <button type="submit" class="btn btn-link nav-link">Déconnexion</button>
                            </form>
                        </li>

                    <#else>
                        <li class="nav-item">
                            <a class="nav-link" href="/register">S'inscrire</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="/login">Se connecter</a>
                        </li>
                    </#if>

                </ul>
            </div>
        </div>
    </nav>

    <!-- Contenu principal -->
    <main class="container py-4">
        <#nested>
    </main>

    <!-- Footer -->
    <footer class="bg-light text-center text-muted py-3 mt-auto">
        <div class="container">
            <small>&copy; 2025 - Ecommerce GVW-TECH</small>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Bootstrap Icons (si tu veux utiliser les icônes, comme "bi bi-person-circle") -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

    </body>
    </html>
</#macro>
