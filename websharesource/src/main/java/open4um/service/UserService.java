package open4um.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tp.kits3.open4um.dao.UserDao;
import tp.kits3.open4um.daoimpl.UserImpl;
import tp.kits3.open4um.dto.UserLoginDto;
import tp.kits3.open4um.vo.RoleUser;
import tp.kits3.open4um.vo.User;

/*
 * 
 */
@Service
public class UserService {

	@Autowired
	private UserImpl dao;
	
	public int insertUser(User user) {
		return dao.insertUser(user);
	}
	public int insertRoleUser(RoleUser roleUser) {
		return dao.insertRoleUser(roleUser);	
	}
	public List<UserLoginDto> selectLogin(String username) {
		UserImpl userImpt = new UserImpl();
		return userImpt.selectLogin(username);
	}
	public User selectUser(String us) {
		return dao.selectUser(us);
	}


	public List<UserLoginDto> selectLoginFB(String fbid) {
		UserImpl userImpt = new UserImpl();
		return userImpt.selectLoginFB(fbid);
	}


	public User selectUserFB(String fbid) {
		return dao.selectUserFB(fbid);
	}


	public int insertUserFB(User user) {
		return dao.insertUserFB(user);
	}
	//Thong profile
	public User selectProfile(int id) {		
		return dao.selectProfile(id) ;
	}
	public void update(User user) {
		dao.update(user);
	}
	

	public List<UserLoginDto> selectLoginGmail(String id) {
		return dao.selectLoginGmail(id);
	}
	//Chi admin-upload user

	public List<UserLoginDto> findAll() {
		return dao.findAll();
	}

	public List<UserLoginDto> findOneByRole(int id) {
		return dao.findOneByRole(id);
	}

	public void update(UserLoginDto userdto) {
		dao.update(userdto);
		
	}

	public List<UserLoginDto> search(String username) {
		return dao.search(username);
	}
	public User selectOne(String username) {
		
		return dao.selectOne(username);
	}
	
	public void insertUserGmail(User user) {
		 dao.insertUserGmail(user);
	}
	public User selectUserGmail(String emailid) {
		return dao.selectUserGmail(emailid);
	}
	public void insertRoleUserGmail(RoleUser roleUser) {
		dao.insertRoleUserGmail(roleUser);
	}
	public List<User> selectAll() {
		return dao.selectAll();
	}
	
}
