<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Modifier un tableau d'art">

    <#if isAdmin>
        <h2>Modifier le tableau : ${artPiece.title}</h2>

        <form action="/art/edit/${artPiece.id}" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="title" class="form-label">Titre</label>
                <input type="text" id="title" name="title" class="form-control" value="${artPiece.title}" required>
            </div>

            <div class="mb-3">
                <label for="artist" class="form-label">Artiste</label>
                <input type="text" id="artist" name="artist" class="form-control" value="${artPiece.artist}" required>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Prix (€)</label>
                <input type="number" id="price" name="price" class="form-control" step="0.01" value="${artPiece.price}" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" rows="3">${artPiece.description}</textarea>
            </div>

            <div class="mb-3">
                <label for="imageUrl" class="form-label">Nom de l'image</label>
                <input type="text" id="imageUrl" name="imageUrl" class="form-control" value="${artPiece.imageUrl}" required>
            </div>

            <button type="submit" class="btn btn-warning">Mettre à jour</button>
            <a href="/" class="btn btn-secondary">Annuler</a>
        </form>

    <#else>
        <p class="text-danger">Vous n'avez pas les droits pour accéder à cette page.</p>
    </#if>

</@layout.block>
