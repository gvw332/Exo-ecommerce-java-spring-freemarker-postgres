package com.example.exoecommercespringfreemarkerpostgres.pl.controllers;

import com.example.exoecommercespringfreemarkerpostgres.bll.services.CartService;
import com.example.exoecommercespringfreemarkerpostgres.dll.entities.CartItem;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.Map;
import java.util.List;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    @GetMapping
    public String viewCart(Authentication authentication, Model model) {
        String username = authentication.getName();
        List<CartItem> cartItems = cartService.getCartItems(username);

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("total", cartService.getCartTotal(username));
        model.addAttribute("username", username);

        return "cart/view";
    }


    @PostMapping("/add/{artPieceId}")
    public String addToCart(@PathVariable Long artPieceId,
                            @RequestParam(defaultValue = "1") Integer quantity,
                            Authentication authentication,
                            @RequestHeader(value = "Referer", required = false) String referer) {
        cartService.addToCart(authentication.getName(), artPieceId, quantity);

        // Rediriger vers la page précédente si disponible
        if (referer != null && !referer.isEmpty()) {
            return "redirect:" + referer.replace(referer.split("://")[0] + "://" + referer.split("/")[2], "");
        }
        return "redirect:/art/";
    }
    @PostMapping("/update/{cartItemId}")
    public String updateQuantity(@PathVariable Long cartItemId,
                                 @RequestParam Integer quantity) {
        cartService.updateQuantity(cartItemId, quantity);
        return "redirect:/cart";
    }

    @PostMapping("/remove/{cartItemId}")
    public String removeFromCart(@PathVariable Long cartItemId) {
        cartService.removeFromCart(cartItemId);
        return "redirect:/cart";
    }

    @PostMapping("/clear")
    public String clearCart(Authentication authentication) {
        cartService.clearCart(authentication.getName());
        return "redirect:/cart";
    }

    @GetMapping("/count")
    @ResponseBody
    public Map<String, Integer> getCartCount(Authentication authentication) {
        int count = cartService.getCartItemCount(authentication.getName());
        return Map.of("count", count);
    }

    @GetMapping("/content")
    public String getCartContent(Authentication authentication, Model model) {
        String username = authentication.getName();
        List<CartItem> cartItems = cartService.getCartItems(username);

        model.addAttribute("cartItems", cartItems);
        model.addAttribute("total", cartService.getCartTotal(username));

        return "cart/content";
    }


}