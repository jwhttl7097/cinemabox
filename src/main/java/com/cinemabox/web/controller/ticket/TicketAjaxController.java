package com.cinemabox.web.controller.ticket;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.dto.ticket.TicketDto;
import com.cinemabox.service.Ticket.TicketService;

@Controller
@RequestMapping("/ticketing")
public class TicketAjaxController {

	@Autowired TicketService ticketService;
	
	//영화목록 불러오기
	@RequestMapping("/movie")
	public @ResponseBody ResponseEntity<List<TicketDto>> movieList
	(@RequestParam(value="sort",required = false)String sort, @RequestParam(value="theaterNo",required = false) int theaterNo){
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("sort",sort);
		map.put("theaterNo",theaterNo);
		List<TicketDto> movieList = ticketService.getMovieListByTheaterNo(map);
		return new ResponseEntity<List<TicketDto>>(movieList, HttpStatus.OK);
	}
	
	//선택한 영화 시간 불러오기
	@RequestMapping("/time")
	public @ResponseBody ResponseEntity<List<TicketDto>> movieTime
	(//@RequestParam(value="hallNo",required = false) int hallNo
	@RequestParam(value="theaterNo",required = false) int theaterNo
	,@RequestParam(value="movieNo",required = false)int movieNo
	,@RequestParam(value="screeningDate",required = false) @DateTimeFormat(pattern = "yyyyMMdd") Date screeningDate){
		HashMap<String, Object> map = new HashMap<String, Object>();
		//map.put("hallNo",hallNo);
		map.put("theaterNo",theaterNo);
		map.put("movieNo",movieNo);
		map.put("screeningDate",screeningDate);
		List<TicketDto> movieTime = ticketService.getMovieTime(map);
		return new ResponseEntity<List<TicketDto>>(movieTime, HttpStatus.OK);
	}
	
	//선택한 시간의 영화 정보 및 좌석 정보 불러오기
	@RequestMapping("/selectMovie")
	public @ResponseBody ResponseEntity<Map<String, Object>> movieAndSeat
	(@RequestParam(value="theaterNo",required = false) int theaterNo
	,@RequestParam(value="movieNo",required = false)int movieNo
	,@RequestParam(value="screeningDate",required = false) @DateTimeFormat(pattern = "yyyyMMdd") Date screeningDate
	,@RequestParam(value="time",required = false) String time
	,@RequestParam(value="screeningNo",required = false)int screeningNo){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("theaterNo",theaterNo);
		map.put("movieNo",movieNo);
		map.put("screeningDate",screeningDate);
		map.put("time",time);
		TicketDto movieInfo = ticketService.getMovieByTime(map);

		List<TicketDto> ticketInfo = ticketService.getTicketStatusByScreeningNo(screeningNo);
		
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("movieInfo", movieInfo);
		info.put("ticketInfo", ticketInfo);
		
		return new ResponseEntity<Map<String, Object>>(info, HttpStatus.OK);
	}
	
	// websocket Ajax 좌석 클릭시 동작
	@RequestMapping("/webSeat")
	public @ResponseBody ResponseEntity<Void> webSocketAjax(@RequestParam("screeningNo") int screeningNo,
					@RequestParam("col") String col, @RequestParam("row") String row){
		try {
//			User user = (User) SessionUtils.getAttribute("LOGINED_USER");
//			if (user == null) {
//				throw new RuntimeException("로그인이 필요합니다.");
//			}
			ticketService.webSocketAjax(screeningNo, col, row);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (RuntimeException ex) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
