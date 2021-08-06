package com.cinemabox.service.movie;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Theater;

public interface MovieService {
	
	/**
	 * 영화의 like를 갱신한다.
	 * @param movie 영화정보
	 */
	void updateMovieLike(Movie movie);
	
	/**
	 * 영화번호로 영화정보를 조회한다.
	 * @param no 영화번호
	 * @return 영화번호로 찾은 영화정보
	 */
	Movie getMovieByNo(int no);
	
	/**
	 * 데이터베이스에 있는 영화 리스트(개봉/미개봉)를 반환한다.
	 * @param sort
	 * @return 영화목록
	 */
	List<Movie> getNowMovieList(@Param("sort") String sort);
	List<Movie> getUnreleasedMovieList(@Param("sort") String sort);
}
