<#import "../layouts/main.ftlh" as layout>

<@layout.block title="${art.title}">
    <h2>Détails du tableau</h2>

    <div class="card mb-3" style="max-width: 540px;">
        <div class="row g-0">
            <div class="col-md-4">
                <img src="/uploads/images/${art.imageUrl}" class="img-fluid rounded-start" alt="${art.title}">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">${art.title}</h5>
                    <p class="card-text"><strong>Artiste:</strong> ${art.artist}</p>
                    <p class="card-text"><strong>Description:</strong> ${art.description}</p>
                    <p class="card-text"><strong>Prix:</strong> ${art.price?string["0.00"]} €</p>

                    <#if isAdmin>
                        <a href="/art/edit/${art.id}" class="btn btn-warning">Modifier</a>
                        <form action="/art/delete/${art.id}" method="post" class="d-inline">
                            <button type="submit" class="btn btn-danger" onclick="return confirm('Supprimer ce tableau ?')">
                                Supprimer
                            </button>
                        </form>
                    </#if>
                    <a href="/art/" class="btn btn-secondary">Retour</a>
                </div>
            </div>
        </div>
    </div>
</@layout.block>