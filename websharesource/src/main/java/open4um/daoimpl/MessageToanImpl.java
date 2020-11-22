package  open4um.daoimpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dao.MessageToanAdminDAO;
import open4um.vo.Message;
@Repository
public class MessageToanImpl implements MessageToanAdminDAO{
	public List<Message> selectMessageName() {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		return session.selectList("mappers.messageMapper.selectAll");
	}
}
