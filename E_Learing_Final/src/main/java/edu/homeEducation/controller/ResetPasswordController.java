package edu.homeEducation.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.homeEducation.model.Mail;
import edu.homeEducation.model.PasswordResetToken;
import edu.homeEducation.model.Users;
import edu.homeEducation.serviceDao.EmailServiceDao;
import edu.homeEducation.serviceDao.PasswordResetPasswordServiceDao;
import edu.homeEducation.serviceDao.UserServiceDao;

@Controller
public class ResetPasswordController {

	@Autowired
	private UserServiceDao userServiceDao;
	
	@Autowired
	private EmailServiceDao emailServiceDao;
	
	@Autowired
	private PasswordResetPasswordServiceDao passwordResetTokenDaoRepository;
	
	@Autowired 
	private BCryptPasswordEncoder passwordEncoder;
	
	
	@PostMapping("/resetPassword")
	public @ResponseBody String resetPassword(HttpServletRequest request) {
		String userEmail = request.getParameter("resetemail");
		System.out.println("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh "+userEmail);
		Users users = userServiceDao.getByEmail(userEmail);
		if(users == null){
			throw new UsernameNotFoundException(userEmail);
		}
		else {
			PasswordResetToken resetToken  =new PasswordResetToken();
			 resetToken.setToken(UUID.randomUUID().toString());
			 resetToken.setUsers(users); 
			 resetToken.setExpiryDate(30);
			 passwordResetTokenDaoRepository.addToken(resetToken);
			 Mail mail = new Mail();
			 mail.setFrom("rajputsoftwaredeveloper@gmail.com");
			 mail.setTo(users.getEmail());
			 mail.setSubject("Password reset request");
			 
			 Map<String, Object> model =  new HashMap<String, Object>();
			 model.put("token", resetToken);
			 model.put("users", users);
			 model.put("signature", "https://ELearning.com");
			 String url = request.getScheme() + "://" + request.getServerName() + ":" + "8090"+"/E_Learing_Final/"+"passwordReset"+resetToken.getToken();
			 model.put("resetUrl", url + "reset-password?token=" + resetToken.getToken());
			 System.out.println("          "+url);
		        mail.setModel(model);
		        emailServiceDao.sendEmail(mail,url);
			
		}
		return null;
	}
	
	
	
	@PostMapping("newPaswsword")
	public String fornewPassword(HttpServletRequest request,Model  model) {
		String newPassword=request.getParameter("newPasswordField");
		String resettoken=request.getParameter("token");
		System.out.println(newPassword + "------------" + resettoken); 
		PasswordResetToken passwordResetToken = passwordResetTokenDaoRepository.findByToken(resettoken);
		if(passwordResetToken==null) {
			System.out.println("Token not found!");
			model.addAttribute("messages", "Token not found! Plz. re-send the email");
			return "message";
		}
		else if (passwordResetToken.isExpired()) {
			System.out.println("token expired!");
			model.addAttribute("messages", "Token expired! Plz. re-send the email");
			return "message";
		}else {
			Users users = passwordResetToken.getUsers();
			String updatedPassword = passwordEncoder.encode(newPassword); 
			userServiceDao.updateNewPassword(updatedPassword, users.getUser_id());
			//passwordResetTokenDaoRepository.deleteToken(passwordResetToken);
			model.addAttribute("messages", "Password has been changed successfully!!!!");
			return "message";
		}	
		
	}
	
}
