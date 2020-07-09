package edu.homeEducation.serviceDaoImpl;

 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.EmailDao;
import edu.homeEducation.model.Mail;
import edu.homeEducation.serviceDao.EmailServiceDao;

@Service
public class EmailServiceDaoImpl implements EmailServiceDao{

	  @Autowired
	  private EmailDao emailDao;

		public void sendEmail(Mail mail, String html) {
			emailDao.sendEmail(mail, html);
		}
}
