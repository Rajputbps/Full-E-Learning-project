package edu.homeEducation.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.homeEducation.dao.UserDao;
import edu.homeEducation.model.Users;

@Repository
@Transactional
public class UserDaoImpl implements UserDao{

	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	public boolean addUser(Users user) { 
		sessionFactory.getCurrentSession().save(user);
		return true;
	}

	public boolean updateUser(Users user) { 
		sessionFactory.getCurrentSession().saveOrUpdate(user);
		return true;
	}

	public boolean deleteUser(Users user) { 
		sessionFactory.getCurrentSession().delete(user);
		return true;
	}

	public List<Users> getUserList() { 
		@SuppressWarnings("unchecked")
		List<Users> users = sessionFactory.getCurrentSession().createQuery("from Users").list();
		return users;
	}

	public Users getUserById(long id) { 
		Users  users = sessionFactory.getCurrentSession().get(Users.class, id);
		return users;
	}

	public Users getByEmail(String name) {
		Users list = (Users) sessionFactory.getCurrentSession().createQuery("from Users where email =" + "'" + name + "'").uniqueResult();
		return list;
	}

	public boolean login(String userName, String password, String Role_type) {  
		//Users users = (Users) sessionFactory.getCurrentSession().createQuery("select email,password from Users where email =" + "'" + userName +"'" + "AND password ="+"'"+password + "'");
		Users list = (Users) sessionFactory.getCurrentSession().createQuery("from Users where email =" + "'" + userName +"'" + "AND password ="+"'"+password + "'").uniqueResult();
		if(list.getEmail().toString().equals(userName) && list.getPassword().toString().equals(password)) {
			System.out.println("U Login in");
			return true;
		}
		else {
			return false;
		}
		 
	}

 

	public boolean existByEmail(String email) {
		Users users = (Users) sessionFactory.getCurrentSession().createQuery("from Users where email =" + "'" + email + "'").uniqueResult();
		if(users== null) {
			return false;
		}else {
			return true;	
		}
	}

	public boolean updateNewPassword(String password, long userid) { 
		sessionFactory.getCurrentSession().createQuery("UPDATE Users u SET u.password='"+password+"'"+"where u.user_id="+userid).executeUpdate();
		return true;
	}
	 

}
