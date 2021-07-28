package com.cinemabox.service.theater.Notice;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.Notice.NoticeDao;
import com.cinemabox.vo.Notice;


@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired NoticeDao noticeDao;
	@Autowired Notice notice;
	
	@Override
	public List<NoticeDao> getNoticeByNo(int no){
		return null;
	}
	
	@Override
	public NoticeDao detailNoticeByNo(int no) {
		return null;
	}
	
	@Override
	public void addNotice(NoticeDao notice) {
		
	}
	
	@Override
	public void deleteNotice(int no) {
		
	}
	
	@Override
	public void importNotice(int no) {
		// 중요도 추가한다
		HashMap<String, Object> updateImport = new HashMap<String, Object>();
		updateImport.put("important",notice.getImportant());
		updateImport.put("no",no);
		
		noticeDao.updateImportNotice(updateImport);
		
	}


}
