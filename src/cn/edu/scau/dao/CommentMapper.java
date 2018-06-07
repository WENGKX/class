package cn.edu.scau.dao;

import java.util.List;

import cn.edu.scau.bean.Comment;

public interface CommentMapper {

	public List<Comment> getAllcommentByBz();

	public Comment getCommentByCno(String cno);
	
	public List<Comment> getCommentsByMno(Integer mno);

	public void deleteByCno(String cno);

	public void saveComment(Comment comment);

	public List<Comment> getAllcommentByMessageSno(String sno);

	public List<Comment> getAllcomment();


}
