package com.cinemabox.service.Ticket;

import java.util.List;
import java.util.Map;

import com.cinemabox.dto.ticket.TicketDto;
import com.cinemabox.vo.Seat;

public interface TicketService {

	/**
	 * 극장번호로 등록된 영화정보 받아오기
	 * @param map 극장번호, 분류(정렬)
	 * @return 영화목록
	 */
	List<TicketDto> getMovieListByTheaterNo(Map<String, Object> map);
	
	/**
	 * 극장번호, 영화번호, 상영날짜로 예매하려는 영화 시간 구하기
	 * @param map 극장번호, 영화번호, 상영날짜
	 * @return 선택된 영화 시간목록
	 */
	List<TicketDto> getMovieTime(Map<String, Object> map);
	
	/**
	 * 극장번호, 영화번호, 상영날짜, 시간으로 예매하려는 영화정보 구하기
	 * @param map 극장번호, 영화번호, 상영날짜, 시간
	 * @return 예매하려는 영화정보
	 */
	TicketDto getMovieByTime(Map<String, Object> map);
	
	/**
	 * 현재 남아있는 좌석 확인하기
	 * @param screeningNo 상영정보가 들어있는 상영번호
	 * @return 좌석상태
	 */
	List<TicketDto> getTicketStatusByScreeningNo(int screeningNo);
	
	/**
	 * 1관의 모든 좌석을 가져온다.
	 * @return
	 */
	List<Seat> getAllSeat();


}
