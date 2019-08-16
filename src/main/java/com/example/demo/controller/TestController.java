package com.example.demo.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//@RestController
@Controller
public class TestController {
//	@RequestMapping("/test")
	@GetMapping("/test")
	public String test(Map<String, Object> map) {
		map.put("hello", "你好");
		return "test";
	}
}
