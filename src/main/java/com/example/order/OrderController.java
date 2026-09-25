package com.example.order;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/orders")
public class OrderController {

    private final OrderService orderService = new OrderService();

    @PostMapping
    public String createOrder(
            @RequestParam String customerId,
            @RequestParam String productId,
            @RequestParam int quantity) {

        return orderService.createOrder(
                customerId,
                productId,
                quantity
        );
    }
}
