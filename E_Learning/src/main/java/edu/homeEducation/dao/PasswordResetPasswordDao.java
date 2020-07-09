package edu.homeEducation.dao;

import edu.homeEducation.model.PasswordResetToken;

public interface PasswordResetPasswordDao {
	PasswordResetToken findByToken(String token);
	boolean addToken(PasswordResetToken resetToken);
	boolean deleteToken(PasswordResetToken resetToken);
}
