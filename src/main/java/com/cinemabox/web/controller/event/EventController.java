package com.cinemabox.web.controller.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cinemabox.service.event.EventService;
import com.cinemabox.vo.Event;




@Controller
@RequestMapping("/event")
public class EventController {
	
	@Autowired
	EventService eventService;
	
	/**
	 * 이벤트 홈화면 
	 * @param model
	 * @return
	 */
	@GetMapping("/main")
	public String mainEvent(Model model) {
		List<Event> main = eventService.getAllEvent();
		model.addAttribute("main", main);
		return "event/eventMain";
	}
	
	/**
	 * 이벤트 할인 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/discount")
	public String discountEvent(Model model) {
		
		return "event/discountMain";
	}
	
	/**
	 * 뽑기 이벤트 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/lotto")
	public String lotto(Model model) {
		
		return "event/lotto";
	}
	
	/**
	 * 이벤트 상세 화면
	 * @param model
	 * @return
	 */
	@GetMapping("/detail")
	public String detail(int no, Model model) {
		Event eventDetail = eventService.detailEvent(no);
		model.addAttribute("eventDetail", eventDetail);
		return "event/detailEvent";
	}

}
