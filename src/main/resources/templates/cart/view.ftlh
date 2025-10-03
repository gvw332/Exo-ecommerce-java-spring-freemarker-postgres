<#import "../layouts/main.ftlh" as layout>

<@layout.block title="Mon Panier">

    <h1 class="mb-4">Mon Panier</h1>

    <#if cartItems?size == 0>
        <div class="alert alert-info">
            Votre panier est vide. <a href="/art/">Parcourir la galerie</a>
        </div>
    <#else>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead class="table-light">
                <tr>
                    <th>Image</th>
                    <th>Titre</th>
                    <th>Artiste</th>
                    <th>Prix unitaire</th>
                    <th>Quantité</th>
                    <th>Sous-total</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <#list cartItems as item>
                    <tr>
                        <td>
                            <img src="uploads/images/${item.artPiece.imageUrl}"
                                 alt="${item.artPiece.title}"
                                 style="width: 80px; height: auto;">
                        </td>
                        <td>${item.artPiece.title}</td>
                        <td>${item.artPiece.artist}</td>
                        <td>${item.artPiece.price?string["0.00"]} €</td>
                        <td>
                            <form action="/cart/update/${item.id}" method="post" class="d-inline">
                                <input type="number" name="quantity" value="${item.quantity}"
                                       min="1" style="width: 60px;" class="form-control form-control-sm d-inline">
                                <button type="submit" class="btn btn-sm btn-primary">Mettre à jour</button>
                            </form>
                        </td>
                        <td>${item.subtotal?string["0.00"]} €</td>
                        <td>
                            <form action="/cart/remove/${item.id}" method="post" class="d-inline">
                                <button type="submit" class="btn btn-sm btn-danger">Supprimer</button>
                            </form>
                        </td>
                    </tr>
                </#list>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="5" class="text-end"><strong>Total :</strong></td>
                    <td colspan="2"><strong>${total?string["0.00"]} €</strong></td>
                </tr>
                </tfoot>
            </table>
        </div>

        <div class="d-flex justify-content-between mt-4">
            <a href="/art/" class="btn btn-secondary">Continuer mes achats</a>
            <div>
                <form action="/cart/clear" method="post" class="d-inline">
                    <button type="submit" class="btn btn-warning"
                            onclick="return confirm('Vider le panier ?')">Vider le panier</button>
                </form>
                <a href="/checkout" class="btn btn-success">Passer commande</a>
            </div>
        </div>
    </#if>

</@layout.block>