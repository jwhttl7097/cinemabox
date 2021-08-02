package com.cinemabox.web.controller.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cinemabox.service.theater.Notice.NoticeService;
import com.cinemabox.vo.Notice;

@RestController // 이 친구는 rest컨트롤러에요!
@RequestMapping("/notice") // 컨트롤러의 메인 url을 지정하는 부분
public class NoticeController {
	
	@Autowired
	NoticeService noticeService; // 공지사항 서비스를 연결시키는 부분

	/*
	@PostMapping("/update") //아래 메소드의 url매핑 실제 경로는 /notice/update 가 된다.
	public void updateNotice(@RequestBody Notice notice) { 
		noticeService.changeNotice(notice);
	}*/
	
	
	
}
