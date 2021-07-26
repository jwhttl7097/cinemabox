package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Screening {

	private int screeningNo;
	private Date date;
	private String time;
	private int movieNo;
	private int hallNo;
	private int theaterNo;
	
}
