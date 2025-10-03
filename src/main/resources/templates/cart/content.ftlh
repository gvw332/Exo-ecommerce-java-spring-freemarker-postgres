<#if cartItems?size == 0>
    <div class="alert alert-info">
        Votre panier est vide
    </div>
    <a href="/art/" class="btn btn-primary w-100" data-bs-dismiss="offcanvas">Parcourir la galerie</a>
<#else>
    <div class="list-group mb-3">
        <#list cartItems as item>
            <div class="list-group-item">
                <div class="d-flex align-items-start">
                    <img src="uploads/images/${item.artPiece.imageUrl}"
                         alt="${item.artPiece.title}"
                         style="width: 60px; height: 60px; object-fit: cover;"
                         class="me-3">
                    <div class="flex-grow-1">
                        <h6 class="mb-1">${item.artPiece.title}</h6>
                        <small class="text-muted">${item.artPiece.artist}</small>
                        <div class="d-flex justify-content-between align-items-center mt-2">
                            <span class="text-muted">Qté: ${item.quantity}</span>
                            <strong>${item.subtotal?string["0.00"]} €</strong>
                        </div>
                    </div>
                    <button type="button"
                            class="btn btn-sm btn-outline-danger ms-2"
                            onclick="removeFromCart(${item.id})">
                        ×
                    </button>
                </div>
            </div>
        </#list>
    </div>

    <div class="border-top pt-3 mb-3">
        <div class="d-flex justify-content-between mb-2">
            <strong>Total:</strong>
            <strong>${total?string["0.00"]} €</strong>
        </div>
    </div>

    <div class="d-grid gap-2">
        <a href="/cart" class="btn btn-outline-primary" onclick="setTimeout(() => { bootstrap.Offcanvas.getInstance(document.getElementById('cartOffcanvas')).hide(); }, 100)">
            Voir le panier complet
        </a>
        <a href="/checkout" class="btn btn-success" data-bs-dismiss="offcanvas">
            Passer commande
        </a>
    </div>
</#if>