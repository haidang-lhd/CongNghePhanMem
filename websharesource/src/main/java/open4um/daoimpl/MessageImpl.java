package  open4um.daoimpl;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import  open4um.config.ConnectionFactory;
import  open4um.dao.MessageDao;
import  open4um.vo.Message;

@Repository
public class MessageImpl implements MessageDao {
	public List<Message> selectAll(int id){
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Message> list = session.selectList("mappers.messageMapper.selectAll", id);
		session.commit();
		session.close();
		return list;
	}

	@Override
	public List<Message> selectMessage(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Message> list = session.selectList("mappers.messageMapper.selectMessage", id);
		session.commit();
		session.close();
		return list;
	}

	@Override
	public Message selectOne(int id) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		Message list = session.selectOne("mappers.messageMapper.selectOne", id);
		session.commit();
		session.close();
		return list;
	}
	@Override
	public List<Message> selectChatting(int senduserid, int receiveuserid) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("senduserid", senduserid);
		param.put("receiveuserid", receiveuserid);
		SqlSession session = ConnectionFactory.getInstance().openSession();
		List<Message> list = session.selectList("mappers.messageMapper.selectChatting", param);
		session.commit();
		session.close();
		return list;
	}

	@Override
	public void insert(Message message) {
		SqlSession session = ConnectionFactory.getInstance().openSession();
		session.insert("mappers.messageMapper.insert", message);
		session.commit();
		session.close();
	}
}
