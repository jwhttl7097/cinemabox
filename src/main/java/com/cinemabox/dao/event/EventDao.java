package com.cinemabox.dao.event;

import java.util.List;

import com.cinemabox.vo.Event;

public interface EventDao {
	
	List<Event> getAllEvent();
	
	Event detailEvent(int no);

}
