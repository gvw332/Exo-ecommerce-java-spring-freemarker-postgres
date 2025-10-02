<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Register">

    <h1>Inscription</h1>

    <form method="post" action="/register">

        <label for="username">Nom d'utilisateur :</label>
        <input type="text" id="username" name="username" value="${registerForm.username()!""}" />

        <#if bindingResult?? && bindingResult.hasFieldErrors("username")>
            <div style="color:red">
                ${bindingResult.getFieldError("username").defaultMessage}
            </div>
        </#if>
        <br/>

        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="password" value="" />
        <#if bindingResult?? && bindingResult.hasFieldErrors("password")>
            <div style="color:red">
                ${bindingResult.getFieldError("password").defaultMessage}
            </div>
        </#if>

        <br/>

        <button type="submit">S'inscrire</button>
    </form>

</@layout.block>