package com.cinemabox.web.controller.ticket;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.dto.ticket.TicketDto;
import com.cinemabox.service.Ticket.TicketService;

@Controller
@RequestMapping("/ticketing")
public class TicketAjaxController {

	@Autowired TicketService ticketService;
	
//	@RequestMapping("/movie")
//	public @ResponseBody ResponseEntity<List<TicketDto>> movieList(String sort, @RequestParam(value="theaterNo",required = false) int theaterNo){
//		List<TicketDto> movieList = ticketService.getMovieListByTheaterNo(sort, theaterNo);
//		return new ResponseEntity<List<TicketDto>>(movieList, HttpStatus.OK);
//	}
	
	@RequestMapping("/movie")
	public @ResponseBody ResponseEntity<List<TicketDto>> movieList
	(@RequestParam(value="sort",required = false)String sort, @RequestParam(value="theaterNo",required = false) int theaterNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sort",sort);
		map.put("theaterNo",theaterNo);
		List<TicketDto> movieList = ticketService.getMovieListByTheaterNo(map);
		return new ResponseEntity<List<TicketDto>>(movieList, HttpStatus.OK);
	}
	
	@RequestMapping("/time")
	public @ResponseBody ResponseEntity<List<TicketDto>> movieTime
	(//@RequestParam(value="hallNo",required = false) int hallNo
	@RequestParam(value="theaterNo",required = false) int theaterNo
	,@RequestParam(value="movieNo",required = false)int movieNo
	,@RequestParam(value="screeningDate",required = false) @DateTimeFormat(pattern = "yyyyMMdd") Date screeningDate){
		HashMap<String, Object> map = new HashMap<String, Object>();
		//map.put("hallNo",hallNo);
		map.put("theaterNo",theaterNo);
		map.put("movieNo",movieNo);
		map.put("screeningDate",screeningDate);
		List<TicketDto> movieTime = ticketService.getMovieTime(map);
		return new ResponseEntity<List<TicketDto>>(movieTime, HttpStatus.OK);
	}
	
	
}
