package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Reservation {

	private int no;
	private String status;
	private String payStatus;
	private int price;
	private int totalPrice;
	private String payment;
	private Date createdDate;
	private double point;
	private int movieNo;
	private String userId;
	private String ticketNos;
	private Integer usedPoint;
	private String serialNo;
}
