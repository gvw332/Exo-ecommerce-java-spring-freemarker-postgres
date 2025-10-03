<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Inscription">

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-sm">
                    <div class="card-body">
                        <h1 class="card-title text-center mb-4">Inscription</h1>

                        <form method="post" action="/register">

                            <!-- Champ Nom d'utilisateur -->
                            <div class="mb-3">
                                <label for="username" class="form-label">Nom d'utilisateur</label>
                                <input
                                        type="text"
                                        id="username"
                                        name="username"
                                        class="form-control <#if bindingResult?? && bindingResult.hasFieldErrors("username")>is-invalid</#if>"
                                        value="${registerForm.username()!""}"
                                        required
                                >
                                <#if bindingResult?? && bindingResult.hasFieldErrors("username")>
                                    <div class="invalid-feedback">
                                        ${bindingResult.getFieldError("username").defaultMessage}
                                    </div>
                                </#if>
                            </div>

                            <!-- Champ Mot de passe -->
                            <div class="mb-3">
                                <label for="password" class="form-label">Mot de passe</label>
                                <input
                                        type="password"
                                        id="password"
                                        name="password"
                                        class="form-control <#if bindingResult?? && bindingResult.hasFieldErrors("password")>is-invalid</#if>"
                                        required
                                >
                                <#if bindingResult?? && bindingResult.hasFieldErrors("password")>
                                    <div class="invalid-feedback">
                                        ${bindingResult.getFieldError("password").defaultMessage}
                                    </div>
                                </#if>
                            </div>

                            <!-- Bouton s'inscrire -->
                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">S'inscrire</button>
                            </div>

                        </form>

                        <div class="mt-3 text-center">
                            <p class="mb-0">
                                Déjà inscrit ?
                                <a href="/login">Se connecter</a>
                            </p>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</@layout.block>
