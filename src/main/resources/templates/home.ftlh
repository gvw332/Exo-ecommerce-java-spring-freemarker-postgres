<#import "layouts/main.ftlh" as layout>

<@layout.block title="Accueil - Galerie d'Art">

    <!-- Hero Section -->
    <div class="hero-section text-center">
        <div class="container">
            <h1 class="display-3 mb-4">Galerie d'Art Classique</h1>
            <p class="lead mb-4">Une sélection raffinée d'œuvres des grands maîtres</p>
            <a href="/art/" class="btn btn-lg">Découvrir la Collection</a>
        </div>
    </div>

    <!-- Features -->
    <div class="container my-5">
        <div class="row g-4">
            <div class="col-md-4">
                <div class="feature-box text-center">
                    <h4>Œuvres Authentiques</h4>
                    <p class="text-muted">Reproductions de haute qualité certifiées et numérotées</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box text-center">
                    <h4>Expertise Artistique</h4>
                    <p class="text-muted">Sélection rigoureuse par nos historiens d'art</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box text-center">
                    <h4>Livraison Soignée</h4>
                    <p class="text-muted">Emballage professionnel et assurance incluse</p>
                </div>
            </div>
        </div>
    </div>

    <div class="section-divider"></div>

    <!-- About Section -->
    <div class="container my-5 py-4">
        <div class="row align-items-center">
            <div class="col-md-6">
                <h2 class="mb-4">L'Art au Cœur de Votre Intérieur</h2>
                <p class="lead text-muted">Depuis plus de deux décennies, nous rendons accessible l'art des grands maîtres.</p>
                <p>Notre galerie propose des reproductions fidèles d'œuvres emblématiques, de la Renaissance aux mouvements modernes. Chaque pièce est imprimée sur des supports de qualité musée et accompagnée d'un certificat d'authenticité.</p>
                <a href="/about" class="btn btn-outline-primary mt-3">Notre Histoire</a>
            </div>
            <div class="col-md-6">
                <div class="p-5 text-center" style="background-color: var(--cream); border: 2px solid var(--beige-dark); border-radius: 8px;">
                    <h3 class="mb-4">Nos Garanties</h3>
                    <ul class="list-unstyled text-start">
                        <li class="mb-3"><strong>Qualité Musée</strong> - Impression giclée sur toile</li>
                        <li class="mb-3"><strong>Retour 30 jours</strong> - Satisfait ou remboursé</li>
                        <li class="mb-3"><strong>Encadrement sur mesure</strong> - Options disponibles</li>
                        <li class="mb-3"><strong>Livraison assurée</strong> - Suivi et protection</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="section-divider"></div>

    <!-- CTA -->
    <div class="container text-center my-5 py-5">
        <h2 class="mb-4">Parcourez Notre Collection</h2>
        <p class="lead text-muted mb-4">De Van Gogh à Da Vinci, trouvez l'œuvre qui sublimera votre espace</p>
        <a href="/art/" class="btn btn-primary btn-lg px-5">Voir la Galerie</a>
    </div>

</@layout.block>