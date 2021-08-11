package com.cinemabox.service.Ticket;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cinemabox.dao.ticket.TicketDao;
import com.cinemabox.dto.ticket.TicketDto;

@Service
@Transactional
public class TicketServiceImpl implements TicketService{
	
	@Autowired TicketDao ticketDao;
	
//	@Override
//	public List<TicketDto> getMovieListByTheaterNo(@Param("sort") String sort, int theaterNo) {
//		return ticketDao.getMovieListByTheaterNo(sort, theaterNo);
//	}
	
	@Override
	public List<TicketDto> getMovieListByTheaterNo(Map<String, Object> map) {
		return ticketDao.getMovieListByTheaterNo(map);
	}
	
	@Override
	public List<TicketDto> getMovieTime(Map<String, Object> map) {
		return ticketDao.getMovieTime(map);
	}
	
	@Override
	public TicketDto getMovieByTime(Map<String, Object> map) {
		return ticketDao.getMovieByTime(map);
	}
}
