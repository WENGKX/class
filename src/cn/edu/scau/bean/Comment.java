package cn.edu.scau.bean;

public class Comment {
	private String cno;
	private String cmessage;
	private String cdate;
	private Student student;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Comment(String cno, String cmessage, String cdate, Student student) {
		super();
		this.cno = cno;
		this.cmessage = cmessage;
		this.cdate = cdate;
		this.student = student;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getCmessage() {
		return cmessage;
	}

	public void setCmessage(String cmessage) {
		this.cmessage = cmessage;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@Override
	public String toString() {
		return "Comment [cno=" + cno + ", cmessage=" + cmessage + ", cdate=" + cdate + ", student=" + student + "]";
	}

	
	
}
