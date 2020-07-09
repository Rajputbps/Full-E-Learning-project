package edu.homeEducation.serviceDaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.UserDao;
import edu.homeEducation.model.Users;
import edu.homeEducation.serviceDao.UserServiceDao;

@Service
public class UserServiceDaoImpl implements UserServiceDao{
	
	@Autowired
	private UserDao userDao;

	public boolean addUser(Users user) { 
		return userDao.addUser(user);
	}

	public boolean updateUser(Users user) { 
		return userDao.updateUser(user);
	}

	public boolean deleteUser(Users user) { 
		return userDao.deleteUser(user);
	}

	public List<Users> getUserList() {
		// TODO Auto-generated method stub
		return userDao.getUserList();
	}

	public Users getUserById(long id) { 
		return userDao.getUserById(id);
	}

	public Users getByEmail(String name) { 
		return userDao.getByEmail(name);
	}

	public boolean login(String userName, String password, String Role_type) { 
		return userDao.login(userName, password, Role_type);
	}
 

	public boolean existByEmail(String email) { 
		return userDao.existByEmail(email);
	}

	public boolean updateNewPassword(String password, long userid) { 
		return userDao.updateNewPassword(password, userid);
	}
 

}
