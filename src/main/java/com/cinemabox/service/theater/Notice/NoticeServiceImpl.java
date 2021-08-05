package com.cinemabox.service.theater.Notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.Notice.NoticeDao;
import com.cinemabox.dto.Notice.NoticeDto;
import com.cinemabox.vo.Notice;


@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired NoticeDao noticeDao;
	
	@Override
	public List<Notice> getNoticeAll(){
		// 공지사항 조회 
		List<Notice> notice = noticeDao.getNoticeAll();
		// 공지사항을 반환한다.
		return notice;
	}
	
	@Override
	public Notice detailNoticeByNo(int no) {
		// 공지사항 상세 조회 
		return noticeDao.getDetailNoticeByNo(no) ;
	}
	
	@Override
	public void addNotice(NoticeDto addNotice) {
		// 공지 등록 
		 noticeDao.insertNotice(addNotice);
		 
	}
	
	@Override
	public void deleteNotice(int no) {
		// 공지사항 삭제 
		noticeDao.deleteNotice(no);
	}
	
	@Override
	public void increaseHit(int no) {
		// 조회수 증가 
		noticeDao.increaseHit(no);
		
	}

	@Override
	public void changeNotice(int no) {
		// 공지사항 수정 
		noticeDao.changeNotice(no);
		
	}


}
