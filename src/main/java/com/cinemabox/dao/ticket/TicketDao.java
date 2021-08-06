package com.cinemabox.dao.ticket;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cinemabox.dto.ticket.TicketDto;


public interface TicketDao {

	List<TicketDto> getMovieListByTheaterNo(@Param("sort") String sort, int theaterNo);
}
