package edu.homeEducation.serviceDao;

import java.util.List;

import edu.homeEducation.model.Users;

public interface UserServiceDao {

	boolean addUser(Users user);
	boolean updateUser(Users user);
	boolean deleteUser(Users user);
	List<Users> getUserList();
	Users getUserById(long id);
	public Users getByEmail(String name);
	public boolean login(String userName,String password,String Role_type); 
	boolean existByEmail(String email);
	boolean updateNewPassword(String password,long userid);
}
