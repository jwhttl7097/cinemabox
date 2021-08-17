package com.cinemabox.web.controller.event;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/event")
public class EventController {
	
	@GetMapping("/main")
	public String mainEvent(Model model) {
		
		return "event/eventMain";
	}
	
	@GetMapping("/discount")
	public String discountEvent(Model model) {
		
		return "event/discountMain";
	}

}
