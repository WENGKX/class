package cn.edu.scau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.scau.bean.Message;
import cn.edu.scau.dao.MessageMapper;

@Service
public class MessageService {

	@Autowired
	private MessageMapper messageMapper;
	
	public void saveMessage(Message message) {
		// TODO Auto-generated method stub
		messageMapper.saveMessage(message);
	}

	public List<Message> getAllMessage() {
		// TODO Auto-generated method stub
		return messageMapper.getAllMessage();
	}
	
	public Message getMessageByMno(Integer mno) {
		return messageMapper.getMessageByMno(mno);
	}

	public void deleteByMno(Integer mno) {
		// TODO Auto-generated method stub
		messageMapper.deleteByMno(mno);
	}

	public List<Message> getMessageBySno(String sno) {
		// TODO Auto-generated method stub
		return messageMapper.getMessageBySno(sno);
	}

}
