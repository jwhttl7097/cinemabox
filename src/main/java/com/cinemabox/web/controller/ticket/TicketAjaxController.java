package com.cinemabox.web.controller.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
	
	@RequestMapping("/movie")
	public @ResponseBody ResponseEntity<List<TicketDto>> movieList(String sort, @RequestParam("theaterNo") int theaterNo){
		List<TicketDto> movieList = ticketService.getMovieListByTheaterNo(sort, theaterNo);
		return new ResponseEntity<List<TicketDto>>(movieList, HttpStatus.OK);
	}
}
