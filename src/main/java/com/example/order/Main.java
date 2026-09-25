package com.example.order;

public class Main {

    public static void main(String[] args) {

        OrderService orderService = new OrderService();

        String result = orderService.createOrder(
                "CUST-001",
                "PROD-001",
                2
        );

        System.out.println(result);
    }
}
