package com.cinemabox.dto.user;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class UserDto {

	private String id;
	private int wishlistNo;
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date wishlistCreatedDate;
	private int movieNo;
	private String movieTitle;
	private String movieThumbnail;
	private int couponNo;
	
	
}
