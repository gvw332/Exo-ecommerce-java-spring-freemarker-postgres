<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Login">
    <h2>Se connecter</h2>

    <form action="/login" method="post">

        <div class="mb-3">
            <label for="username">Username :</label>
            <input type="text" id="username" name="username" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="password">Mot de passe :</label>
            <input type="password" id="password" name="password" class="form-control"/>
        </div>

        <button type="submit" class="btn btn-primary">Se connecter</button>
        <a href="/register" >Pas encore inscrit ?</a>
    </form>
</@layout.block>