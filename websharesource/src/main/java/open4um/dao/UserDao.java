package open4um.dao;

import java.util.List;

import tp.kits3.open4um.dto.UserLoginDto;
import tp.kits3.open4um.vo.RoleUser;
import tp.kits3.open4um.vo.User;

/*
 * 
 */
public interface UserDao {
	public int insertUser(User user);

	public int insertUserFB(User user);

	public User selectUser(String us);

	public int insertRoleUser(RoleUser roleUser);

	public List<UserLoginDto> selectLogin(String username);

	public List<UserLoginDto> selectLoginFB(String fbid);

	public User selectUserFB(String fbid);

	public void insertUserGmail(User user);

	public User selectUserGmail(String emailid);

	public List<UserLoginDto> selectLoginGmail(String gmail);
	//Thong profile
	public User selectProfile(int id); 
	public void update (User user);
	public User selectOne(String username);
	public List<User> selectAll();
	//Chi admin-load user
		public List<UserLoginDto> findAll();
		public List<UserLoginDto> findOneByRole(int id);
		public void update(UserLoginDto userdto);
		public List<UserLoginDto> search(String username);
	public void insertRoleUserGmail(RoleUser roleUser);

}
