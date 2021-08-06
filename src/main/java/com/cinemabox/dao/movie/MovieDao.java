package com.cinemabox.dao.movie;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cinemabox.vo.Movie;

public interface MovieDao {

	void insertMovie(Movie movie);
	void updateMovieLike(Movie movie);
	
	Movie getMovieByNo(int no);
	List<Movie> getNowMovieList(@Param("sort") String sort);
	List<Movie> getUnreleasedMovieList(@Param("sort") String sort);
}
