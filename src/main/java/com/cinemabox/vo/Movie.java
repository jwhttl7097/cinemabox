package com.cinemabox.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Movie {
	private int no;
	private String title;
	private String thumbnail;
	private double rating;
	private double reservationRate;
	private int cumulativeAudienceCnt;
	private String genre;
	private Date releaseDate;
	private int runningTime;
	private String synopsis;
	private String trailer;
	private String age;
	private String status;
	private int like;
	private Date createdDate;
	private Date closeDate;
}
