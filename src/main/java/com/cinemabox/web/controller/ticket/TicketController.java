package com.cinemabox.web.controller.ticket;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.cinemabox.service.Ticket.TicketService;

@Controller
public class TicketController{
	
	@Autowired TicketService ticketService;
	
	@GetMapping(path = {"/ticket"})
	public String ticket(Model model) {
		//List<TicketDto> movieList = ticketService.getMovieListByTheaterNo(theaterNo);
		//model.addAttribute("movieList",movieList);
		return "ticket/ticket";	
	}
	
	@GetMapping(path = {"/seat"})
	public String seat() {
		return "ticket/seat";	
	}
	
	@GetMapping(path = {"/payment"})
	public String payment() {
		return "ticket/payment";	
	}
	
	@GetMapping(path = {"/complete"})
	public String complete() {
		return "ticket/complete";	
	}

}
