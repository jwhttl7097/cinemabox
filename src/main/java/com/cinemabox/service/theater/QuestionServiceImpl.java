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
	
	@Autowired Question question;
	
	@Override
	public List<Question> getQuestionByName(String name, String email) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		userInfo.put("name", name);
		userInfo.put("email", email);
		
		return null;
	}
	
	@Override
	public void updateQuestion(int questionNo) {
		HashMap<String, Object> content = new HashMap<String, Object>();
		content.put("state",question.isState());
		content.put("satisfaction",question.getSatisfaction());
		content.put("questionNo",questionNo);
	}
	
	
}
	
