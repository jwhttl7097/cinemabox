package com.cinemabox.service.theater;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.CustomerCenterDao;
import com.cinemabox.dto.AnswerDto;
import com.cinemabox.vo.Question;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired CustomerCenterDao questionDao;
	
	@Override
	public List<Question> getQuestionByName(String name, String email) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		userInfo.put("name", name);
		userInfo.put("email", email);
		
		return null;
	}
	
	@Override
	public void insertAnswer(AnswerDto answer) {
		
	}
	
	
}