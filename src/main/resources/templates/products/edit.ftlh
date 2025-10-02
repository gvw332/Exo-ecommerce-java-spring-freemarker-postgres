<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Modifier un tableau d'art">

    <#if isAdmin>
        <h2>Modifier le tableau : ${art.title}</h2>

        <form action="/art/edit/${art.id}" method="post" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="title" class="form-label">Titre</label>
                <input type="text" id="title" name="title" class="form-control" value="${art.title}" required>
            </div>

            <div class="mb-3">
                <label for="artist" class="form-label">Artiste</label>
                <input type="text" id="artist" name="artist" class="form-control" value="${art.artist}" required>
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Prix (€)</label>
                <input type="number" id="price" name="price" class="form-control" step="0.01" value="${art.price?string['0.00']}" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea id="description" name="description" class="form-control" rows="3">${art.description}</textarea>
            </div>

            <div class="mb-3">
                <label for="image" class="form-label">Image du tableau</label>
                <div class="mb-2">
                    <img src="/images/${art.imageUrl}" alt="${art.title}" style="max-width: 200px; height: auto;">
                    <p class="text-muted small">Image actuelle</p>
                </div>
                <input type="file" id="image" name="image" class="form-control" accept="image/*">
                <small class="text-muted">Laissez vide pour conserver l'image actuelle (max 10MB)</small>
                <input type="hidden" name="currentImageUrl" value="${art.imageUrl}">
            </div>

            <button type="submit" class="btn btn-warning">Mettre à jour</button>
            <a href="/art/" class="btn btn-secondary">Annuler</a>
        </form>

    <#else>
        <p class="text-danger">Vous n'avez pas les droits pour accéder à cette page.</p>
    </#if>

</@layout.block>