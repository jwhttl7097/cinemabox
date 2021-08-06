package com.cinemabox.web.controller.theater;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.service.theater.TheaterService;
import com.cinemabox.vo.Theater;

@Controller
@RequestMapping("/theater")
public class TheateHomeAjaxController{
	
	@Autowired
	TheaterService theaterService;
	
	@RequestMapping("/place")
	public @ResponseBody ResponseEntity<List<Theater>> viewPlace(@RequestParam("location") String location) {
		List<Theater> allLocations = theaterService.getAllLocation(location);
		return new ResponseEntity<List<Theater>>(allLocations, HttpStatus.OK);
	}

}
