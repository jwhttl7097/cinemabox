package com.cinemabox.dao.ticket;

import java.util.List;
import java.util.Map;

import com.cinemabox.dto.ticket.TicketDto;


public interface TicketDao {
	
	//예매
	List<TicketDto> getMovieListByTheaterNo(Map<String, Object> map);
	List<TicketDto> getMovieTime(Map<String, Object> map);
	TicketDto getMovieByTime(Map<String, Object> map);
	List<TicketDto> getTicketStatusByScreeningNo(int screeningNo);
	
	//좌석
	
	//결제
}
