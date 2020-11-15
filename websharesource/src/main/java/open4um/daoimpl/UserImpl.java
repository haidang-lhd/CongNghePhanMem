package open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dao.UserDao;
import  open4um.dto.UserLoginDto;
import  open4um.vo.RoleUser;
import  open4um.vo.User;

/*
 * 
 */
@Repository
public class UserImpl implements UserDao {


	public int insertUser(User user) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		int row = session.insert("mappers.userMapper.insertUser", user);
		session.commit();
		session.close();
		return row;
	}

	public int insertUserFB(User user) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		int row = session.insert("mappers.userMapper.insertUserFB", user);
		session.commit();
		session.close();
		return row;
	}

	public User selectUser(String us) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		User user = session.selectOne("mappers.userMapper.selectOne", us);
		session.commit();
		session.close();
		return user;
	}

	public int insertRoleUser(RoleUser roleUser) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		int row = session.insert("mappers.roleuserMapper.insertRoleUser", roleUser);
		session.commit();
		session.close();
		return row;
	}

	public List<UserLoginDto> selectLogin(String username) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<UserLoginDto> list = session.selectList("mappers.userLoginMapper.selectLogin", username);
		session.commit();
		session.close();
		return list;
	}

	@Override
	public User selectUserFB(String fbid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		User user = session.selectOne("mappers.userMapper.selectUserFB", fbid);
		session.commit();
		session.close();
		return user;
	}

	@Override
	public List<UserLoginDto> selectLoginFB(String fbid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<UserLoginDto> list = session.selectList("mappers.userLoginMapper.selectLoginFB", fbid);
		session.commit();
		session.close();
		return list;
	}

	@Override
	public List<UserLoginDto> selectLoginGmail(String id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<UserLoginDto> list = session.selectList("mappers.userLoginMapper.selectLoginGmail", id);
		session.commit();
		session.close();
		return list;
	}

//Thong profile
	@Override
	public User selectProfile(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		User list = session.selectOne("mappers.userMapper.selectProfile", id);
		session.commit();
		session.close();
		return list;
	}

	public void update(User user) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.update("mappers.userMapper.update", user);
		session.commit();
		session.close();
	}
	public User selectOne(String username) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		User list = session.selectOne("mappers.userMapper.selectOne", username);
		session.commit();
		session.close();
		return list;
	}
 
	/*
	 * author nguyenthai
	 */
	@Override
	public void insertUserGmail(User user) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.userMapper.insertUserGmail", user);
		session.commit();
		session.close();
	}

	@Override
	public User selectUserGmail(String emailid) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		User user = session.selectOne("mappers.userMapper.selectUserGmail", emailid);
		session.commit();
		session.close();
		return user;
	}

	@Override
	public void insertRoleUserGmail(RoleUser roleUser) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.roleuserMapper.insertRoleUser", roleUser);
		session.commit();
		session.close();
	}

	//Chi admin-load user
		@Override
		public List<UserLoginDto> findAll() {
			SqlSession session = ConnectionFactory.getInstance().openSession();
			List<UserLoginDto> list = session.selectList("mappers.userLoginMapper.selectAll");
			session.commit();
			session.close();
			return list;
		}

		@Override
		public List<UserLoginDto> findOneByRole(int id) {
			SqlSession session = ConnectionFactory.getInstance().openSession();
			return session.selectList("mappers.userLoginMapper.selectOneByRole", id);
		}

		@Override
		public void update(UserLoginDto userdto) {
			SqlSession session = ConnectionFactory.getInstance().openSession();
			session.update("mappers.userLoginMapper.update", userdto);
			session.commit();
		}

		@Override
		public List<UserLoginDto> search(String username) {
			SqlSession session = ConnectionFactory.getInstance().openSession();
			return session.selectList("mappers.userLoginMapper.selectCount", username);
		}

		public List<User> selectAll() {
			SqlSession session = ConnectionFactory.getInstance().openSession();
			List<User> list =session.selectList("mappers.userLoginMapper.selectAll");
			session.commit();
			session.close();
			return list;
		}
 

}
