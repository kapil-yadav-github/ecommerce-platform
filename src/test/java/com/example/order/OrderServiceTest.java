package com.example.order;

public class OrderServiceTest {

    public static void main(String[] args) {

        OrderService service = new OrderService();

        String result = service.createOrder(
                "CUST-100",
                "PROD-200",
                2);

        if (!"Order created successfully".equals(result)) {
            throw new RuntimeException("Test failed");
        }

        System.out.println("Test passed");
    }
}
