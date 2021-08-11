package com.cinemabox.web.controller.user;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cinemabox.form.user.UserRegisterForm;
import com.cinemabox.service.user.UserService;
import com.cinemabox.vo.User;
import com.cinemabox.web.utils.SessionUtils;

@Controller
public class UserController {

	@Autowired UserService userService;
	
	@GetMapping(path = {"/login"})
	public String login() {
		return "user/loginForm";	
	}
	
	@PostMapping("/login")
	public String login(@RequestParam("id") String userId, @RequestParam("password") String userPassword) {
		
		userService.login(userId, userPassword);
		
		// 로그인 전 페이지로 되돌아가기
		String returnPath = (String) SessionUtils.getAttribute("returnPath");
		SessionUtils.removeAttribute("returnPath");
		if (returnPath != null) {
			return "redirect:" + returnPath;
		}
		
		return "redirect:home";
	}
	
	/*
	@PostMapping("/loginKakao")
	public String login(@RequestParam("id") String kakaoId, @RequestParam("name") String kakaoName, 
						@RequestParam("birth") String kakaoBirth, @RequestParam("isKakao") String isKakao) {
		
		userService.login(userId, userPassword);
		
		userService.kakaoLogin();
		//-->isKakao Y --> 
		
		//카카오로그인을~.~ 클릭했을때 DB에 있는지 없는지도 확인해야함..!
		
		return "redirect:home";
	}
	*/
	
	
	@GetMapping(path = {"/register"})
	public String register() {
		return "user/registerForm";	
	}
	
	@PostMapping("/register")
	public String register(UserRegisterForm userRegisterForm) {
		// User객체를 생성하고, UserRegisterForm의 값을 User객체로 복사한다.
		User user = new User();
		BeanUtils.copyProperties(userRegisterForm, user);
		
		// UserService의 registerUser(user)를 호출해서 업무로직을 수행한다. 
		userService.registerUser(user);
				
		return "redirect:register";
	}
	
	
	@GetMapping(path = {"/myPage"})
	public String myPage() {
		return "user/myPage";	
	}
	
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.destroySession();
		
		// 로그아웃 전 페이지로 되돌아가기
		String returnPath = (String) SessionUtils.getAttribute("returnPath");
		SessionUtils.removeAttribute("returnPath");
		if (returnPath != null) {
			return "redirect:" + returnPath;
		}
		
		return "redirect:home";
	}
}
