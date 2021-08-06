package com.cinemabox.dto.theater;

import lombok.Data;

@Data
public class TheaterDto {

	private int theaterNo;
	private String theaterAddress;
	private String theaterFacility;
	private int theaterLatitude;
	private int theaterLongitude;
	private String contentFirst;
	private String contentSecond;
	private String contentMerit;
	private String floor;
	private String floorInfo;
	private String parkingInfo;
	private String parkingConfirm;
	private String parkingPrice;
	private String publicTransportName;
	private String publicTransportInfo;
	
}
