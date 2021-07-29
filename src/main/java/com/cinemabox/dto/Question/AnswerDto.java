package com.cinemabox.dto.Question;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerDto {
	
	private int questionNo;
	private String answerContent;
	private Date answerDate;


}
