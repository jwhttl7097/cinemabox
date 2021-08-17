package com.cinemabox.task;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;

import com.cinemabox.dao.movie.MovieDao;
import com.cinemabox.dao.ticket.TicketDao;
import com.cinemabox.vo.Movie;

public class Scheduler {

	@Autowired MovieDao movieDao;
	@Autowired TicketDao ticketDao;
	
	/*
	 * 1. 등록되어 있는 쿠폰 유통기한 정하기
	 * 2. 등록되어 있는 영화 개봉일이 되면 Y로 변경
	 * 3. 현재시간 기준으로 상영시간이 지난 것은 N처리 혹은 지우기
	 */
	
	//매일 12시 정각에 실행
	@Scheduled(cron = "0 0 12 * * ?")
	public void updateCouponExp(){
		
	}
	
	//매일 12시 정각에 실행
	@Scheduled(cron = "0 0 12 * * ?")
	public void updateMovieStatus(){
		//모든 영화정보 가져오기
		List<Movie> movies = movieDao.getAllmovies();
		
		for(Movie item : movies) {
			//오늘날짜
			Date today = new Date();
			//개봉일
			Date releaseDate = item.getReleaseDate();
			//오늘날짜 개봉일 비교값
			int value = today.compareTo(releaseDate);
			//현재 영화 상태
			String movieStatus = item.getStatus();

			if(movieStatus.equals("N") && value == 0 || value == -1 ) {
				item.setStatus("Y");
				movieDao.updateMovieStatus(item);
			}
		}
	}
	
	//매일 1분마다 실행
	@Scheduled(cron = "0 1 0 * * ? ")
	public void updateScreeningDate() {
		
	}
}
