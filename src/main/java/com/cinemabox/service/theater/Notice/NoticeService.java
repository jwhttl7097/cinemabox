package com.cinemabox.service.theater.Notice;

import java.util.HashMap;
import java.util.List;

import com.cinemabox.dao.Notice.NoticeDao;

public interface NoticeService {

	List<NoticeDao> getNoticeByNo(int no);

	NoticeDao detailNoticeByNo(int no);

	void addNotice(NoticeDao notice);

	void deleteNotice(int no);

	void importNotice(int no);
	
}
