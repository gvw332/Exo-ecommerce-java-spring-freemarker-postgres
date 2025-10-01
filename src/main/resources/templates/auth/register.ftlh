<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Register">
    <h2>S'inscrire</h2>

    <form action="/register" method="post">

        <div class="mb-3">
            <label for="username">Username :</label>
            <input type="text" id="username" name="username" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="password">Mot de passe :</label>
            <input type="password" id="password" name="password" class="form-control"/>
        </div>

        <button type="submit" class="btn btn-primary">S'inscrire</button>
        <a href="/login" >Déja inscrit ?</a>
    </form>
</@layout.block>