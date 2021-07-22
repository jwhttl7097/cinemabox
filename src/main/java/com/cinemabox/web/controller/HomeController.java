package com.cinemabox.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController{
	
	@GetMapping(path = {"/", "/home"})
	public String home() {
		return "home";	// /WEB-INF/views/home.jsp 경로에서 "/WEB-INF/views"와 ".jsp"를 제외한 이름
	}

}
