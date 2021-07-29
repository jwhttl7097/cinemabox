package com.cinemabox.dao.Notice;

import java.util.HashMap;
import java.util.List;

import com.cinemabox.vo.Notice;

public interface NoticeDao {
	
	/**
	 * 전체공지사항 조회 
	 * @return no
	 */
	List<Notice> getNoticeByNo(int no);
	
	/**
	 * 번호로 공지사항 상세 조회 
	 * @return
	 */
	Notice getDetailNoticeByNo(int no);
	
	/**
	 * 공지하기 
	 * @param notice
	 */
	void insertNotice(Notice notice);
	
	/**
	 *  지정된 번호로 공지 내용 삭제하기 
	 * @param no
	 */
	void deleteNotice(int no);
	
	/**
	 * 조회수 증가 
	 * @param importNotice
	 */
	void increaseHit(int no);
	
	/**
	 *  공지사항 수정하기 
	 * @param no
	 */
	void changeNotice(Notice notice);


}
