package com.cinemabox.web.controller.question;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customerCenter")
public class QuestionViewController {
	
	
	/**
	 * 공지 글 추가 페이지
	 * @param no
	 * @param redirectAttributes
	 * @return
	 */
	@GetMapping("/main")
	public String maincustomerCenter() {
		
		return "customerCenter/questionMain";
	}
	

}
