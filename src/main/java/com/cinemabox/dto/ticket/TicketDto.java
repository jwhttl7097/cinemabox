package com.cinemabox.dto.ticket;

import java.util.Date;

import lombok.Data;

@Data
public class TicketDto {
	private int screeningNo;
	private int movieNo;
	private int theaterNo;
	private int hallNo;
	private Date screeningDate;
	private String screeningTime;
	private String screeningStatus;
	private String title;
	private String runningTime;
	private String age;
	private String movieStatus;
	private String hallName;
}
