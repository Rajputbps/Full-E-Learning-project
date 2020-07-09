package edu.homeEducation.daoImpl;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.homeEducation.dao.PasswordResetPasswordDao;
import edu.homeEducation.model.PasswordResetToken; 

@Transactional
@Repository
public class PasswordResetPasswordDaoImpl implements PasswordResetPasswordDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	public PasswordResetToken findByToken(String token) { 
		PasswordResetToken resetToken = (PasswordResetToken) sessionFactory.getCurrentSession().createQuery("from PasswordResetToken where token =" + "'" + token + "'").uniqueResult();
		return resetToken;
	}

	public boolean addToken(PasswordResetToken resetToken) { 
		sessionFactory.getCurrentSession().save(resetToken);
		return true;
	}

	public boolean deleteToken(PasswordResetToken resetToken) { 
		sessionFactory.getCurrentSession().delete(resetToken);
		return true;
	}

}
