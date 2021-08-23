package com.cinemabox.service.reservation;

import com.cinemabox.vo.Reservation;
import com.cinemabox.vo.ReservationTicket;

public interface ReservationService {

	/**
	 * 예약내역 정보를 예약내역테이블에 저장함
	 * @param reservation 예약내역 정보
	 */
	void inserPayInfo(Reservation reservation);
	
	/**
	 * 스트링타입의 티켓번호를 전달받아 해당하는 예매내역번호를 반환받는다.
	 * @param ticketNo 스트링타입의 티켓번호
	 * @return 예매내역번호
	 */
	int getReservationNoByTicketNo(String ticketNo);
	
	/**
	 * 예매내역티켓객체(티켓번호, 예매내역번호)를 전달받아 등록시킨다 
	 * @param rt 예매내역티켓객체(티켓번호, 예매내역번호)
	 */
	void insertTicketNoAndReservationNo(ReservationTicket rt);
	
	/**
	 * 스트링타입의 티켓번호들을 전달받아 해당하는 예매내역번호를 반환받는다.
	 * @param ticketNumber
	 * @return
	 */
	int getReservationNoByTicketNos(String ticketNumber);
}
