package com.cinemabox.web.controller.user;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cinemabox.form.user.UserRegisterForm;
import com.cinemabox.service.user.UserService;
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
