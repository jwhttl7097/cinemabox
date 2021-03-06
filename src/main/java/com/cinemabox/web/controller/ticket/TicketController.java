package com.cinemabox.web.controller.ticket;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.cinemabox.dao.coupon.CouponDao;
import com.cinemabox.dao.ticket.TicketDao;
import com.cinemabox.dao.user.UserDao;
import com.cinemabox.dto.ticket.TicketDto;
import com.cinemabox.service.Ticket.TicketService;
import com.cinemabox.service.coupon.CouponService;
import com.cinemabox.service.reservation.ReservationService;
import com.cinemabox.service.user.UserService;
import com.cinemabox.vo.Coupon;
import com.cinemabox.vo.Reservation;
import com.cinemabox.vo.ReservationTicket;
import com.cinemabox.vo.User;
import com.cinemabox.web.utils.SessionUtils;

@Controller
@SessionAttributes({"ticketDto"})
public class TicketController{
	@Autowired TicketService ticketService;
	@Autowired ReservationService reservationService;
	@Autowired UserService userService;
	@Autowired CouponService couponService;
	@Autowired UserDao userDao;
	@Autowired TicketDao ticketDao;
	@Autowired CouponDao couponDao;
	
	@GetMapping(path = {"/ticket"})
	public String ticket(Model model) {
		TicketDto ticketDto = new TicketDto();
		model.addAttribute("ticketDto", ticketDto);
		return "ticket/ticket";	
	}
	
	@GetMapping(path = {"/schedule"})
	public String schedule(Model model) {
		return "ticket/schedule";	
	}
	
	@PostMapping(path = {"/seat"})
	public String seat(Model model, @ModelAttribute("ticketDto") TicketDto ticketDto) throws HttpSessionRequiredException{
		List<TicketDto> seats = ticketService.getAllSeat(ticketDto.getScreeningNo());
		model.addAttribute("tickets", ticketDto);
		model.addAttribute("seats", seats);
		return "ticket/seat";	
	}
	
	@PostMapping(path = {"/payment"})
	public String payment(Model model, @ModelAttribute("ticketDto") TicketDto ticketDto) {
		// ?????? ???, ??? ????????????
		String[] cols = ticketDto.getSeatCol().split(" ");
		String[] rows = ticketDto.getSeatRow().split(" ");
		String seat = "";
		for(int i=0;i < cols.length; i++ ) {
			seat += cols[i];
			seat += rows[i];
			seat += " ";
		}
		model.addAttribute("seat", seat);
		// ?????? ????????????
		User loginUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		List<Coupon> coupons = couponDao.getAllMyCoupon(loginUser.getId());
		model.addAttribute("coupons", coupons);
		// ????????? ????????????
		User user = userDao.getUserById(loginUser.getId());
		model.addAttribute("user", user);
		model.addAttribute("tickets", ticketDto);
		return "ticket/payment";
	}
	
	@PostMapping(path = {"/complete"})
	public String complete(Model model, @ModelAttribute("ticketDto") TicketDto ticketDto, SessionStatus sessionStatus, Reservation reservation) {
		System.out.println("====="+ticketDto.toString());
		System.out.println("====="+reservation.toString());
		// ????????? ?????? ?????? ?????? ?????? ?????? //
		if(!(reservation.getSerialNo().isEmpty())) {
			String serialNo = reservation.getSerialNo();
			couponService.updateUsedCoupon(serialNo);
		}
		
		// ??????????????? ??????????????? ???????????? ?????? ??????????????? ??????????????? ???????????? //
		String ticketNumber = "";
		String[] seats = ticketDto.getSeatNo().split(" ");
		for (String str : seats) {
			TicketDto tDto = new TicketDto();
			tDto.setSeatNo(str);
			tDto.setScreeningNo(ticketDto.getScreeningNo());
			TicketDto ticketDtoNo = ticketDao.getTicketNo(tDto);
			// ?????? ???????????? Y??? ???????????? //
			ticketDao.updateTicketReservationStatus(ticketDtoNo.getTicketNo());
			// ???????????? ????????? ??????????????? ???????????? ????????? ???????????? ?????? ????????? //
			ticketNumber += Integer.toString(ticketDtoNo.getTicketNo()) + " ";
		}
		// ??????????????? ??????????????? ???????????? ?????? ??????????????? ??????????????? ???????????? //
		
		// ???????????? ??? ?????? ????????? ???????????? ?????? ?????? //
		reservation.setStatus("Y");
		reservation.setPayStatus("Y");
		double point = reservation.getTotalPrice()*0.03;
		reservation.setPoint(point);
		reservation.setMovieNo(ticketDto.getMovieNo());
		reservation.setTicketNos(ticketNumber);
		reservation.setAdultCnt(ticketDto.getAdultCnt());
		reservation.setTeenagerCnt(ticketDto.getTeenagerCnt());
		reservation.setSeatNo(ticketDto.getSeatNo());
		reservation.setSeatCol(ticketDto.getSeatCol());
		reservation.setSeatRow(ticketDto.getSeatRow());
		reservation.setScreeningDate(ticketDto.getScreeningDate());
		reservation.setScreeningTime(ticketDto.getScreeningTime());
		reservation.setScreeningEndTime(ticketDto.getScreeningEndTime());
		reservation.setHallName(ticketDto.getHallName());
		reservation.setTheaterName(ticketDto.getTheaterName());
		reservation.setTitle(ticketDto.getTitle());
		reservation.setScreeningNo(ticketDto.getScreeningNo());
		reservation.setTheaterNo(ticketDto.getTheaterNo());
		reservation.setHallNo(ticketDto.getHallNo());
		reservationService.inserPayInfo(reservation);
		// ???????????? ??? ?????? ????????? ???????????? ?????? ?????? //	
		
		// ????????? ??????????????? reservation????????? reservation_ticket???????????? ???????????? //
		String[] ticketNoSplit = ticketNumber.split(" ");
		for (String ticketNo : ticketNoSplit) {
			int reservationNo = reservationService.getReservationNoByTicketNo(ticketNo);
			ReservationTicket rt = new ReservationTicket();
			rt.setReservationNo(reservationNo);
			rt.setTicketNo(Integer.parseInt(ticketNo));
			reservationService.insertTicketNoAndReservationNo(rt);
		}
		// ????????? ??????????????? reservation????????? reservation_ticket???????????? ???????????? //
		
		// user??? ????????? ?????? //
		User loginedUser = (User) SessionUtils.getAttribute("LOGINED_USER");
		User users = userDao.getUserById(loginedUser.getId());
		User user = new User();
		if(reservation.getUsedPoint() == null) {
			user.setPoint((users.getPoint() + (int) Math.round(point)));
		}else {
			user.setPoint((users.getPoint() + (int) Math.round(point))- reservation.getUsedPoint());
		}
		user.setId(reservation.getUserId());
		userService.updatePayPoint(user);
		// user??? ????????? ?????? // 
		
		// model??? ?????? ????????? ?????? ????????? ??????dto????????? ???????????? ?????? ?????? ?????? //
			// 1. ?????? ?????? ????????? ?????? //
			String[] cols = ticketDto.getSeatCol().split(" ");
			String[] rows = ticketDto.getSeatRow().split(" ");
			String seat = "";
			for(int i=0;i < cols.length; i++ ) {
				seat += cols[i];
				seat += rows[i];
				seat += " ";
			}
			// 3. ???????????? ?????? //
			int reservationNo = reservationService.getReservationNoByTicketNos(ticketNumber);
			String age = ticketDto.getAge();
		//??? ??????????????? @SessionAttributes ????????????????????? HttpSession????????? ???????????? ????????? ?????? ?????????.
		//??? ???????????????(????????????) ????????? ???????????? ???????????? ??????
		sessionStatus.setComplete(); 
		return "redirect:complete?rNo="+reservationNo+"&seat="+seat+"&age="+age;
	}
	
	@GetMapping(path = {"/complete"})
	public String completeResult(Model model, int rNo, String seat, String age) {
		Reservation rInfo = reservationService.getReservedInfoByRno(rNo);
		model.addAttribute("rInfo", rInfo);
		model.addAttribute("age", age);
		model.addAttribute("reservationNo", rNo);
		model.addAttribute("seat", seat);
		return "ticket/complete";
	}

}
