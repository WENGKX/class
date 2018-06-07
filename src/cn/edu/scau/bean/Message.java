package cn.edu.scau.bean;


public class Message {
	private Integer mno;
	private String mmessage;
	private String mdate;
	private Student student;
	
	
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Message(Integer mno, String mmessage, String mdate, Student student) {
		super();
		this.mno = mno;
		this.mmessage = mmessage;
		this.mdate = mdate;
		this.student = student;
	}


	public Integer getMno() {
		return mno;
	}


	public void setMno(Integer mno) {
		this.mno = mno;
	}


	public String getMmessage() {
		return mmessage;
	}


	public void setMmessage(String mmessage) {
		this.mmessage = mmessage;
	}


	public String getMdate() {
		return mdate;
	}


	public void setMdate(String mdate) {
		this.mdate = mdate;
	}


	public Student getStudent() {
		return student;
	}


	public void setStudent(Student student) {
		this.student = student;
	}


	@Override
	public String toString() {
		return "Message [mno=" + mno + ", mmessage=" + mmessage + ", mdate=" + mdate + ", student=" + student + "]";
	}
	
	
	
}
