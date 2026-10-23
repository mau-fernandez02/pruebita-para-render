package com.test.prueba;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/")
    public String index() {
        return "¡Hola! La aplicación Spring Boot está funcionando correctamente.";
    }
}