<#import "layouts/main.ftlh" as layout>

<@layout.block title="À Propos - Notre Histoire">

    <div class="container py-5">
        <!-- Header -->
        <div class="text-center mb-5">
            <h1 class="display-4 mb-3">Notre Histoire</h1>
            <div class="section-divider mx-auto" style="width: 200px;"></div>
        </div>

        <!-- Notre Mission -->
        <div class="row mb-5 align-items-center">
            <div class="col-md-6">
                <h2 class="mb-4">Une Passion pour l'Art</h2>
                <p class="lead">Depuis 2020, notre galerie s'est donnée pour mission de démocratiser l'accès aux chefs-d'œuvre de l'histoire de l'art.</p>
                <p>Nous croyons que l'art appartient à tous et que chacun devrait pouvoir enrichir son quotidien avec des reproductions de haute qualité des plus grandes œuvres artistiques. De la Renaissance aux mouvements modernes, notre collection soigneusement sélectionnée traverse les siècles et les continents.</p>
            </div>
            <div class="col-md-6">
                <div class="about-image-container">
                    <div style="height: 300px; background: linear-gradient(135deg, var(--beige) 0%, var(--cream) 100%); border: 3px solid var(--bordeaux-light); border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-palette" style="font-size: 5rem; color: var(--bordeaux);"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Notre Expertise -->
        <div class="row mb-5 align-items-center">
            <div class="col-md-6 order-md-2">
                <h2 class="mb-4">Une Équipe d'Experts</h2>
                <p>Notre équipe est composée d'historiens de l'art diplômés et de passionnés qui consacrent leur temps à la recherche, la sélection et l'authentification de chaque œuvre présentée dans notre galerie.</p>
                <p>Chaque reproduction est imprimée selon des standards muséaux, garantissant une fidélité exceptionnelle aux couleurs et aux détails de l'œuvre originale.</p>
            </div>
            <div class="col-md-6 order-md-1">
                <div class="about-image-container">
                    <div style="height: 300px; background: linear-gradient(135deg, var(--cream) 0%, var(--beige) 100%); border: 3px solid var(--bordeaux-light); border-radius: 8px; display: flex; align-items: center; justify-content: center;">
                        <i class="bi bi-award" style="font-size: 5rem; color: var(--bordeaux);"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Nos Valeurs -->
        <div class="text-center mb-5">
            <h2 class="mb-5">Nos Valeurs</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="value-card p-4">
                        <i class="bi bi-gem mb-3" style="font-size: 3rem; color: var(--bordeaux);"></i>
                        <h4>Qualité Exceptionnelle</h4>
                        <p class="text-muted">Impression giclée sur toile de qualité musée, résistante aux UV et au temps</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="value-card p-4">
                        <i class="bi bi-shield-check mb-3" style="font-size: 3rem; color: var(--bordeaux);"></i>
                        <h4>Authenticité Garantie</h4>
                        <p class="text-muted">Chaque œuvre est accompagnée d'un certificat d'authenticité numéroté</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="value-card p-4">
                        <i class="bi bi-heart mb-3" style="font-size: 3rem; color: var(--bordeaux);"></i>
                        <h4>Service Personnalisé</h4>
                        <p class="text-muted">Conseils d'experts et accompagnement dans le choix de vos œuvres</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="section-divider"></div>

        <!-- Notre Processus -->
        <div class="mb-5">
            <h2 class="text-center mb-5">Notre Processus de Qualité</h2>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="process-step text-center">
                        <div class="step-number">1</div>
                        <h5 class="mt-3">Sélection</h5>
                        <p class="text-muted small">Choix rigoureux des œuvres par nos historiens d'art</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="process-step text-center">
                        <div class="step-number">2</div>
                        <h5 class="mt-3">Numérisation</h5>
                        <p class="text-muted small">Capture haute résolution avec calibrage colorimétrique</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="process-step text-center">
                        <div class="step-number">3</div>
                        <h5 class="mt-3">Impression</h5>
                        <p class="text-muted small">Technique giclée sur toile de qualité archivistique</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="process-step text-center">
                        <div class="step-number">4</div>
                        <h5 class="mt-3">Livraison</h5>
                        <p class="text-muted small">Emballage professionnel et expédition sécurisée</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="section-divider"></div>

        <!-- Nos Engagements -->
        <div class="row mb-5">
            <div class="col-md-8 mx-auto">
                <h2 class="text-center mb-4">Nos Engagements</h2>
                <div class="engagement-list">
                    <div class="d-flex align-items-start mb-3">
                        <i class="bi bi-check-circle-fill text-success me-3 fs-4"></i>
                        <div>
                            <strong>Satisfaction garantie</strong> - Retour gratuit sous 30 jours si vous n'êtes pas entièrement satisfait
                        </div>
                    </div>
                    <div class="d-flex align-items-start mb-3">
                        <i class="bi bi-check-circle-fill text-success me-3 fs-4"></i>
                        <div>
                            <strong>Livraison sécurisée</strong> - Emballage professionnel et assurance complète incluse
                        </div>
                    </div>
                    <div class="d-flex align-items-start mb-3">
                        <i class="bi bi-check-circle-fill text-success me-3 fs-4"></i>
                        <div>
                            <strong>Service client dédié</strong> - Notre équipe répond à vos questions sous 24h
                        </div>
                    </div>
                    <div class="d-flex align-items-start mb-3">
                        <i class="bi bi-check-circle-fill text-success me-3 fs-4"></i>
                        <div>
                            <strong>Paiement sécurisé</strong> - Transactions cryptées et protection de vos données
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- CTA -->
        <div class="text-center py-5" style="background: linear-gradient(135deg, var(--beige) 0%, var(--cream) 100%); border-radius: 8px;">
            <h3 class="mb-4">Prêt à Découvrir Notre Collection ?</h3>
            <a href="/art/" class="btn btn-primary btn-lg px-5">Explorer la Galerie</a>
        </div>
    </div>

</@layout.block>