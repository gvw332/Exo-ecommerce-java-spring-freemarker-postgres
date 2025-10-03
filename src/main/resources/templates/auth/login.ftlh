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

                            <!-- Champ Mot de passe -->
                            <div class="mb-3">
                                <label for="password" class="form-label">Mot de passe</label>
                                <div class="input-group">
                                    <input
                                            type="password"
                                            id="password"
                                            name="password"
                                            class="form-control"
                                            required
                                    >
                                    <button class="btn btn-outline-secondary" type="button" onclick="togglePassword('password')">
                                        <i class="bi bi-eye" id="password-icon"></i>
                                    </button>
                                </div>
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
