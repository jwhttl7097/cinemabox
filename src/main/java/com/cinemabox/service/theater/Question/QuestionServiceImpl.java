package com.cinemabox.service.theater.Question;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinemabox.dao.Question.CustomerCenterDao;
import com.cinemabox.dto.Question.AnswerDto;
import com.cinemabox.dto.Question.QuestionDto;
import com.cinemabox.vo.Question;


@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired CustomerCenterDao customerDao;

	
	@Override
	public List<Question> getQuestionByName(String name, String email) {
		// 나의 문의 내역 조회한다.
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		userInfo.put("name", name);
		userInfo.put("email", email);
		
		//위의 USERINFO 파라미터를 DAO에전달한다. 그리고 문의목록을 전달받아 변수에 저장한다.
		List<Question> questionList = customerDao.getQuestionByName(userInfo);
		
		// 문의리스트를 반환한다.
		return questionList;
	}
	
	@Override
	public void updateSatisfaction(Question question) {
		// 만족도 추가한다.
		
		customerDao.updateSatisfaction(question);
	}
	
	@Override
	public Question detailQuestion(int no) {
		// 문의, 답변 상세 조회한다. 
		return customerDao.getQuestionByNo(no);
	}
	
	@Override
	public void addQuestion(QuestionDto question) {
		// 새 문의 등록한다.
		customerDao.insertQuestion(question);
	}
	
	@Override
	public void deleteQuestion(int questionNo) {
		// 문의 삭제한다. 	
		customerDao.deleteQuestion(questionNo);
		
	}
	
	@Override
	public void addAnswer(AnswerDto answer) {
		// 답변 등록함 (update)
		customerDao.insertAnswer(answer);
		
		// 메일발송
		// 메일 전송을 위한 메일 정보 
		String userMail = answer.getEmail();
		// gmail로 보내는 권한 부여 
		Properties props = System.getProperties();
		props.put("mail.smtp.user", "abpple0405@gmail.com");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.starttls.enable","true");
		props.put( "mail.smtp.auth", "true");
		props.put("mail.smtp.debug", "true");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		// id, password를 담는다. 
		 Authenticator auth = new com.cinemabox.web.utils.MyAuthentication();
		 
		// 메일 제목, 내용 
		 String subject = "문의에 대한 답변입니다!";
		 String content = "";
		 String fromName = "cinemabox";
		  
	    // 권한 부여과 id, password를 전달할 연결 통로 
	    Session session = Session.getInstance(props, auth);
	  
	    MimeMessage msg = new MimeMessage(session); 
	    String charSet = "UTF-8";
		  
		  // 전달할 msg에 데이터 넣어주는 것 
		  try {
			  
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();
			from = new InternetAddress(new String(fromName.getBytes(charSet), "8859_1") + "<abpple0405@gmail.com>");
            msg.setFrom(from);
            
            InternetAddress to = new InternetAddress(userMail);
            msg.setRecipient(Message.RecipientType.TO, to);
            msg.setSubject(subject, "UTF-8");
            msg.setText(content, "UTF-8");  
             
            msg.setContent(content,"text/html; charset=UTF-8");
            Transport.send(msg);   
           
			
		} catch (AddressException addr_e) {  
			System.out.println("Mail Send FAIL!! 메일을 입력해주세요");
        }catch (MessagingException msg_e) {
        	System.out.println("msg_e : " + msg_e.toString());
        	System.out.println("Mail Send FAIL!! 메일을 제대로 입력해주세요.");
        } catch (UnsupportedEncodingException e) {
        	System.out.println("메일발송을 실패하였습니다. [SYSTEM]");
        }
	}
	
	
	
}
	
