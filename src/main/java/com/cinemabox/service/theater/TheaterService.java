package com.cinemabox.service.theater;

import java.util.List;

import com.cinemabox.vo.Theater;

public interface TheaterService {

	/**
	 * 지역이름을 전달받아 해당지역의 상영관 정보를 반환한다.
	 * @param location 지역이름
	 * @return 상영관정보들
	 */
	List<Theater> getAllLocation(String location);
	
	/**
	 * 극장번호를 전달받아 극장정보 반환
	 * @return 극장정보
	 */
	Theater getLocationByNo(int no, String number);
	
	/**
	 * 극장번호를 전달받아서 극장상세정보를 반환한다.
	 * @param no 극장번호
	 */
	void detailTheaterInfoByJsoup(String number);
}
