package com.cinemabox.service.user;

import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cinemabox.dao.user.UserDao;
import com.cinemabox.vo.User;
import com.cinemabox.web.utils.SessionUtils;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	@Autowired UserDao userDao;
	
	@Override
	public void registerUser(User user) {
		User savedUser = userDao.getUserById(user.getId());
		if(savedUser !=null) {
			throw new RuntimeException("["+user.getId()+"]는 이미 사용중인 아이디입니다.");
		}
		
		savedUser = userDao.getUserByEmail(user.getEmail());
		if(savedUser !=null) {
			throw new RuntimeException("["+user.getEmail()+"]는 이미 사용중인 아이디입니다.");
		}
		
		String secretPassword = DigestUtils.sha256Hex(user.getPassword());
		user.setPassword(secretPassword);
		
		userDao.insertUser(user);
	}
	
	@Override
	public void login(String id, String password) {
		User user = userDao.getUserById(id);
		if (user == null) {
			throw new RuntimeException("아이디 혹은 비밀번호가 유효하지 않습니다.");
		}
		
		if (!"ACTIVE".equalsIgnoreCase(user.getStatus())) {
			throw new RuntimeException( "탈퇴 혹은 일시정지 처리된 사용자입니다.");
		}
		
		String secretPassword = DigestUtils.sha256Hex(password);
		if (!user.getPassword().equals(secretPassword)) {
			throw new RuntimeException("아이디 혹은 비밀번호가 유효하지 않습니다.");
		}
		
		SessionUtils.addAttribute("LOGINED_USER", user);
	}
	
	@Override
	public void kakaoLogin(String userId) {
		
		User user = userDao.getUserById(userId);
		
		//사용자가 존재하지 않을 경우
		if(user ==null) {
			user.setId(userId);
			userDao.insertUser(user);
		}
		
		//사용자가 존재할 경우 바로 로그인
		SessionUtils.addAttribute("LOGINED_USER", user);
	}
	
	@Override
	public Map<String, Object> getUserDetail(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
}
