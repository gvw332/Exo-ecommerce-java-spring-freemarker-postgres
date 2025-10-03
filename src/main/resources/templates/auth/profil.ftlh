<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Mon Profil">

    <div class="row">
        <div class="col-md-8 mx-auto">
            <h1 class="mb-4">Mon Profil</h1>

            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Informations du compte</h5>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Nom d'utilisateur :</label>
                        <p class="mb-0">${user.username}</p>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Rôle :</label>
                        <p class="mb-0">
                            <#if user.role == "ADMIN">
                                <span class="badge bg-danger">Administrateur</span>
                            <#else>
                                <span class="badge bg-primary">Utilisateur</span>
                            </#if>
                        </p>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Statut :</label>
                        <p class="mb-0">
                            <span class="badge bg-success">Compte actif</span>
                        </p>
                    </div>
                </div>
            </div>

            <#if user.role == "ADMIN">
                <div class="card mt-4">
                    <div class="card-body">
                        <h5 class="card-title">Actions d'administration</h5>
                        <p class="card-text">En tant qu'administrateur, vous avez accès à la gestion des tableaux.</p>
                        <a href="/art/" class="btn btn-primary">Gérer les tableaux</a>
                    </div>
                </div>
            <#else>
                <div class="card mt-4">
                    <div class="card-body">
                        <h5 class="card-title">Parcourir la galerie</h5>
                        <p class="card-text">Découvrez notre collection de tableaux d'art.</p>
                        <a href="/art/" class="btn btn-primary">Voir la galerie</a>
                    </div>
                </div>
            </#if>

            <div class="mt-4">
                <a href="/" class="btn btn-secondary">Retour à l'accueil</a>
            </div>
        </div>
    </div>

</@layout.block>