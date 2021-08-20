package com.cinemabox.web.controller.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cinemabox.dto.ticket.TicketDto;
import com.cinemabox.service.Ticket.TicketService;

@Controller
@SessionAttributes({"ticketDto"})
public class TicketController{
	
	@Autowired TicketService ticketService;
	
	@GetMapping(path = {"/ticket"})
	public String ticket(Model model) {
		TicketDto ticketDto = new TicketDto();
		model.addAttribute("ticketDto", ticketDto);
		return "ticket/ticket";	
	}
	
	@GetMapping(path = {"/schedule"})
	public String schedule(Model model) {
		return "ticket/schedule";	
	}
	
	@PostMapping(path = {"/seat"})
	public String seat(Model model, @ModelAttribute("ticketDto") TicketDto ticketDto) {
		List<TicketDto> seats = ticketService.getAllSeat(ticketDto.getScreeningNo());
		model.addAttribute("tickets", ticketDto);
		model.addAttribute("seats", seats);
		return "ticket/seat";	
	}
	
	@PostMapping(path = {"/payment"})
	public String payment(Model model, @ModelAttribute("ticketDto") TicketDto ticketDto) {
		model.addAttribute("tickets", ticketDto);
		System.out.println(ticketDto.toString());
		return "ticket/payment";
	}
	
	@GetMapping(path = {"/complete"})
	public String complete() {
		return "ticket/complete";	
	}

}
