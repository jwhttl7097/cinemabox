package com.cinemabox.service.Ticket;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cinemabox.dto.ticket.TicketDto;

public interface TicketService {
	
	/**
	 * 극장번호로 등록된 영화정보 받아오기
	 * @param theaterNo 극장번호
	 * @return 극장에 등록된 영화정보
	 */
	List<TicketDto> getMovieListByTheaterNo(@Param("sort") String sort, int theaterNo);

}
