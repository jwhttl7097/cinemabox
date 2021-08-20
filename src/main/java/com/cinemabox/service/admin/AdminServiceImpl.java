package com.cinemabox.service.admin;

import java.util.List;

//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cinemabox.dao.admin.AdminDao;
import com.cinemabox.vo.Hall;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.Screening;
import com.cinemabox.vo.Seat;
import com.cinemabox.vo.Theater;
import com.cinemabox.web.utils.Paging;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{

	@Autowired AdminDao adminDao;

	@Override
	public void addMovie(Movie movie) {
		adminDao.insertMovie(movie);
	}
	
	@Override
	public List<Movie> getAllDeleteMovies() {
		return adminDao.getAllDeleteMovies();
	}
	
	@Override
	public Movie getMovieByNo(int MovieNo) {
		Movie Movie = adminDao.getMovieByNo(MovieNo);
		return Movie;
	}

	@Override
	public void updateMovie(Movie movie) {
		adminDao.updateMovie(movie);
	}

	@Override
	public void addScreening(Screening screening) {
		adminDao.insertScreening(screening);
	}

	@Override
	public Screening getScreeningByNo(int screeningNo) {
		Screening screening = adminDao.getScreeningByNo(screeningNo);
		return screening;
	}

	@Override
	public void updateScreening(Screening screening) {
		adminDao.updateScreening(screening);
	}

	@Override
	public List<Seat> getAllSeats() {
		return adminDao.getAllSeats();
	}

	@Override
	public void addSeat(Screening screening) {
		adminDao.insertSeat(screening);
	}

	@Override
	public void deleteMovie(int movieNo) {
		adminDao.deleteMovie(movieNo);
	}

	@Override
	public void recoveryMovie(int movieNo) {
		adminDao.recoveryMovie(movieNo);
	}

	@Override
	public int countBoard() {
		return adminDao.countBoard();
	}

	@Override
	public List<Movie> selectMoivePaging(Paging page) {
		return adminDao.selectMoivePaging(page);
	}

	@Override
	public List<Screening> getScreeningsByMovieNo(int moiveNo) {
		return adminDao.getScreeningsByMovieNo(moiveNo);
	}

	@Override
	public List<Theater> getAllTheaterInfo() {
		return adminDao.getAllTheaterInfo();
	}

	@Override
	public List<Hall> getAllHallInfo() {
		return adminDao.getAllHallInfo();
	}
}
