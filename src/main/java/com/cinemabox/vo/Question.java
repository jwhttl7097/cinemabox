package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Question {
	
	private int questionNo;
	private String questionTitle;
	private String answerTitle;
	private String questionContent;
	private String answerContent;
	private Date questionDate;
	private Date answerDate;
	private boolean status;
	private int satisfaction;
	private String userId;
	private String name;
	private String email;
	private String phone;
	
	

}
