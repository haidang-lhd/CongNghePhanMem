package  open4um.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import  open4um.daoimpl.MessageToanImpl;
import  open4um.vo.Message;

@Service
public class MessageToanAdminService {

	@Autowired
	private MessageToanImpl impl;
	public List<Message> selectMessageName() {
		// TODO Auto-generated method stub
		List<Message> list2 = impl.selectMessageName();
		return list2;
	}

}
