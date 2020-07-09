package edu.homeEducation.serviceDao;

import edu.homeEducation.model.PasswordResetToken;

public interface PasswordResetPasswordServiceDao {

	PasswordResetToken findByToken(String token);
	boolean addToken(PasswordResetToken resetToken);
	boolean deleteToken(PasswordResetToken resetToken);
}
