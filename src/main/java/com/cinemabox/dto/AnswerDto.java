package com.cinemabox.dto;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerDto {
	
	private int questionNo;
	private String answerTitle;
	private String answerContent;
	private Date answerDate;


}
