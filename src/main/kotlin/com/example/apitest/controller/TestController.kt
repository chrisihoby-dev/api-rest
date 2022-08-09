package com.example.apitest.controller

import org.springframework.http.ResponseEntity
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.GetMapping

@Controller
class TestController {
    @GetMapping( "/hi")
    fun hello():ResponseEntity<Hello>{
        return ResponseEntity.ok(Hello("Hello Ihoby"))
    }
}

data class Hello(val name:String)