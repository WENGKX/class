package cn.edu.scau.dao;

import java.util.List;

import cn.edu.scau.bean.Message;

public interface MessageMapper {

	public void saveMessage(Message message);

	public List<Message> getAllMessage();

	public Message getMessageByMno(Integer mno);

	public void deleteByMno(Integer mno);

	public List<Message> getMessageBySno(String sno);

}
