package com.cinemabox.dto.ticket;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Payload {

	String title;	// 선택, 선택취소 인지
	String message;	// xx좌석 선택하였습니다, xx좌석 선택 취소 하였습니다.
	Object data;	// WebsocketTicketDto객체

	@Builder
	public Payload(String title, String message, Object data) {
		super();
		this.title = title;
		this.message = message;
		this.data = data;
	}

	
}
