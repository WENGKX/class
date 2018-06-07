package cn.edu.scau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.scau.bean.Comment;
import cn.edu.scau.dao.CommentMapper;

@Service
public class CommentService {
	
	@Autowired
	private CommentMapper commentMapper;

	public List<Comment> getAllcommentByBz() {
		// TODO Auto-generated method stub
		return commentMapper.getAllcommentByBz();
	}
	
	public Comment getCommentByCno(String cno) {
		return commentMapper.getCommentByCno(cno);
	}
	
	public List<Comment> getCommentsByMno(Integer mno) {
		// TODO Auto-generated method stub
		return commentMapper.getCommentsByMno(mno);
	}

	public void deleteByCno(String cno) {
		// TODO Auto-generated method stub
		commentMapper.deleteByCno(cno);
	}

	public void saveComment(Comment comment) {
		// TODO Auto-generated method stub
		commentMapper.saveComment(comment);
	}

	public List<Comment> getAllcommentByMessageSno(String sno) {
		// TODO Auto-generated method stub
		return commentMapper.getAllcommentByMessageSno(sno);
	}

	public List<Comment> getAllcomment() {
		// TODO Auto-generated method stub
		return commentMapper.getAllcomment();
	}


	
}
