<#import "layouts/main.ftlh" as layout>

<@layout.block title="Accueil - Galerie d'Art">

    <div class="text-center mb-5">
        <h1 class="display-4 mb-3">Bienvenue dans notre Galerie d'Art</h1>
        <p class="lead text-muted">Découvrez des œuvres d'art exceptionnelles de grands maîtres</p>
    </div>

    <div class="row mb-5">
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <h3 class="card-title">🎨 Collection Unique</h3>
                    <p class="card-text">Des tableaux soigneusement sélectionnés parmi les plus grands artistes de l'histoire.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <h3 class="card-title">🔒 Sécurisé</h3>
                    <p class="card-text">Vos informations sont protégées et vos transactions sont sécurisées.</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow-sm">
                <div class="card-body text-center">
                    <h3 class="card-title">✨ Qualité Premium</h3>
                    <p class="card-text">Chaque œuvre est authentifiée et livrée avec un certificat d'authenticité.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="text-center mb-5">
        <h2 class="mb-4">Explorez notre collection</h2>
        <p class="mb-4">Parcourez notre sélection de tableaux d'art disponibles à l'achat</p>
        <a href="/art/" class="btn btn-primary btn-lg">Voir la galerie</a>
    </div>

    <div class="bg-light p-5 rounded">
        <h2 class="text-center mb-4">Pourquoi nous choisir ?</h2>
        <div class="row">
            <div class="col-md-6">
                <ul class="list-unstyled">
                    <li class="mb-3">✓ Large sélection d'œuvres d'art</li>
                    <li class="mb-3">✓ Prix compétitifs</li>
                    <li class="mb-3">✓ Service client dédié</li>
                </ul>
            </div>
            <div class="col-md-6">
                <ul class="list-unstyled">
                    <li class="mb-3">✓ Livraison sécurisée</li>
                    <li class="mb-3">✓ Garantie d'authenticité</li>
                    <li class="mb-3">✓ Paiement sécurisé</li>
                </ul>
            </div>
        </div>
    </div>

</@layout.block>