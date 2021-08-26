package com.cinemabox.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date releaseDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date closeDate;
	private int runningTime;
	private String synopsis;
	private String trailerFirst;
	private String trailerSecond;
	private String age;
	private String director;
	private String casting;
	private String status;
	private int userLike;
	private Date createdDate;
<<<<<<< HEAD

=======
>>>>>>> b5978ffdf384297585369b44058233eb37aef63b
	public String getSynopsisWithBr() {
		if(synopsis == null) {
			return " ";
		}
		return synopsis.replace("\n", "<br>");
	}
	private String screeningStatus;
	public boolean isExistGenre(String text) {
		return genre.contains(text);
	}
<<<<<<< HEAD

=======
>>>>>>> b5978ffdf384297585369b44058233eb37aef63b
}

