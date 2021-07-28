package com.cinemabox.service.theater;

import java.util.List;

import com.cinemabox.dto.AnswerDto;
import com.cinemabox.vo.Question;

public interface QuestionService {

	

	List<Question> getQuestionByName(String name, String email);

	void insertAnswer(AnswerDto answer);

}
