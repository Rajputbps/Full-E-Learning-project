package edu.homeEducation.dao;

import edu.homeEducation.model.Mail;

public interface EmailDao {

	public void sendEmail(Mail mail,String html);
}
