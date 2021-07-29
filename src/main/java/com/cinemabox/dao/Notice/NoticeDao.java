package com.cinemabox.dao.Notice;

import java.util.HashMap;
import java.util.List;

public interface NoticeDao {
	
	/**
	 * 전체공지사항 조회 
	 * @return no
	 */
	List<NoticeDao> getNoticeByNo(int no);
	
	/**
	 * 번호로 공지사항 상세 조회 
	 * @return
	 */
	NoticeDao getDetailNoticeByNo(int no);
	
	/**
	 * 공지하기 
	 * @param notice
	 */
	void insertNotice(NoticeDao notice);
	
	/**
	 *  지정된 번호로 공지 내용 삭제하기 
	 * @param no
	 */
	void deleteNotice(int no);
	
	/**
	 * 중요한 공지 상단으로 올리기 
	 * @param importNotice
	 */
	void updateImportNotice(HashMap<String, Object> importNotice);
	
	
	

}
