package edu.homeEducation.serviceDaoImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.PasswordResetPasswordDao;
import edu.homeEducation.model.PasswordResetToken;
import edu.homeEducation.serviceDao.PasswordResetPasswordServiceDao;

@Service
public class PasswordResetPasswordServiceDaoImpl implements PasswordResetPasswordServiceDao{

	@Autowired
	private PasswordResetPasswordDao passwordDao;

	public PasswordResetToken findByToken(String token) { 
		return passwordDao.findByToken(token);
	}

	public boolean addToken(PasswordResetToken resetToken) { 
		return passwordDao.addToken(resetToken);
	}

	public boolean deleteToken(PasswordResetToken resetToken) { 
		return passwordDao.deleteToken(resetToken);
	}
}
