package com.cinemabox.dao.theater;

import java.util.List;

import com.cinemabox.vo.Theater;

public interface TheaterDao {

	List<Theater> getAllLocation(String location);
	Theater getLocationByNo(int no);
}
