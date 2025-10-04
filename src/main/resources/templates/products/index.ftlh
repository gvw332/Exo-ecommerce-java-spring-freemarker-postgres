<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Galerie d'Art">

    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1>Galerie d'Art</h1>
            <#if roles?? && roles?seq_contains("ROLE_ADMIN")>
                <a href="/art/create" class="btn btn-primary">
                    <i class="bi bi-plus-circle"></i> Ajouter une œuvre
                </a>
            </#if>
        </div>

        <!-- Barre de recherche -->
        <div class="row mb-4">
            <div class="col-md-6 mx-auto">
                <form method="get" action="/art/">
                    <div class="input-group">
                        <input
                                type="text"
                                name="search"
                                class="form-control"
                                placeholder="Rechercher par titre ou artiste..."
                                value="${search!''}"
                        >
                        <button class="btn btn-primary" type="submit">
                            <i class="bi bi-search"></i> Rechercher
                        </button>
                        <#if search??>
                            <a href="/art/" class="btn btn-outline-secondary">
                                <i class="bi bi-x-circle"></i>
                            </a>
                        </#if>
                    </div>
                </form>
            </div>
        </div>

        <!-- Résultats -->
        <#if search??>
            <p class="text-muted mb-3">
                ${totalItems} résultat<#if totalItems gt 1>s</#if> pour "${search}"
            </p>
        </#if>

        <!-- Grille de tableaux -->
        <div class="row g-4 mb-4">
            <#list products as art>
                <div class="col-md-4 col-lg-3">
                    <div class="card h-100 product-card">
                        <a href="/art/${art.id}" class="text-decoration-none">
                            <div class="img-container">
                                <img src="<#if art.imageUrl?starts_with('http')>${art.imageUrl}<#else>/uploads/images/${art.imageUrl}</#if>"
                                     alt="${art.title}"
                                     class="card-img-top">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">${art.title}</h5>
                                <p class="card-text text-muted small">${art.artist}</p>
                                <p class="card-text fw-bold">${art.price} €</p>
                            </div>
                        </a>

                        <!-- Bouton + pour ajouter au panier -->
                        <#if isAuthenticated>
                            <form action="/cart/add/${art.id}" method="post" class="quick-add-form" onsubmit="setTimeout(updateCartCount, 500)">
                                <input type="hidden" name="quantity" value="1">
                                <button type="submit" class="btn-quick-add" title="Ajouter au panier">
                                    <i class="bi bi-plus-lg"></i>
                                </button>
                            </form>
                        </#if>
                    </div>
                </div>
            <#else>
                <div class="col-12">
                    <div class="alert alert-info text-center">
                        <#if search??>
                            Aucun résultat trouvé pour "${search}"
                        <#else>
                            Aucun tableau disponible pour le moment.
                        </#if>
                    </div>
                </div>
            </#list>
        </div>

        <!-- Pagination -->
        <#if totalPages gt 1>
            <nav aria-label="Pagination">
                <ul class="pagination justify-content-center">
                    <li class="page-item <#if currentPage == 0>disabled</#if>">
                        <a class="page-link" href="?page=${currentPage - 1}<#if search??>&search=${search}</#if>">
                            Précédent
                        </a>
                    </li>

                    <#list 0..<totalPages as pageNum>
                        <#if (pageNum == 0) ||
                        (pageNum == totalPages - 1) ||
                        (pageNum >= currentPage - 2 && pageNum <= currentPage + 2)>
                            <li class="page-item <#if pageNum == currentPage>active</#if>">
                                <a class="page-link" href="?page=${pageNum}<#if search??>&search=${search}</#if>">
                                    ${pageNum + 1}
                                </a>
                            </li>
                        <#elseif (pageNum == currentPage - 3) || (pageNum == currentPage + 3)>
                            <li class="page-item disabled">
                                <span class="page-link">...</span>
                            </li>
                        </#if>
                    </#list>

                    <li class="page-item <#if currentPage == totalPages - 1>disabled</#if>">
                        <a class="page-link" href="?page=${currentPage + 1}<#if search??>&search=${search}</#if>">
                            Suivant
                        </a>
                    </li>
                </ul>
            </nav>
        </#if>
    </div>

</@layout.block>