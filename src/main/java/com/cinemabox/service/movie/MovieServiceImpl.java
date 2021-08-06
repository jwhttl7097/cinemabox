package com.cinemabox.service.movie;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.movie.MovieDao;
import com.cinemabox.vo.Movie;

@Service
public class MovieServiceImpl implements MovieService{
	
	@Autowired MovieDao movieDao;
	
	@Override
	public void updateMovieLike(Movie movie) {
		movie.setLike(movie.getLike()+1);
		movieDao.updateMovieLike(movie);
	}
	
	@Override
	public Movie getMovieByNo(int no) {
		return movieDao.getMovieByNo(no);
	}
	
	@Override
	public List<Movie> getNowMovieList(String sort) {
		return movieDao.getNowMovieList(sort);
	}

	@Override
	public List<Movie> getUnreleasedMovieList(String sort) {
		return movieDao.getUnreleasedMovieList(sort);
	}

}
