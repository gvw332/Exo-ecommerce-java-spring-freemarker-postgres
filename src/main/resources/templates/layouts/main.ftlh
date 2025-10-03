<#macro block title="">
    <!DOCTYPE html>
    <html lang="fr">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

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
                <!-- Menu de gauche/centre -->
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="/">Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/art/">Galerie</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/about">À propos</a>
                    </li>
                </ul>

                <!-- Menu de droite -->
                <ul class="navbar-nav ms-auto">
                    <#if isAuthenticated>
                        <li class="nav-item">
                            <a class="nav-link" href="/profil">
                                <i class="bi bi-person-circle"></i> ${currentUsername}
                            </a>
                        </li>

                        <li class="nav-item">
                            <button class="btn btn-link nav-link" type="button" data-bs-toggle="offcanvas" data-bs-target="#cartOffcanvas">
                                <i class="bi bi-cart3"></i> Panier <span class="badge bg-danger" id="cartCount">0</span>
                            </button>
                        </li>

                        <li class="nav-item">
                            <form action="/logout" method="post" class="d-inline">
                                <button type="submit" class="btn btn-link nav-link" title="Déconnexion">
                                    <i class="bi bi-box-arrow-right"></i>
                                </button>
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

    <!-- Offcanvas Panier -->
    <#if isAuthenticated>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="cartOffcanvas" aria-labelledby="cartOffcanvasLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="cartOffcanvasLabel">Mon Panier</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <div id="cartContent">
                    <div class="text-center">
                        <div class="spinner-border" role="status">
                            <span class="visually-hidden">Chargement...</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </#if>

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

    <#if isAuthenticated>
        <script>
            // Charger le panier au chargement de la page
            document.addEventListener('DOMContentLoaded', function() {
                updateCartCount();
            });

            // Charger le contenu du panier quand l'offcanvas s'ouvre
            document.getElementById('cartOffcanvas').addEventListener('show.bs.offcanvas', function() {
                loadCartContent();
            });

            function updateCartCount() {
                const cartCountElement = document.getElementById('cartCount');
                if (!cartCountElement) return;

                fetch('/cart/count')
                    .then(response => response.json())
                    .then(data => {
                        cartCountElement.textContent = data.count;
                    })
                    .catch(error => console.error('Erreur:', error));
            }

            function loadCartContent() {
                fetch('/cart/content')
                    .then(response => response.text())
                    .then(html => {
                        document.getElementById('cartContent').innerHTML = html;
                    })
                    .catch(error => {
                        document.getElementById('cartContent').innerHTML =
                            '<div class="alert alert-danger">Erreur de chargement</div>';
                    });
            }

            function removeFromCart(cartItemId) {
                fetch('/cart/remove/' + cartItemId, {
                    method: 'POST'
                })
                    .then(() => {
                        loadCartContent();
                        updateCartCount();
                    })
                    .catch(error => console.error('Erreur:', error));
            }
        </script>
    </#if>

    <!-- Script Hide/Show Navbar on scroll -->
    <script>
        let lastScrollTop = 0;
        const navbar = document.querySelector('.navbar');
        const scrollThreshold = 100;

        window.addEventListener('scroll', function() {
            let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

            if (scrollTop < scrollThreshold) {
                navbar.classList.remove('navbar-hidden');
                lastScrollTop = scrollTop;
                return;
            }

            if (scrollTop > lastScrollTop) {
                navbar.classList.add('navbar-hidden');
            } else {
                navbar.classList.remove('navbar-hidden');
            }

            lastScrollTop = scrollTop;
        });
    </script>

    </body>
    </html>
</#macro>