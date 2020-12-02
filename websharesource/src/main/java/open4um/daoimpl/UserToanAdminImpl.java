package open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dto.UserRoleDto;
import  open4um.vo.User;

@Repository
public class UserToanAdminImpl {
	//author:Toan
	public List<User> selectUserName() {
		SqlSession session1 = ConnectionFactory.getInstance().openSession();
		List<User> list = session1.selectList("mappers.userroleMapper.selectCountUserId");
		session1.commit();
		session1.close();
		return list;
	}


public List<UserRoleDto> selectThanhviencu() {
	SqlSession session2 = ConnectionFactory.getInstance().openSession();
	List<UserRoleDto> list1 = session2.selectList("mappers.userroleMapper.selectThanhviencu");
	session2.commit();
	session2.close();
	return list1;
}
}
