package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Notice {
	
	private int no;
	private String division;
	private String title;
	private String content;
	private Date date;
	private int hits;
	private int important;
	

}
