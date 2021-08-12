package com.cinemabox.web.controller.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.cinemabox.service.Ticket.TicketService;
import com.cinemabox.vo.Seat;

@Controller
public class TicketController{
	
	@Autowired TicketService ticketService;
	
	@GetMapping(path = {"/ticket"})
	public String ticket(Model model) {
		return "ticket/ticket";	
	}
	
	@PostMapping(path = {"/seat"})
	public String seat(Model model) {
		List<Seat> seats = ticketService.getAllSeat();
		model.addAttribute("seats", seats);
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
