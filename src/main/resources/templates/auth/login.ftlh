<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Login">

    <h1>Connexion</h1>

<#-- Message de succès (logout) -->
    <#if message??>
        <div style="color:green; margin-bottom: 15px;">
            ${message}
        </div>
    </#if>

<#-- Message d'erreur -->
    <#if error??>
        <div style="color:red; margin-bottom: 15px;">
            ${error}
        </div>
    </#if>

    <form method="post" action="/login">

        <label for="username">Nom d'utilisateur :</label>
        <input type="text" id="username" name="username" required />
        <br/>

        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="password" required />
        <br/>

        <button type="submit">Se connecter</button>
    </form>

    <p>
        Pas encore de compte ? <a href="/register">S'inscrire</a>
    </p>

</@layout.block>