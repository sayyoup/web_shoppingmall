package com.itwill.joo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class HomeController {
    
   
	
	@GetMapping("/")
	public String main() {
		return "index";
	}
	
	@GetMapping("/accessError")
	public String accessError() {
		return "accessError";
	}
	
	@GetMapping("/map/map")
	    public void mapWhere() {
	 }
}
