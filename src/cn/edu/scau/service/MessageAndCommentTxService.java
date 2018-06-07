package cn.edu.scau.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.scau.bean.Comment;
import cn.edu.scau.bean.Mc;

@Service
public class MessageAndCommentTxService {
	
	@Autowired
	private CommentService commentService;
	@Autowired
	private McService mcService;
	@Autowired
	private MessageService messageService;
	
	//�ظ�����
	@Transactional
	public void replyMessage(Comment comment,Mc mc) {
		commentService.saveComment(comment);
		mcService.saveMc(mc);
	}
	
	//ɾ������
	@Transactional
	public void delMessage(Integer mno,List<Comment> comments) {
		mcService.deleteByMno(mno);
		messageService.deleteByMno(mno);
		for (Comment comment : comments) {
			commentService.deleteByCno(comment.getCno());
		}
	}
	
	//ɾ���ҵ�����
	@Transactional
	public void delMesBySelf(Integer mno, List<Mc> mcs) {
		mcService.deleteByMno(mno);
		messageService.deleteByMno(mno);
		for (Mc mc : mcs) {
			String cno = mc.getComment().getCno();
			commentService.deleteByCno(cno);
		}
	}
}
