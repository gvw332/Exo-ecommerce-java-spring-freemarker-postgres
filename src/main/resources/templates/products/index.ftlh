<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Liste de nos tableaux d'art">

    <table class="table table-striped table-hover align-middle">
        <thead class="table-dark">
        <tr>
            <th scope="col">Image</th>
            <th scope="col">Titre</th>
            <th scope="col">Artiste</th>
            <th scope="col">Description</th>
            <th scope="col">Prix</th>
            <th scope="col" class="text-end">Actions</th>
        </tr>
        </thead>
        <tbody>
        <#list products as art>
            <tr>
                <td>
                    <img src="/uploads/images/${art.imageUrl}" alt="${art.title}" style="width:80px;height:auto;">
                </td>
                <td>${art.title}</td>
                <td>${art.artist}</td>
                <td>${art.description}</td>
                <td>${art.price?string["0.00"]} €</td>
                <td class="text-end">
                    <a href="/art/${art.id}" class="btn btn-sm btn-primary">Détails</a>

                    <#-- Affiche uniquement pour les admins -->
                    <#if isAdmin>
                        <a href="/art/edit/${art.id}" class="btn btn-sm btn-warning">Modifier</a>
                        <form action="/art/delete/${art.id}" method="post" class="d-inline">
                            <button type="submit" class="btn btn-sm btn-danger"
                                    onclick="return confirm('Supprimer ce tableau ?')">
                                Supprimer
                            </button>
                        </form>
                    </#if>
                </td>
            </tr>
        <#else>
            <tr>
                <td colspan="5" class="text-center text-muted">Aucun tableau trouvé</td>
            </tr>
        </#list>
        </tbody>
    </table>

<#-- Bouton Ajouter uniquement pour les admins -->
    <#if isAdmin>
        <a href="/art/create" class="btn btn-success">➕ Ajouter un tableau</a>
    </#if>
</@layout.block>
