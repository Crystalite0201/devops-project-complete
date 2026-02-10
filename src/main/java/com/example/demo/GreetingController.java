package com.example.demo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController // Tells Spring this is an API controller
public class GreetingController {

    @GetMapping("/api/greet") // Maps this method to a GET request
    public String sayHello(@RequestParam(value = "name", defaultValue = "World") String name) {
        return "Hello, " + name + "! This is from the Java backend.";
    }
}
