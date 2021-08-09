package com.cinemabox.web.controller.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cinemabox.dto.theater.TheaterDto;
import com.cinemabox.service.theater.TheaterService;
import com.cinemabox.vo.Theater;

@Controller
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
		return "theater/detailTheater";	
	}
	
	@GetMapping("/specialHall")
	public String theaterHome() {
		return "theater/specialHall";	
	}

}
