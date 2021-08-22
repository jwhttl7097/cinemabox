package com.cinemabox.web.controller.user;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.dto.user.UserDto;
import com.cinemabox.form.user.UserRegisterForm;
import com.cinemabox.service.movie.MovieService;
import com.cinemabox.service.user.UserService;
import com.cinemabox.vo.Movie;
import com.cinemabox.vo.User;
import com.cinemabox.web.utils.SessionUtils;

@Controller
public class UserController {

	@Autowired UserService userService;
	
	@GetMapping(path = {"/register"})
	public String register() {
		return "user/registerForm";	
	}
	
	@PostMapping("/register")
	public String register(UserRegisterForm userRegisterForm) {
		// User객체를 생성하고, UserRegisterForm의 값을 User객체로 복사한다.
		User user = new User();
		BeanUtils.copyProperties(userRegisterForm, user);
		user.setAddress(userRegisterForm.getAddress() + " " + userRegisterForm.getAddress2());
		// UserService의 registerUser(user)를 호출해서 업무로직을 수행한다. 
		userService.registerUser(user);
				
		return "redirect:register";
	}
	
	
	@RequestMapping("/myPage")
	public String myPage(Model model) {
		User user = (User) SessionUtils.getAttribute("LOGINED_USER");
		
		//쿠폰함
		
		
		//찜한 영화
		List<UserDto> wishlists = userService.getwishListById(user.getId());
		
		//찜한 영화 개수 가져오기
		int countWishlist = userService.countWishlists(user.getId());
		
		//무비노트
		
		
		model.addAttribute("wishlists", wishlists);
		model.addAttribute("countWish", countWishlist);
		
		return "user/myPage";	
	}
	
	
	
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.destroySession();

		return "redirect:home";
	}
}
