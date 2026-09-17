package com.example.order.security;

public class UnsafeExample {

    public void runCommand(String userInput) throws Exception {
        Runtime.getRuntime().exec(userInput);
    }
}
