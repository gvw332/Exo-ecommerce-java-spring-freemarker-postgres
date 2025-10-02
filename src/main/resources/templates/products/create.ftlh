<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Ajouter un tableau">
    <p>${username}</p>
    <p>Rôles ADMIN OU USER:</p>
    <ul>
        <#list roles as role>
            <li>${role}</li>
        </#list>
    </ul>

        <form action="/art/create" method="post">
            <div class="mb-3">
                <label for="title" class="form-label">Titre</label>
                <input type="text" id="title" name="title" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="artist" class="form-label">Artiste</label>
                <input type="text" id="artist" name="artist" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Prix (€)</label>
                <input type="number" id="price" name="price" class="form-control" step="0.01" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" rows="3"></textarea>
            </div>

            <div class="mb-3">
                <label for="imageUrl" class="form-label">Nom de l'image</label>
                <input type="text" id="imageUrl" name="imageUrl" class="form-control" placeholder="ex: mon_image.jpg" required>
            </div>

            <button type="submit" class="btn btn-success">Créer</button>
            <a href="/" class="btn btn-secondary">Annuler</a>
        </form>
</@layout.block>

<#-- Vérifie si l'utilisateur est admin -->
<#--    <#assign isAdmin = isAdmin!?false>-->
<#--    <#if isAdmin>-->
<#--        <h2>Ajouter un nouveau tableau</h2>-->

<#--    <#else>-->
<#--        <p class="text-danger">Vous n'avez pas les droits pour accéder à cette page.</p>-->
<#--    </#if>-->

<#--</@layout.block>-->
