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

                            <!-- Champ Email -->
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input
                                        type="email"
                                        id="email"
                                        name="email"
                                        class="form-control <#if bindingResult?? && bindingResult.hasFieldErrors("email")>is-invalid</#if>"
                                        value="${registerForm.email()!""}"
                                        required
                                >
                                <#if bindingResult?? && bindingResult.hasFieldErrors("email")>
                                    <div class="invalid-feedback">
                                        ${bindingResult.getFieldError("email").defaultMessage}
                                    </div>
                                </#if>
                            </div>

                            <!-- Champ Mot de passe -->
                            <div class="mb-3">
                                <label for="password" class="form-label">Mot de passe</label>
                                <div class="input-group">
                                    <input
                                            type="password"
                                            id="password"
                                            name="password"
                                            class="form-control <#if bindingResult?? && bindingResult.hasFieldErrors("password")>is-invalid</#if>"
                                            required
                                    >
                                    <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('password')">
                                        <i class="bi bi-eye" id="password-icon"></i>
                                    </button>
                                    <#if bindingResult?? && bindingResult.hasFieldErrors("password")>
                                        <div class="invalid-feedback">
                                            ${bindingResult.getFieldError("password").defaultMessage}
                                        </div>
                                    </#if>
                                </div>
                            </div>

                            <!-- Champ Confirmation du mot de passe -->
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Confirmer le mot de passe</label>
                                <div class="input-group">
                                    <input
                                            type="password"
                                            id="confirmPassword"
                                            name="confirmPassword"
                                            class="form-control <#if passwordMismatch??>is-invalid</#if>"
                                            required
                                    >
                                    <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('confirmPassword')">
                                        <i class="bi bi-eye" id="confirmPassword-icon"></i>
                                    </button>
                                    <#if passwordMismatch??>
                                        <div class="invalid-feedback">
                                            Les mots de passe ne correspondent pas
                                        </div>
                                    </#if>
                                </div>
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
    <script>
        function togglePassword(inputId) {
            const input = document.getElementById(inputId);
            const icon = document.getElementById(inputId + '-icon');

            if (input.type === 'password') {
                input.type = 'text';
                icon.classList.remove('bi-eye');
                icon.classList.add('bi-eye-slash');
            } else {
                input.type = 'password';
                icon.classList.remove('bi-eye-slash');
                icon.classList.add('bi-eye');
            }
        }
    </script>
</@layout.block>