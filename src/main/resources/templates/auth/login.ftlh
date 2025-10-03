<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Connexion">

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h1 class="card-title text-center mb-4">Connexion</h1>

                        <#-- Message de succès (logout) -->
                        <#if message??>
                            <div class="alert alert-success" role="alert">
                                ${message}
                            </div>
                        </#if>

                        <#-- Message d'erreur -->
                        <#if error??>
                            <div class="alert alert-danger" role="alert">
                                ${error}
                            </div>
                        </#if>

                        <form method="post" action="/login">
                            <div class="mb-3">
                                <label for="username" class="form-label">Nom d'utilisateur</label>
                                <input type="text" id="username" name="username" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">Mot de passe</label>
                                <input type="password" id="password" name="password" class="form-control" required>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-primary">Se connecter</button>
                            </div>
                        </form>

                        <div class="mt-3 text-center">
                            <p class="mb-0">
                                Pas encore de compte ?
                                <a href="/register">S'inscrire</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</@layout.block>
