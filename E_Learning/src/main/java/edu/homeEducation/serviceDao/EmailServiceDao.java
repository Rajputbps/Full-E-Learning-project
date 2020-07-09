package edu.homeEducation.serviceDao;

import edu.homeEducation.model.Mail;

public interface EmailServiceDao {
	public void sendEmail(Mail mail,String html);
}
