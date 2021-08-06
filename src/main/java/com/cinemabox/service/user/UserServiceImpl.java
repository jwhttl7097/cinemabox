package com.cinemabox.service.user;

import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cinemabox.dao.user.UserDao;
import com.cinemabox.vo.User;

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
	public void login(String userId, String userPassword) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public Map<String, Object> getUserDetail(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
}
