package com.cinemabox.web.controller.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cinemabox.dto.theater.TheaterDto;
import com.cinemabox.dto.ticket.TicketDto;
import com.cinemabox.service.theater.TheaterService;
import com.cinemabox.vo.Theater;

@Controller
@SessionAttributes({"ticketDto"})
public class TheateHomeController{
	
	@Autowired
	TheaterService theaterService;
	
	@GetMapping("/theaterHome")
	public String theaterHome(Model model) {
		List<Theater> allLocations = theaterService.getAllLocation("서울");
		model.addAttribute("locations", allLocations);
		return "theater/theaterHome";	
	}
	
	@GetMapping("/detailTheater")
	public String detailTheater(Model model, int no, String number) {
		Theater location = theaterService.getLocationByNo(no, number);
		TheaterDto theaterDto = theaterService.detailTheaterInfoByJsoup(number);
		
		model.addAttribute("location", location);
		model.addAttribute("theaterDto", theaterDto);
		
		TicketDto ticketDto = new TicketDto();
		model.addAttribute("ticketDto", ticketDto);
		return "theater/detailTheater";	
	}
	
	@GetMapping("/specialHall")
	public String specialHall() {
		return "theater/specialHall";	
	}

}
