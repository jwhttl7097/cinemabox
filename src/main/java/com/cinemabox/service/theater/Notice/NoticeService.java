package com.cinemabox.service.theater.Notice;


import java.util.HashMap;
import java.util.List;

import com.cinemabox.dao.Notice.NoticeDao;
import com.cinemabox.dto.Notice.NoticeDetailDto;
import com.cinemabox.dto.Notice.NoticeDto;
import com.cinemabox.vo.Notice;

public interface NoticeService {

	List<Notice> getNoticeAll();
	// 공지사항 조회 
	NoticeDetailDto detailNoticeByNo(int no);
	// 공지사항 상세 조회 
	void deleteNotice(int no);
	// 공지사항 삭제 
	void increaseHit(int no);
	// 조회수 증가 
	void addNotice(NoticeDto notice);
	// 공지 등록 
	void changeNotice(NoticeDetailDto notice);
	// 공지사항 수정 
	
	
	
}
