package cn.edu.scau.bean;

public class Mc {
	private Message message;
	private Comment comment;
	
	public Mc() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Mc(Message message, Comment comment) {
		super();
		this.message = message;
		this.comment = comment;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "Mc [message=" + message + ", comment=" + comment + "]";
	}

}
