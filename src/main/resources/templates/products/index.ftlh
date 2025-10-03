<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Liste de nos tableaux d'art">

<#-- Bouton Ajouter uniquement pour les admins -->
    <#if isAdmin>
        <div class="text-center mt-4 mb-4">
            <a href="/art/create" class="btn btn-success">➕ Ajouter un tableau</a>
        </div>
    </#if>

    <div class="row row-cols-1 row-cols-md-3 g-4">
        <#list products as art>
            <div class="col">
                <div class="card h-100 d-flex flex-column shadow-sm hover-shadow">
                    <div class="img-container">
                        <img src="/uploads/images/${art.imageUrl}" class="card-img-top" alt="${art.title}">
                    </div>
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title">${art.title}</h5>
                        <h6 class="card-subtitle text-muted mb-2">Par ${art.artist}</h6>
                        <p class="card-text">${art.description}</p>
                        <p class="card-text fw-bold">${art.price?string["0.00"]} €</p>

                        <div class="mt-auto text-end">
                            <a href="/art/${art.id}" class="btn btn-sm btn-primary">Détails</a>

                            <form action="/cart/add/${art.id}" method="post" class="d-inline">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn btn-sm btn-success">🛒 Ajouter</button>
                            </form>

                            <#if isAdmin>
                                <a href="/art/edit/${art.id}" class="btn btn-sm btn-warning">Modifier</a>
                                <form action="/art/delete/${art.id}" method="post" class="d-inline">
                                    <button type="submit" class="btn btn-sm btn-danger"
                                            onclick="return confirm('Supprimer ce tableau ?')">
                                        Supprimer
                                    </button>
                                </form>
                            </#if>
                        </div>
                    </div>
                </div>
            </div>
        <#else>
            <div class="col-12 text-center text-muted">
                Aucun tableau trouvé
            </div>
        </#list>
    </div>

</@layout.block>
