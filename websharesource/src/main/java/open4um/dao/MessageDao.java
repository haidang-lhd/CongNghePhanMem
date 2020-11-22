package  open4um.dao;

import java.util.List;

import  open4um.vo.Message;

public interface MessageDao {
	public List<Message> selectAll(int id);
	
	public List<Message> selectMessage(int id);
	
	public Message selectOne(int id);
	public List<Message> selectChatting(int senduserid, int receiveuserid);
	public void insert(Message message);
}
