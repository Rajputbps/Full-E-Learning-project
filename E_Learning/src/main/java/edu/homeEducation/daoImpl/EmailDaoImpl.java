package edu.homeEducation.daoImpl;

import java.nio.charset.StandardCharsets;

import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;
import org.thymeleaf.context.Context;

import edu.homeEducation.dao.EmailDao;
import edu.homeEducation.model.Mail;

@Repository
@Transactional
public class EmailDaoImpl implements EmailDao{

	@Autowired 
	private JavaMailSender mailSender; 
	
	public void sendEmail(Mail mail, String html) {
		 try {
				
			 MimeMessage message = mailSender.createMimeMessage();
			 MimeMessageHelper messageHelper = new MimeMessageHelper(message,MimeMessageHelper.MULTIPART_MODE_MIXED_RELATED,StandardCharsets.UTF_8.name());
			 Context context = new Context();
			 context.setVariables(mail.getModel());
			  
			 messageHelper.setTo(mail.getTo());
	            messageHelper.setText("<br><p>We heard that you lost your E_Learning.com password.Sorry about that!</p><br>"
	            		+ "But don't worry! Click on the image for reset the password: <br>"
	            		+ "<a href="+ html + "><img src='https://imgur.com/pS2MqwR.png'></a>"
	            				+ "<br><p>If you  don't use this link within 24 hours, it will expire. To get a new password reset link , visit <a href='http://localhost:8090/E_Learing_Final/'>www.E_Learning.com</a>"
	            				+ "<br><br>"
	            				+ "Thanks,<br>The E_Learning.com Team.", true);
	            messageHelper.setSubject(mail.getSubject());
	            messageHelper.setFrom(mail.getFrom());
	            mailSender.send(message);
			 
		} catch (Exception e) {
			 
			throw new RuntimeException(e);
		}
		
		
	
		
	}

}
