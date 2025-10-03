<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Ajouter un tableau">
    <h1>Création </h1>
    <form action="/art/create" method="post" enctype="multipart/form-data">
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
            <label for="image" class="form-label">Image du tableau</label>
            <input type="file" id="image" name="image" class="form-control" accept="image/*" required>
            <small class="text-muted">Formats acceptés : JPG, PNG, GIF (max 5MB)</small>
        </div>

        <button type="submit" class="btn btn-success">Créer</button>
        <a href="/" class="btn btn-secondary">Annuler</a>
    </form>
</@layout.block>